#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, os
sys.path.append(os.path.dirname(__file__))
from Modelo import Usuario
from Controlador import Controller
import atexit
import threading
import cherrypy
import os, os.path


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
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")
        
    @cherrypy.expose
    def signin(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):        
        status = control.login(user,password)        
        if status == 1:            
            cherrypy.session['email'] = user            
            cherrypy.session['isvalid'] = 1
            cherrypy.session.acquire_lock()
            raise cherrypy.HTTPRedirect("/home")
        else:
            return "Login failed"

    @cherrypy.expose
    def home(self):
        email = authorized()
        return """<a href="/perfil">Perfil</a>"""      

    @cherrypy.expose
    def logout(self): 
        cherrypy.session.clear()
        raise cherrypy.HTTPRedirect("/")   

    @cherrypy.expose
    def new_user(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/registrar.html","r")

    @cherrypy.expose
    def forgot_pass(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/forgotten-pass.html","r")

    @cherrypy.expose
    def registrarse(self, nombre, apellido, email, contrasenia, rcontrasenia, genero, fdn):
        usuario = Usuario.Usuario(None,nombre,apellido,genero,email,'/static/img/fotos_perfil/agregarFoto.png','NULL',contrasenia,'NULL',fdn,0.0)        
        control.verifica(usuario,rcontrasenia)
        raise cherrypy.HTTPRedirect('/verifica_cuenta')

    @cherrypy.expose    
    def validate(self):
        email = cherrypy.session.get('email')
        isvalid = cherrypy.session.get('isvalid')
        return {'email':email,'isvalid':isvalid}

    @cherrypy.expose
    def verifica_cuenta(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/verifica_cuenta.html")

    @cherrypy.expose
    def verifica_codigo(self, codigo):
        return "ok"

class Perfil(object):

    @cherrypy.expose
    def index(self):
        email = authorized()
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/perfil.html")

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
            return "<p>Info<p>"
        if funcion == 'get_archivos':
            return "<p>Publicaciones<p>"
        return "Error"

    @cherrypy.expose
    def publica(self, contentp, materia, archivo=None):
        control.publica_como_usuario(contentp,materia,archivo,cherrypy.session.get('email'))
        raise cherrypy.HTTPRedirect("/perfil")

root = Root()
root.perfil = Perfil()
cherrypy.server.max_request_body_size = 0
cherrypy.server.socket_timeout = 60
conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(root, '/', conf)
