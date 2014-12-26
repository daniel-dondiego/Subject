#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
import string
import EnviaCorreos

class Controller(object):

    def verifica(self,usuario, rcontrasenia):
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
	#c_conf = EnviaCorreos.EnviaCorreos()
	#EnviaCorreos.correo_de_confirmacion(usuario.get_nick_name(),4321)
	Comandos.ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,escuela,nacionalidad,f_nacimiento,rating,foto,password) \
		VALUES (\'%s\',\'%s\',\'%s\',\'%s\',NULL,NULL,\'%s\',0,\'some\',%d);'%(str(usuario.get_nombre()),str(usuario.get_apellido()),str(usuario.get_genero()),str(usuario.get_nick_name()),str(usuario.get_f_nacimiento()),hash(str(usuario.get_password()))))
	if(usuario.get_genero() == 'm'):
   		return "Bienvenido a Subject " + usuario.get_nombre()
       	return "Bienvenia a Subject " + usuario.get_nombre()

    def login(self,email,password):
        l = Comandos.consulta('SELECT password FROM usuario WHERE nick_name = '+ '\''+email+'\''+';');	    	
        if(l == []):
            return 'usuario incorrecto'
        if(l[0][0] != hash(password)):
            return 0
        return 1

    def get_nombre(self ,email):
        nombre = Comandos.consulta('SELECT nombre FROM usuario WHERE nick_name = \'%s\';' % (email))
        apellido = Comandos.consulta('SELECT apellido FROM usuario WHERE nick_name = \'%s\';' % (email))        
        return ("%s %s" % (nombre[0][0],apellido[0][0]))

    def get_edad(self, email):
        edad = Comandos.consulta('SELECT date_part(\'year\',age(f_nacimiento)) AS edad FROM usuario WHERE nick_name = \'%s\';' % (email))
        print '%s años' % (edad[0][0])
        return ('%d años' % (edad[0][0]))

    def get_foto_perfil(self, email):
        foto = Comandos.consulta('SELECT foto FROM usuario WHERE nick_name = \'%s\';' % (email))
        return ('<img src=\'%s\'/>' % (foto[0][0]))


