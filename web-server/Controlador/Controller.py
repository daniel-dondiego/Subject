#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
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
    	id_escuela = Comandos.consulta('SELECT id FROM escuela WHERE nombre=\'%s\';' % (usuario.get_escuela()))
    	id_nacionalidad = Comandos.consulta('SELECT id FROM paises WHERE pais=\'%s\';' % (usuario.get_nacionalidad()))
    	Comandos.ejecuta_comando("""INSERT INTO usuario (nombre,apellido,genero,nick_name,escuela,nacionalidad,f_nacimiento,rating,foto,password,salt) VALUES (\'%s\',\'%s\',\'%s\',\'%s\',%d,%d,\'%s\',0,\'%s\',%d,\'a\');"""%(str(usuario.get_nombre()),str(usuario.get_apellido()),str(usuario.get_genero()),str(usuario.get_nick_name()), id_escuela[0][0],id_nacionalidad[0][0],str(usuario.get_f_nacimiento()),str(usuario.get_foto()),hash(str(usuario.get_password()))))
    	if(usuario.get_genero() == 'm'):
	    return "Bienvenido a Subject " + usuario.get_nombre()
	return "Bienvenida a Subject " + usuario.get_nombre()

    def get_lista_paises(self):
        paises = Comandos.consulta('SELECT pais FROM paises;')
        cad_paises = "<label for=\"pais\">Pa&iacute;s:</label>\n<select name=\"pais\">\n"
        for pais in paises:
            cad_paises += " <option value=\"%s\">%s</option>\n" %(pais[0],pais[0])
        return cad_paises + "</select>"
                    
    def get_lista_escuelas(self):
        escuelas = Comandos.consulta('SELECT nombre FROM escuela;')
        cad_escuelas = "<label for=\"escuela\">Escuela:</label>\n<select name=\"escuela\">\n"
        for escuela in escuelas:
            cad_escuelas += "   <option value=\"%s\">%s</option>\n" %(escuela[0],escuela[0])
        return cad_escuelas + "\n</select>"

    def login(self,email,password):
        if not cadena_valida(email):
            return 0
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
        return (''''<img src=\'%s\'/>''' % (foto[0][0]))

    def get_id_usr(self, email):
        i = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        return i[0][0]

    def get_publicaciones_perfil(self,email):
        publicaciones =  """
            <div id="publicacion_nueva"> 
                <form action="publica" method="POST" enctype="multipart/form-data">
                    <TEXTAREA type="text" name="contentp" placeholder="Publicar algo..."></TEXTAREA>
                    <select name="materia" placeholder="Escoge una materia:">              
                        %s
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
        publicacion_cf = """ 
            <div id="publicaciones_usuario">
                <p id="id_p">%s</p>
                <div id="nombre_p">
                    <a href="../perfil"><p>%s</p></a>
                </div>
                <div id="fecha">
                    <p>%s - %s</p>
                </div>
                <div id="contenido_p">
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
        publicacion_sf =  """ 
            <div id="publicaciones_usuario">
                <p id="id_p">%s</p>
                <div id="nombre_p">
                    <a href="../perfil"><p>%s</p></a>
                </div>
                <div id="fecha">
                    <p>%s - %s</p>
                </div>
                <div id="contenido_p">
                    <p>%s</p>
                </div>
                <div id="materia_p">
                    <p>%s</p>
                </div>
            </div>
            <div id="espacio_perfil"></div>
            """
        materias = Comandos.consulta('SELECT materia FROM materias;')
        cad_materias = ""
        for materia in materias:
            cad_materias += '<option value="%s">%s</option>\n' %(materia[0],materia[0])
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        rows = Comandos.consulta('SELECT id,id_materia,fecha,id_archivo,id_usuario,contenido,hora FROM publicaciones WHERE id_usuario = \'%s\' ORDER BY hora DESC;' % (id_usuario[0][0]))
        cadena = ""
        if rows == []:
            return publicaciones % (cad_materias,"")
        for row in rows:
            n = Comandos.consulta('SELECT nombre FROM usuario WHERE id = %d;' % (id_usuario[0][0]))
            a = Comandos.consulta('SELECT apellido FROM usuario WHERE id = %d;' % (id_usuario[0][0]))
            materia = Comandos.consulta('SELECT materia FROM materias WHERE id = %d;' % (row['id_materia']))
            nombre = '%s %s'%(n[0][0],a[0][0])
            if not row['id_archivo'] is None:
                arch = Comandos.consulta('SELECT url_archivo FROM archivos WHERE id = %d;' % (row['id_archivo']))
                cadena += publicacion_cf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],arch[0][0],materia[0][0])
            else:
                cadena += publicacion_sf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],materia[0][0])
        return publicaciones % (cad_materias,cadena)

    def get_null(self):
        co = Comandos.consulta('select id_archivo from publicaciones where id=3;')
        return co


    def get_info_perfil(self, email):
        info = """
            <div id="info_p">
                <div id="nombre_i">
                    <p>Nombre: %s</p>
                </div>
                <div id="genero">
                    <p>Sexo: %s</p>
                </div>
                <div id="correo">
                    <p>Correo: %s</p>
                </div>
                <div id="escuela">
                    <p>Escuela: %s</p>
                </div>
                <div id="pais">
                    <p>Pa&iacute;s de origen: %s</p>
                </div>
                <div id="edad_i">
                    <p>Edad: %s</p>
                    <p>Fecha de nacimiento: %s</p>
                </div>
                <div id="rating">
                    <p>Raiting: %d</p>
                </div>
                <div id="foto_i">
                    <img src=\'%s\'/>
                </div>
            </div>
            """
        import Controller
        control = Controller.Controller()        
        nombre = control.get_nombre(email)
        genero = Comandos.consulta('SELECT genero FROM usuario WHERE nick_name=\'%s\';' % (email))
        correo = email
        edad = control.get_edad(email)
        return info

    def publica_como_usuario(self, contentp, materia, archivo, email):
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))        
        id_materia = Comandos.consulta('SELECT id FROM materias WHERE materia = \'%s\';' % (materia))
        fecha = time.strftime('%Y-%m-%d')
        hora = time.strftime('%X')        
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
            Comandos.ejecuta_comando('INSERT INTO publicaciones (id_usuario,id_grupo,id_archivo,id_materia,fecha,visibilidad,contenido,hora) VALUES (%d,NULL,%d,%d,\'%s\',NULL,\'%s\',\'%s\');' %(id_usuario[0][0],id_archivo[0][0],id_materia[0][0],fecha,contentp,hora))
            return
        Comandos.ejecuta_comando('INSERT INTO publicaciones (id_usuario,id_grupo,id_materia,fecha,visibilidad,contenido,hora) VALUES (%d,NULL,%d,\'%s\',NULL,\'%s\',\'%s\');' %(id_usuario[0][0],id_materia[0][0],fecha,contentp,hora))
        return

    def busca(self, nombre):
        '''
        Busca a la persona en la base de datos
        nombre: el nombre de la persona a buscar
        '''
        if not cadena_valida(nombre):
            return []
        i = 0
        nombre_completo = nombre.split()
        s = "SELECT * FROM usuario WHERE "
        for name in nombre_completo:
            if i != 0:
                s += "OR "
            s += "LOWER(nombre) LIKE LOWER(\'%" + name + "%\') OR LOWER(apellido) LIKE LOWER(\'%" + name + "%\') OR id IN(SELECT id_usuario FROM persona_carrera WHERE id_carrera_titulo IN (SELECT id FROM carrera WHERE LOWER(nombre) LIKE LOWER(\'%" + name + "%\'))) "
            i += 1
        return Comandos.consulta(s)

    def get_grupos_usuario(id):
        '''
        Regresa los grupos de un usuario dado su id
        id: el id en la base del usuario
        '''
        if is_number(id):
            s = "SELECT * FROM grupos WHERE id IN (SELECT id_grupo FROM grupo_usuario WHERE id_usuario = "
            s += id + ')'
            return Comandos.consulta(s)
        return []

def cadena_valida(cadena):
    '''
    Regresa True si la cadena es valida (no contiene palabras reservadas) y
    False en otro caso
    cadena: la cadena a analizar
    returns: si la cadena es valida
    '''
    baja = cadena.lower()
    palabras_reservadas = ["drop", " or ", " or", "or ", " and ", " and", 
                           "and ", "select", "*", "#", "$", "%", "&", "/", 
                           "(", ")", "?", "\'", "\"", "!", "\\", "+",
                           " - ", "- ", " -"] 
    for palabra in palabras_reservadas:
        if palabra in baja:
            return False
    return True

def is_number(s):
    '''
    Regresa si una cadena es numero
    Codigo obtenido de http://stackoverflow.com/questions/354038/how-do-i-check-if-a-string-is-a-number-in-python
    s: la cadena que queremos saber si es numero
    returns: si s es numero
    '''
    try:
        float(s)
        return True
    except ValueError:
       return False
    
