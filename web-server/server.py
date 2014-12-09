#!/usr/bin/python
# -*- coding: utf-8 -*-

import os, os.path
import cherrypy

class Home(object):

    @cherrypy.expose
    def index(self):
        return open("Vista/index.html", "r")

    @cherrypy.expose
    def login(self, user, password):
        print user
        print password

if __name__ == '__main__':
	conf  = {
		'/': {
             'tools.sessions.on': True,
             'tools.staticdir.root': os.path.abspath(os.getcwd())
         },
         '/static': {
             'tools.staticdir.on': True,
             'tools.staticdir.dir': './Vista'		
         }
	}
	cherrypy.quickstart(Home(), '/', conf)

