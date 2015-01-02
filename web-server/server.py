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
    '''
    Verifica si ya se ha iniciado sesion y si no es asi, redirecciona a la pagina principal
    returns: el email del usuario
    '''
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
        '''
        Raiz de cherrypy
        returns: abre el html de la raiz
        '''
        email = cherrypy.session.get('email')
        if email != None:
            raise cherrypy.HTTPRedirect('/home')
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")
        
    @cherrypy.expose
    def signin(self):
        '''
        Abre la ventana de inicio de sesion
        returns: la ventana de inicio de sesion
        '''
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):        
        '''
        Hace login
        returns: Una cadena cuando el login falla
        '''
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
        '''
        Envia al usuario al home
        returns: la ventana con la vista del home
        '''
        email = authorized()
        return open('home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/home.html','r')     

    @cherrypy.expose
    def logout(self): 
        '''
        Cierra la sesion
        '''
        cherrypy.session.clear()
        raise cherrypy.HTTPRedirect("/")   

    @cherrypy.expose
    def new_user(self):
        '''
        Envia a la ventana de creacion de un nuevo usuario
        returns: la ventana de creacion de usuarios
        '''
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/registrar.html","r")

    @cherrypy.expose
    def forgot_pass(self):
        '''
        Redirecciona a la ventana de contrasena olvidada
        returns: la ventana de contrasena olvidada
        '''
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/forgotten-pass.html","r")

    @cherrypy.expose
    def get_lista_paises(self):
        '''
        Regresa la lista de los paises
        returns: la lista de paises
        '''
        return control.get_lista_paises()
    
    @cherrypy.expose
    def get_lista_escuelas(self):
        '''
        Regresa una lista con todas las escuelas
        returns: una lista de escuelas
        '''
        return control.get_lista_escuelas()

    @cherrypy.expose
    def registrarse(self, nombre, apellido, email, contrasenia, rcontrasenia, genero, escuela, pais, fdn):
        '''
        Registra a un usuario en subject
        nombre: el nombre del usuario
        apellido: el apellido del usuario
        email: el correo del usuario
        contrasenia: la contrasenia del usuario
        rcontrasenia: la confirmacion de la contrasenia del usuario
        genero: el genero del usuario
        escuela: la escuela a la que pertenece el usuario
        pais: el pais de donde es el usuario
        fdn: la fecha de nacimiento del usuario
        '''
        if not control.cadena_valida(nombre) or not control.cadena_valida(apellido) or not control.cadena_valida(email):    
            raise ValueError("El parametro " + value + " es invalido")
        usuario = Usuario.Usuario(None,nombre,apellido,genero,email,'/static/img/fotos_perfil/agregarFoto.png',escuela,contrasenia,pais,fdn,0.0)        
        control.verifica(usuario,rcontrasenia)
        raise cherrypy.HTTPRedirect('/verifica_cuenta')

    @cherrypy.expose    
    def validate(self):
        '''
        Valida la sesion
        returns: un diccionario que nos dice el email del usuario y si su sesion es valida
        '''
        email = cherrypy.session.get('email')
        isvalid = cherrypy.session.get('isvalid')
        return {'email':email,'isvalid':isvalid}

    @cherrypy.expose
    def verifica_cuenta(self):
        '''
        Cambia a la ventana de verificar cuenta
        returns: la ventana para verificar cuenta
        '''
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/verifica_cuenta.html", "r")

    @cherrypy.expose
    def verfica_codigo(self,codigo):
        '''
        Verifica si el codigo de registro es correcto
        returns: un verificador del codigo
        '''
        return control.registra(codigo)

    @cherrypy.tools.mako(filename='visita_perfil.html')
    @cherrypy.expose
    def visita_perfil(self, usuario):
        '''
        Regresa un diccionario para la plantilla con el nombre del usuario
        returns: la plantilla para el nombre del usuario
        '''
        return {'id' : usuario}

    @cherrypy.expose
    @cherrypy.tools.json_out()
    def get_contenido_perfil_ext(self, funcion, id):
        '''
        Regresa un diccionario para llenar una plantilla con la informacion del usuario
        returns: un diccionario con la informacion del usuario
        '''
        if funcion == 'get_datos':
            return {
                'nombre' :control.get_nombre_u(int(id)),
                'edad'   :control.get_edad_u(int(id)),
                'foto'   :control.get_foto_perfil_u(int(id)),
                'escuela':control.get_escuela_u(int(id)),
                'siguea' :control.siguea(cherrypy.session.get('email'),int(id))
            }
        if funcion == 'get_publicaciones':
            return control.get_publicaciones_perfil_u(int(id))
        if funcion == 'get_info':
            return control.get_info_perfil_u(int(id))
        return "Error"

    @cherrypy.expose
    def follow(self, id_seguido):
        return control.follow(cherrypy.session.get('email'),int(id_seguido))

    @cherrypy.expose
    def unfollow(self, id_seguido):
        return control.unfollow(cherrypy.session.get('email'),int(id_seguido))

class Perfil(object):
    """
    Maneja los métodos y los archivos para mostrar un perfil
    """

    @cherrypy.expose
    def index(self):
        '''
        Pagina indice del perfil
        returns: la ventana del perfil
        '''
        email = authorized()
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/perfil.html")

    @cherrypy.expose
    @cherrypy.tools.json_out()
    def get_contenido_perfil(self, funcion):
        '''
        Regresa el contenido del perfil
        returns: el contenido del perfil
        '''
        if funcion == 'get_datos':    
            return {
                'nombre' :control.get_nombre(cherrypy.session.get('email')),
                'edad'   :control.get_edad(cherrypy.session.get('email')),
                'foto'   :control.get_foto_perfil(cherrypy.session.get('email')),
                'escuela':control.get_escuela(cherrypy.session.get('email'))
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
        '''
        Publica en el perfil
        '''
        control.publica_como_usuario(contentp,materia,archivo,cherrypy.session.get('email'))
        raise cherrypy.HTTPRedirect("/perfil")

    @cherrypy.expose
    def actualiza_foto(self, nueva_foto):
        '''
        Actualiza la foto de perfil
        '''
        control.actualiza_foto(cherrypy.session.get('email'),nueva_foto)
        raise cherrypy.HTTPRedirect("/perfil")

    @cherrypy.tools.mako(filename='interfaz_grupos.html')
    @cherrypy.expose
    def grupos(self):
        '''
        Llena la plantilla del grupo de los usuarios
        returns: un diccionario para llenar la plantilla
        '''
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
        '''
        Llena la plantilla con los miembros del grupo
        returns: un diccionario para llenar la plantilla
        '''
        g = Grupo.Grupo(1,'Rifadores',1,1,'src')
        rows = g.get_usuarios()
        c=""
        for x in range (0,len(rows)):
            c=c+"\n<li>"+rows[x][2]+"</li>"
        return {'imagen':"/static/img/scizor.png",'nombre':g.get_nombre(),'miembros':c}
	
    @cherrypy.tools.mako(filename='grupo.html')
    @cherrypy.expose
    def grupo(self, id):
        '''
        Llena la plantilla de la vista de grupo
        id: el id del grupo
        returns: un diccionario para llenar la plantilla
        '''
        g = Grupo.Grupo(id, 'Rifadores', 2,  -1, 'hola_mundo')
        g.cambia_parametros()
        rows = g.get_publicaciones()
        c=""
        for x in range (0,len(rows)):
            c=c+"\n<li>"+rows[x][7]+"</li>"
        return {'imagen':"/static/img/scizor.png",'nombre':g.get_nombre(),'publicaciones':c}

    @cherrypy.expose
    def crear_grupo(self):
        '''
        Regresa la ventana para crear un grupo
        returns: la ventana de creacion de un grupo
        '''
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/registrar_grupo.html","r")

    @cherrypy.expose
    def registra_grupo(self,nombre,visibilidad):
        '''
        Registra un grupo
        nombre: el nombre del grupo a registrar
        visibilidad: la visibilidad del grupo
        returns: un mensaje que nos dice si el registro fue exitoso
        '''
        if not control.cadena_valida(nombre):
            return 'Nombre invalido'
        if Grupo.existe(nombre):
            return 'Ese nombre de grupo ya existe, favor de intentar con otro'
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
        '''
        Busca a una persona
        buscador_personas: un buscador de personas
        returns: un buscador
        '''
        return control.busca(buscador_personas,cherrypy.session.get('email'))
        
    @cherrypy.tools.mako(filename='visita_perfil.html')
    @cherrypy.expose
    def comenta(self,comentario,id_publicacion):
        '''
        Comenta una publicacion
        comentario: el comentario
        id_publicacion: el id de la publicacion a comentar
        '''
        id_usr=control.get_id_usr(cherrypy.session.get('email'))
        id_visit = control.comenta(comentario,id_usr,id_publicacion)
        if(control.get_nick(id_visit) == cherrypy.session.get('email')):
            raise cherrypy.HTTPRedirect('/perfil');
        return {'id':id_visit}

root = Root()
root.perfil = Perfil()
cherrypy.server.max_request_body_size = 0
cherrypy.server.socket_timeout = 60
conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(root, '/', conf)
