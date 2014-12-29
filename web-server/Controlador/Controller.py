#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
from Modelo import Publicacion
import string
import EnviaCorreos
import cgi
import shutil
import tempfile
import os, sys, stat
import time
import psycopg2
import psycopg2.extras

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
	Comandos.ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,escuela,nacionalidad,f_nacimiento,rating,foto,password,salt) \
		VALUES (\'%s\',\'%s\',\'%s\',\'%s\',NULL,NULL,\'%s\',0,\'%s\',%d,\'a\');'%(str(usuario.get_nombre()),str(usuario.get_apellido()),str(usuario.get_genero()),str(usuario.get_nick_name()),str(usuario.get_f_nacimiento()),str(usuario.get_foto()),hash(str(usuario.get_password()))))
	if(usuario.get_genero() == 'm'):
   		return "Bienvenido a Subject " + usuario.get_nombre()
       	return "Bienvenida a Subject " + usuario.get_nombre()

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

    def get_publicaciones_perfil(self,email):
        publicaciones =  """
            <div id="publicacion_nueva"> 
                <form action="publica" method="POST" enctype="multipart/form-data">
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
            </div>
            <div id="espacio_perfil"></div>
            %s
            """
        publicacion_sf = """ 
            <div id="publicaciones_usuario">
                <div id="nombre_p">
                    <p>%s</p>
                </div>
                <div id="fecha">
                    <p>%s</p>
                </div>
                <div id="imagen_p">
                    <img src="%s"/>
                </div>
                <div id="materia_p">
                    <p>%s</p>
                </div>
            </div>
            <div id="espacio_perfil"></div>
            """
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        cadena = ""
        cursor = Comandos.consulta('SELECT materia,fecha,id_archivo,id_usuario FROM publicaciones WHERE id_usuario = \'%s\';' % (id_usuario[0][0]))
        for row in cursor:
            for x in row:
                cadena += '%s \n' % x
        return publicaciones % cadena



    def publica_como_usuario(self, contentp, materia, archivo, email):
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        id_materia = Comandos.consulta('SELECT id FROM materias WHERE materia = \'%s\';' % (materia))
        fecha_hora = time.strftime('%Y-%m-%d %X')
        if(len(archivo.filename) != 0):
            size = 0
            allData=''
            while True:
                data = archivo.file.read(8192)
                allData+=data
                if not data:
                    break
                size += len(data)
            savedFile = open('tmp/'+archivo.filename, 'wb')
            savedFile.write(allData)
            savedFile.close()
            shutil.move('/tmp/'+archivo.filename,'/home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/archivos')
            os.chmod('/home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/archivos/%s'%(archivo.filename),stat.S_IRWXU)
            #return "<img src=\"/static/img/archivos/%s\"/>" % (archivo.filename)
            Comandos.ejecuta_comando('INSERT INTO archivos (url_archivo,id_usuario,id_grupo) VALUES (\'%s\',%d,NULL);' % (('/static/img/archivos/%s'%(archivo.filename)),id_usuario[0][0]))
            id_archivo = Comandos.consulta('SELECT id FROM archivos WHERE url_archivo = \'%s\';' % (('/static/img/archivos/%s'%(archivo.filename))))
            Comandos.ejecuta_comando('INSERT INTO publicaciones (id_usuario,id_grupo,id_archivo,id_materia,fecha,visibilidad,contenido) VALUES (%d,NULL,%d,%d,\'%s\',NULL,\'%s\');' %(id_usuario[0][0],id_archivo[0][0],id_materia[0][0],fecha_hora,contentp))
            return "done"
        return "ok"
        

