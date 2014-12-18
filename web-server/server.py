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

def authorized():
    email = cherrypy.session.get('email')
    isvalid = cherrypy.session.get('isvalid')
    token = cherrypy.session.get('token')
    if not email:
        raise cherrypy.HTTPRedirect("/signin")
    if not isvalid:
        raise cherrypy.HTTPRedirect("/validate")
    if not token:
        token = cherrypy.session["token"] = Controller.id_generator(12)
    return email,token

class Root(object):

    @cherrypy.expose
    def index(self):
        return open("/home/daniel/Subject3/web-server/Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):
        status = Controller.login(user,password)
        if status == 1:
            cherrypy.session['email']=email
            cherrypy.session['isvalid'] = 1
            raise cherrypy.HTTPRedirect("/")
        else:
            return "Login failed"     

    @cherrypy.expose
    def new_user(self):
        return open("home/daniel/Subject3/web-server/Vista/public_html/registrar.html","r")

    @cherrypy.expose
    def forgot_pass(self):
        return open("home/daniel/Subject3/web-server/Vista/public_html/forgotten-pass.html","r")

    @cherrypy.expose
    def registrarse(self, nombre, apellido, email, contrasenia, rcontrasenia, genero, fdn):
        usuario = Usuario.Usuario(None,nombre,apellido,genero,email,'NULL','NULL',contrasenia,'NULL',fdn,0.0)        
        return Controller.verifica(usuario,rcontrasenia)
    
    @cherrypy.expose    
    def validate(self):
        email = cherrypy.session.get('email')
        isvalid = cherrypy.session.get('isvalid')
        return {'email':email,'isvalid':isvalid, 'token':token}    
    @cherrypy.expose
    def logout(self,ctoken):
        if ctoken != cherrypy.session.get('token'):
            return "Security violation"
        cherrypy.session.clear()
        raise cherrypy.HTTPRedirect("/")    

conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(Root(), '/', conf)
