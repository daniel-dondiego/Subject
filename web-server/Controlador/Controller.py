#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
from Modelo import *
import Comandos

class Controller(object):
	
	def verifica(self ,usuario):
		 ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating) \
        VALUES ('+'\''+str(usuario.get_nombre())+'\''+','+'\''+str(usuario.get_apellido())+'\''+','+'\''+str(usuario.get_genero())+'\''+','+'\''+str(usuario.get_nick_name())+'\''+','+ str(usuario.get_foto())+','+str(usuario.get_escuela())+','+'\''+str(usuario.get_password())+'\''+','+str(usuario.get_nacionalidad())+','+'\''+str(usuario.get_f_nacimiento())+'\''+','+str(usuario.get_rating())+')')
