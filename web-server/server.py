#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, os
sys.path.append(os.path.dirname(__file__))
from Modelo import Usuario
from Modelo import Grupo
from Controlador import Controller
import atexit
import threading
import cherrypy
import os, os.path
import CherrypyMako
CherrypyMako.setup()


cherrypy.config.update({'environment': 'embedded'})
if cherrypy.__version__.startswith('3.0') and cherrypy.engine.state == 0:
    cherrypy.engine.start(blocking=False)
    atexit.register(cherrypy.engine.stop)
control = Controller.Controller()

def authorized():
    email = cherrypy.session.get('email')
    isvalid = cherrypy.session.get('isvalid')
    if not email:
        raise cherrypy.HTTPRedirect("/")
    if not isvalid:
        raise cherrypy.HTTPRedirect("/validate")
    return email

class Root(object):    
    """Root
        La parte central de subject,recibe las peticiones 
        desde el cliente y regresa el contenido solicitado.
    """

    @cherrypy.expose
    def index(self):
        email = cherrypy.session.get('email')
        if email != None:
            raise cherrypy.HTTPRedirect('/home')
        return open("home/daniel/Subject/web-server/Vista/index.html", "r")
        
    @cherrypy.expose
    def signin(self):
        return open("home/daniel/Subject/web-server/Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):        
        status = control.login(user,password)        
        if status == 1:            
            cherrypy.session['email'] = cherrypy.request.login = user            
            cherrypy.session['isvalid'] = 1
            cherrypy.session.acquire_lock()
            raise cherrypy.HTTPRedirect("/home")
        else:
            return "Login failed"

    @cherrypy.expose
    def home(self):
        email = authorized()
        return open('home/daniel/Subject/web-server/Vista/public_html/home.html','r')     

    @cherrypy.expose
    def logout(self): 
        cherrypy.session.clear()
        raise cherrypy.HTTPRedirect("/")   

    @cherrypy.expose
    def new_user(self):
        return open("home/daniel/Subject/web-server/Vista/public_html/registrar.html","r")

    @cherrypy.expose
    def forgot_pass(self):
        return open("home/daniel/Subject/web-server/Vista/public_html/forgotten-pass.html","r")

    @cherrypy.expose
    def get_lista_paises(self):
        return control.get_lista_paises()
    
    @cherrypy.expose
    def get_lista_escuelas(self):
        return control.get_lista_escuelas()

    @cherrypy.expose
    def registrarse(self, nombre, apellido, email, contrasenia, rcontrasenia, genero, escuela, pais, fdn):
        if not control.cadena_valida(nombre) or not control.cadena_valida(apellido) or not control.cadena_valida(email):    
            raise ValueError("El parametro " + value + " es invalido")
        usuario = Usuario.Usuario(None,nombre,apellido,genero,email,'/static/img/fotos_perfil/agregarFoto.png',escuela,contrasenia,pais,fdn,0.0)        
        control.verifica(usuario,rcontrasenia)
        raise cherrypy.HTTPRedirect('/verifica_cuenta')

    @cherrypy.expose    
    def validate(self):
        email = cherrypy.session.get('email')
        isvalid = cherrypy.session.get('isvalid')
        return {'email':email,'isvalid':isvalid}

    @cherrypy.expose
    def verifica_cuenta(self):
        return open("home/daniel/Subject/web-server/Vista/public_html/verifica_cuenta.html")

    @cherrypy.expose
    def verfica_codigo(self,codigo):
        return control.registra(codigo)


class Perfil(object):
    """
    Maneja los métodos y los archivos para mostrar un perfil
    """

    @cherrypy.expose
    def index(self):
        email = authorized()
        return open("home/daniel/Subject/web-server/Vista/public_html/perfil.html")

    @cherrypy.expose
    def visita_perfil(self, usuario):
        return usuario

    @cherrypy.expose
    @cherrypy.tools.json_out()
    def get_contenido_perfil(self, funcion):
        if funcion == 'get_datos':    
            return {
                'nombre':control.get_nombre(cherrypy.session.get('email')),
                'edad'  :control.get_edad(cherrypy.session.get('email')),
                'foto'  :control.get_foto_perfil(cherrypy.session.get('email'))
            }
        if funcion == 'get_publicaciones':
            return control.get_publicaciones_perfil(cherrypy.session.get('email'))
        if funcion == 'get_info':
            return control.get_info_perfil(cherrypy.session.get('email'))
        if funcion == 'get_archivos':
            return "<p>Publicaciones<p>"
        return "Error"

    @cherrypy.expose
    def publica(self, contentp, materia, archivo=None):
        control.publica_como_usuario(contentp,materia,archivo,cherrypy.session.get('email'))
        raise cherrypy.HTTPRedirect("/perfil")

    @cherrypy.expose
    def actualiza_foto(self, nueva_foto):
        control.actualiza_foto(cherrypy.session.get('email'),nueva_foto)
        raise cherrypy.HTTPRedirect("/perfil")

    @cherrypy.tools.mako(filename='interfaz_grupos.html')
    @cherrypy.expose
    def grupos(self):
        o=control.get_id_usr(cherrypy.session.get('email'))
        u = Usuario.Usuario(o,"Pa","lala","m","lala",'/static/img/fotos_perfil/agregarFoto.png','NULL',"Perriro",'NULL',"01-01-01",0)
        rows = u.get_grupos()
        c=""
        for x in range (0,len(rows)):
            c=c+"\n<li><a href=\"grupo?id=" + str(rows[x][0]) +"\"/a>"+rows[x][4]+"</li>"
        return {'grupos':c}
	
    @cherrypy.tools.mako(filename='usuarios-grupo.html')
    @cherrypy.expose
    def miembros(self):
        g = Grupo.Grupo(1,'Rifadores',1,1,'src')
        rows = g.get_usuarios()
        c=""
        for x in range (0,len(rows)):
            c=c+"\n<li>"+rows[x][2]+"</li>"
        return {'imagen':"/static/img/scizor.png",'nombre':g.get_nombre(),'miembros':c}
	
    @cherrypy.tools.mako(filename='grupo.html')
    @cherrypy.expose
    def grupo(self, id):
        g = Grupo.Grupo(id, 'Rifadores', 2,  -1, 'hola_mundo')
        g.cambia_parametros()
        rows = g.get_publicaciones()
        c=""
        for x in range (0,len(rows)):
            c=c+"\n<li>"+rows[x][7]+"</li>"
        return {'imagen':"/static/img/scizor.png",'nombre':g.get_nombre(),'publicaciones':c}

    @cherrypy.expose
    def crear_grupo(self):
        return open("home/daniel/Subject/web-server/Vista/public_html/registrar_grupo.html","r")
	
    @cherrypy.expose
    def registra_grupo(self,nombre,visibilidad):
        if not control.cadena_valida(nombre) or Grupo.existe(nombre):
            return 'Nombre invalido'
        id_usuario=control.get_id_usr(cherrypy.session.get('email'))
        g = Grupo.Grupo(0,nombre,id_usuario,visibilidad,"static/img/fotos_perfil/agregarFoto.png")
        g.agrega()
        g.set_id(control.get_id_grupo(nombre))
        id_usr=control.get_id_usr(cherrypy.session.get('email'))
        g.agrega_usuario(id_usr)
        return "Se agregó con exito"

    @cherrypy.tools.mako(filename='resultado_busqueda.html')
    @cherrypy.expose
    def busqueda(self,buscador_personas):
        return control.busca(buscador_personas,cherrypy.session.get('email'))
        

    @cherrypy.expose
    def comenta(self,comentario,id_publicacion):
        id_usr=control.get_id_usr(cherrypy.session.get('email'))
        control.comenta(comentario,id_usr,id_publicacion)
        raise cherrypy.HTTPRedirect("/perfil")

    @cherrypy.expose
    def califica_publicacion(self,calificacion,id_publicacion):
        id_usr=control.get_id_usr(cherrypy.session.get('email'))
        #control.califica_publicacion()
        return

root = Root()
root.perfil = Perfil()
cherrypy.server.max_request_body_size = 0
cherrypy.server.socket_timeout = 60
conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(root, '/', conf)
