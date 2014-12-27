#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys, os
sys.path.append(os.path.dirname(__file__))
from Modelo import Usuario
from Controlador import Controller
import atexit
import threading
import cherrypy
from cherrypy import log
import cgi
import tempfile
import os, os.path

cherrypy.config.update({'environment': 'embedded'})

if cherrypy.__version__.startswith('3.0') and cherrypy.engine.state == 0:
    cherrypy.engine.start(blocking=False)
    atexit.register(cherrypy.engine.stop)

def authorized():
    email = cherrypy.session.get('email')
    isvalid = cherrypy.session.get('isvalid')
    if not email:
        raise cherrypy.HTTPRedirect("/")
    if not isvalid:
        raise cherrypy.HTTPRedirect("/validate")
    return email

class Root(object):

    @cherrypy.expose
    def index(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")
        
    @cherrypy.expose
    def signin(self):
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):        
        control = Controller.Controller()
        status = control.login(user,password)        
        if status == 1:            
            cherrypy.session['email'] = user            
            cherrypy.session['isvalid'] = 1
            raise cherrypy.HTTPRedirect("/home")
        else:
            return "Login failed"     

    @cherrypy.expose
    def home(self):
        email = authorized()
        return open("home/miguel/Documentos/Modelado/Subject/web-server/Vista/public_html/perfil.html")
        
    @cherrypy.expose
    @cherrypy.tools.json_out()
    def get_nombre(self):    
        control = Controller.Controller()
        return {
            'nombre':control.get_nombre(cherrypy.session.get('email')),
            'edad'  :control.get_edad(cherrypy.session.get('email')),
            'foto'  :control.get_foto_perfil(cherrypy.session.get('email'))
        }

    @cherrypy.expose
    def get_info(self):
        return "<p>Holaa</p>"

    @cherrypy.expose    
    def get_publicaciones(self):
        return """
                <form action="publica" method="post" enctype="multipart/form-data">
                    <TEXTAREA type="text" name="contentp" placeholder="Publicar algo..."></TEXTAREA>
                    <select name="materia" placeholder="Escoge una materia:">              
                        <option selected="selected" value="n">Materia</option>
                        <option value="Álgebra">Álgebra</option>
                        <option value="c">Cálculo</option>
                    </select>
                    <label for="adjuntar_archivo">
                        <img src="/static/img/adjuntar.png"/>
                    </label>
                    <input id="adjuntar_archivo" type="file" name="archivo"/>
                    <input type="submit" value="Publicar"/>
                </form> 
                """

    @cherrypy.expose
    def publica(self, contentp, materia, archivo=None):
        out = """<html>
                    <body>
                        myFile length: %s<br />
                        myFile filename: %s<br />
                        myFile mime-type: %s
                    </body>
                </html>"""
        size = 0
        allData=''
        while True:
            data = archivo.file.read(8192)
            allData+=data
            if not data:
                    break
            size += len(data)
        savedFile=open(archivo.filename , 'wb')
        savedFile.write(allData)
        savedFile.close()           
        return out % (size, archivo.filename, archivo.type)

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
        control = Controller.Controller()
        return control.verifica(usuario,rcontrasenia)

    @cherrypy.expose    
    def validate(self):
        email = cherrypy.session.get('email')
        isvalid = cherrypy.session.get('isvalid')
        return {'email':email,'isvalid':isvalid}     

cherrypy.server.max_request_body_size = 0
cherrypy.server.socket_timeout = 60
conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(Root(), '/', conf)
