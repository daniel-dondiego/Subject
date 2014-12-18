#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
import string



def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for x in range(size))
	
def verifica(self , usuario, rcontrasenia):
	if(usuario.get_password() != rcontrasenia):
		return "Las contraseñas no coinciden"
	if(len(usuario.get_password()) == 0):
		return "Debe llenar el campo de la contrasenia."		
	if (len(usuario.get_nombre()) == 0):
		return "Debe llenar el campo del nombre."
	if(len(usuario.get_apellido()) == 0):
		return "Debe llenar el campo del apellido."
	if(len(usuario.get_f_nacimiento()) == 0):
		return "Debe ingresar su fecha de nacimiento."
	if(len(usuario.get_nick_name()) == 0):
		return "Debe llenar el campo del nombre."
	if(len(usuario.get_genero()) == 0):
		return "Debe llenar el campo del genero."
	Comandos.ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating) \
    	VALUES ('+'\''+str(usuario.get_nombre())+'\''+','+'\''+str(usuario.get_apellido())+'\''+','+'\''+str(usuario.get_genero())+'\''+','+'\''+str(usuario.get_nick_name())+'\''+','+ str(usuario.get_foto())+','+str(usuario.get_escuela())+','+'\''+str(usuario.get_password())+'\''+','+str(usuario.get_nacionalidad())+','+'\''+str(usuario.get_f_nacimiento())+'\''+','+str(usuario.get_rating())+');')
	if(usuario.get_genero() == 'm'):
    		return "Bienvenido a Subject " + usuario.get_nombre()
       	return "Bienvenia a Subject " + usuario.get_nombre()

	def login(self,email,password):
   		l = Comandos.consulta('SELECT password FROM usuario WHERE nick_name = '+ '\''+email+'\''+';');	    	
   		if(l == []):
   			return 'usuario incorrecto'
   		if(l[0][0] != password):
   			return 0
   		return 1    


