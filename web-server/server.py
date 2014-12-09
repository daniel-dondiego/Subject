#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.stdout = sys.stderr

import atexit
import threading
import cherrypy
import os, os.path

cherrypy.config.update({'environment': 'embedded'})

if cherrypy.__version__.startswith('3.0') and cherrypy.engine.state == 0:
    cherrypy.engine.start(blocking=False)
    atexit.register(cherrypy.engine.stop)

class Root(object):

    @cherrypy.expose
    def index(self):
        return open("/home/miguel/Documentos/Modelado/Proyectos/Subject/web-server/Vista/index.html", "r")

conf = os.path.join(os.path.dirname(__file__),'server.conf')
application = cherrypy.Application(Root(), '/', conf)