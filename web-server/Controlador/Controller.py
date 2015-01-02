#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
import string
import cgi
import shutil
import tempfile
import os, sys, stat
import time
import psycopg2
import psycopg2.extras

class Controller(object):

    def verifica(self,usuario, rcontrasenia):
        '''
        Verifica que el usuario haya llenado todos los campos en el registro
        usuario: el usuario que se quiere registrar
        rcontrasenia: la confirmacion de la contrasenia del usuario
        returns: un mensaje de error cuando falta llenar algun campo
        '''
        global usr
        usr = usuario
        if(usr.get_password() != rcontrasenia):
            return "Las contraseñas no coinciden"
        if(len(usr.get_password()) == 0):
            return "Debe llenar el campo de la contraseña."	      
        global codigo
        if (len(usr.get_nombre()) == 0):
            return "Debe llenar el campo del nombre."
        if(len(usr.get_apellido()) == 0):
	    return "Debe llenar el campo del apellido."
	if(len(usr.get_f_nacimiento()) == 0):
	    return "Debe ingresar su fecha de nacimiento."
	if(len(usr.get_nick_name()) == 0):
	    return "Debe llenar el campo del nombre."
	if(len(usr.get_genero()) == 0):
	    return "Debe llenar el campo del genero."
    	global codigo
        codigo = Comandos.genera_clave()
    	Comandos.correo_de_confirmacion(usr.get_nick_name(),codigo)

    def registra(self,cod):
        '''
        Registra al usuario
        cod: el codigo de activacion de la cuenta
        returns: un mensaje con el resultado del registro
        '''
        if(cod == codigo):
            id_escuela = Comandos.consulta('SELECT id FROM escuela WHERE nombre=\'%s\';' % (usr.get_escuela()))
            id_nacionalidad = Comandos.consulta('SELECT id FROM paises WHERE pais=\'%s\';' % (usr.get_nacionalidad()))
            Comandos.ejecuta_comando("""INSERT INTO usuario (nombre,apellido,genero,nick_name,escuela,nacionalidad,f_nacimiento,rating,foto,password,salt) VALUES (\'%s\',\'%s\',\'%s\',\'%s\',%d,%d,\'%s\',0,\'%s\',%d,\'a\');"""%(str(usr.get_nombre()),str(usr.get_apellido()),str(usr.get_genero()),str(usr.get_nick_name()), id_escuela[0][0],id_nacionalidad[0][0],str(usr.get_f_nacimiento()),str(usr.get_foto()),hash(str(usr.get_password()))))
            if(usr.get_genero() == 'm'):
                return "Bienvenido a Subject " + usr.get_nombre()
            return "Bienvenida a Subject " + usr.get_nombre()
	else:
            return "No coinciden"

    def get_lista_paises(self):
        '''
        Regresa la lista de paises
        returns: la lista de paises
        '''
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

    def get_nick(self, id):
        n = Comandos.consulta('SELECT nick_name FROM usuario WHERE id = %d;' % (int(id)))
        return n[0][0]

    def login(self,email,password):
        if not self.cadena_valida(email):
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

    def get_nombre_u(self ,id):
        nombre = Comandos.consulta('SELECT nombre FROM usuario WHERE id = %d;' % (id))
        apellido = Comandos.consulta('SELECT apellido FROM usuario WHERE id = %d;' % (id))        
        return ("%s %s" % (nombre[0][0],apellido[0][0]))

    def get_edad(self, email):
        edad = Comandos.consulta('SELECT date_part(\'year\',age(f_nacimiento)) AS edad FROM usuario WHERE nick_name = \'%s\';' % (email))
        print '%s años' % (edad[0][0])
        return ('%d años' % (edad[0][0]))

    def get_edad_u(self, id):
        edad = Comandos.consulta('SELECT date_part(\'year\',age(f_nacimiento)) AS edad FROM usuario WHERE id = %d;' % (id))
        return ('%d años' % (edad[0][0]))

    def get_foto_perfil(self, email):
        foto = Comandos.consulta('SELECT foto FROM usuario WHERE nick_name = \'%s\';' % (email))
        return (''''<img src=\'%s\'/>''' % (foto[0][0]))

    def get_foto_perfil_u(self, id):
        foto = Comandos.consulta('SELECT foto FROM usuario WHERE id = %d;' % (id))
	return (''''<img src=\'%s\'/>''' % (foto[0][0]))

    def get_escuela(self, email):
        id_escuela = Comandos.consulta('SELECT escuela FROM usuario WHERE nick_name = \'%s\';' % (email))
        escuela = Comandos.consulta('SELECT nombre FROM escuela WHERE id=%d;' % (id_escuela[0][0]))
        return ('%s' % escuela[0][0])

    def get_escuela_u(self, id):
        id_escuela = Comandos.consulta('SELECT escuela FROM usuario WHERE id = %d;' % (id))
        escuela = Comandos.consulta('SELECT nombre FROM escuela WHERE id=%d;' % (id_escuela[0][0]))
        return ('%s' % escuela[0][0])

    def get_id_usr(self, email):
        '''
        Regresa el id del usario a partir de el email de este ultimo
        email:el email del usuario
        '''
        i = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        return i[0][0]

    def siguea(self, email, id_seguido):
        id_seguidor = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        follow = Comandos.consulta('SELECT id_seguidor,id_seguido FROM siguea WHERE id_seguidor=%d AND id_seguido=%d;' % (id_seguidor[0][0],id_seguido))
        if follow == []:
            return "NO"
        return "YES"

    def follow(self,email,id_seguido):
        id_seguidor = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        Comandos.ejecuta_comando('INSERT INTO siguea (id_seguidor,id_seguido) VALUES (%d,%d);' % (id_seguidor[0][0],id_seguido))
        return "OK"

    def unfollow(self,email,id_seguido):
        id_seguidor = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        Comandos.ejecuta_comando('DELETE FROM siguea WHERE id_seguido=%d AND id_seguidor=%d;' % (id_seguido,id_seguidor[0][0]))
        return "OK"

    '''
    Regresa el id del grupo a partir del nombre de este ultimo
    email: el nombre del grupo
    '''
    def get_id_grupo(self, nombre):
        i = Comandos.consulta('SELECT id FROM grupos WHERE nombre = \'%s\';' % (nombre))
        return i[0][0]

    def get_publicaciones_perfil(self,email):
        publicaciones =  """
            <div id="publicacion_nueva"> 
                <form action="publica" method="POST" enctype="multipart/form-data" id="new_public">
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
                    %s
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
                %s
                <div id="nuevo_comentario">
                <form action="comenta" method="POST" id="new_comment">
                    <input type="text" name="comentario" placeholder="Escribe un comentario..."/>
                    <select name="id_publicacion">              
                        <option value="%d">...</option>
                    </select>
                </form>  
                <div id="califica">
                    <div id="muy_malo">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="malo">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="regular">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="bueno">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="muy_bueno">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                </div> 
                </div>
            </div>
            <div id="espacio_perfil"></div>
            """
        materias = Comandos.consulta('SELECT materia FROM materias;')
        cad_materias = ""
        for materia in materias:
            cad_materias += '<option value="%s">%s</option>\n' %(materia[0],materia[0])
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        rows = Comandos.consulta('SELECT id,id_materia,fecha,id_archivo,id_usuario,contenido,hora FROM publicaciones WHERE id_usuario = \'%s\' ORDER BY id DESC;' % (id_usuario[0][0]))
        cadena = ""
        if rows == []:
            return publicaciones % (cad_materias,"")
        import Controller
        control = Controller.Controller()
        for row in rows:
            n = Comandos.consulta('SELECT nombre FROM usuario WHERE id = %d;' % (id_usuario[0][0]))
            a = Comandos.consulta('SELECT apellido FROM usuario WHERE id = %d;' % (id_usuario[0][0]))
            materia = Comandos.consulta('SELECT materia FROM materias WHERE id = %d;' % (row['id_materia']))
            nombre = '%s %s'%(n[0][0],a[0][0])
            if not row['id_archivo'] is None:
                tipo = Comandos.consulta('SELECT tipo FROM archivos WHERE id = %d;' % (row['id_archivo']))
                arch = Comandos.consulta('SELECT url_archivo FROM archivos WHERE id = %d;' % (row['id_archivo']))
                if(tipo[0][0] == 'imagen'):                    
                    cadena += publicacion_cf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],'<img src=\"%s\"/>'%arch[0][0],materia[0][0],row['id'])
                else:
                    cadena += publicacion_cf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],'<a href=\"%s\">Archivo PDF.</a>'%arch[0][0],materia[0][0],row['id'])
            else:
                cadena += publicacion_sf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],materia[0][0],control.get_comentarios_en_publicaciones(row['id']),row['id'])
        return publicaciones % (cad_materias,cadena)

    def get_publicaciones_perfil_u(self,id):
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
                    %s
                </div>
                <div id="materia_p">
                    <p>%s</p>
                </div>
            </div>
            <div id="espacio_perfil"></div>
            """
        publicacion_sf = """ 
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
                %s
                <div id="nuevo_comentario">
                <form action="perfil/comenta" method="POST" id="new_comment">
                    <input type="text" name="comentario" placeholder="Escribe un comentario..."/>
                    <select name="id_publicacion">              
                        <option value="%d">...</option>
                    </select>
                </form>  
                <div id="califica">
                    <div id="muy_malo">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="malo">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="regular">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="bueno">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                    <div id="muy_bueno">
                        <img data-other-src="/static/img/star.png" src="/static/img/no-star.png"/>
                    </div>
                </div> 
                </div>
            </div>
            <div id="espacio_perfil"></div>
            """
        rows = Comandos.consulta('SELECT id,id_materia,fecha,id_archivo,id_usuario,contenido,hora FROM publicaciones WHERE id_usuario = %d ORDER BY id DESC;' % (id))
        cadena = ""
        if rows == []:
            return """"
                    <div id="publicaciones_usuario">
                        <div id="nombre_p">
                            <p>No hay publicaciones :c</p>
                        </div>
                    </div>
                    """        
        import Controller
        control = Controller.Controller()        
        for row in rows:
            n = Comandos.consulta('SELECT nombre FROM usuario WHERE id = %d;' % (id))
            a = Comandos.consulta('SELECT apellido FROM usuario WHERE id = %d;' % (id))
            materia = Comandos.consulta('SELECT materia FROM materias WHERE id = %d;' % (row['id_materia']))
            nombre = '%s %s'%(n[0][0],a[0][0])
            if not row['id_archivo'] is None:
                tipo = Comandos.consulta('SELECT tipo FROM archivos WHERE id = %d;' % (row['id_archivo']))
                arch = Comandos.consulta('SELECT url_archivo FROM archivos WHERE id = %d;' % (row['id_archivo']))
                if(tipo[0][0] == 'imagen'):                    
                    cadena += publicacion_cf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],'<img src=\"%s\"/>'%arch[0][0],materia[0][0],row['id'])
                else:
                    cadena += publicacion_cf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],'<a href=\"%s\">Archivo PDF.</a>'%arch[0][0],materia[0][0],row['id'])
            else:
                cadena += publicacion_sf % (row['id'],nombre,row['fecha'],row['hora'],row['contenido'],materia[0][0],control.get_comentarios_en_publicaciones(row['id']),row['id'])
        return cadena

    
    def actualiza_foto(self, email, archivo):
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
        shutil.move('/tmp/'+archivo.filename,'home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/fotos_perfil')
        os.chmod('home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/fotos_perfil/%s'%(archivo.filename),stat.S_IRWXU)
        id_usuario = Comandos.consulta('SELECT id FROM usuario WHERE nick_name = \'%s\';' % (email))
        Comandos.ejecuta_comando('INSERT INTO archivos (url_archivo,id_usuario,id_grupo,tipo) VALUES (\'%s\',%d,NULL,\'%s\');' % (('/static/img/fotos_perfil/%s'%(archivo.filename)),id_usuario[0][0],'imagen'))
        Comandos.ejecuta_comando('UPDATE usuario SET foto=\'%s\' WHERE nick_name=\'%s\';' % (('/static/img/fotos_perfil/%s'%(archivo.filename)), email))

    def get_info_perfil(self, email):
        info = """
            <div id="info_p">
                <h2>Informaci&oacute;n</h2>
                <div id="nombre_i">
                    <p>Nombre: %s</p>
                </div>
                <div id="edad_i">
                    <p>Edad: %s</p>
                    <p>Fecha de nacimiento: %s</p>
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
                <div id="rating">
                    <p>Rating: %g</p>
                </div>
                <div id="foto_i">
                    <img src=\'%s\'/>
                </div>
                <form onsubmit="return Verify(this);" action="actualiza_foto" method="post" enctype="multipart/form-data"> 
                    <div id="div_act_foto">
                        <input type="file" name="nueva_foto"/>                    
                        <input type="submit" value="Actualizar"/>
                    </div>
                </form>
            </div>
            """
        import Controller
        control = Controller.Controller()        
        nombre = control.get_nombre(email)
        edad = control.get_edad(email)
        f_nac = Comandos.consulta('SELECT f_nacimiento FROM usuario WHERE nick_name=\'%s\';' % (email))
        g = Comandos.consulta('SELECT genero FROM usuario WHERE nick_name=\'%s\';' % (email))
        if g[0][0] == 'm':
            genero = "Masculino"
        else:
            genero = "Femenino"
        id_escuela = Comandos.consulta('SELECT escuela FROM usuario WHERE nick_name=\'%s\';' % (email))
        escuela = Comandos.consulta('SELECT nombre FROM escuela where id=\'%d\';' % (id_escuela[0][0]))
        id_pais = Comandos.consulta('SELECT nacionalidad FROM usuario WHERE nick_name=\'%s\';' % (email))
        pais = Comandos.consulta('SELECT pais FROM paises WHERE id=\'%d\';' % (id_pais[0][0]))
        raiting = Comandos.consulta('SELECT rating FROM usuario WHERE nick_name=\'%s\';' % (email))
        foto = Comandos.consulta('SELECT foto FROM usuario WHERE nick_name=\'%s\';' % (email))
        return (info % (str(nombre),str(edad),str(f_nac[0][0]),str(genero),str(email),str(escuela[0][0]),str(pais[0][0]),raiting[0][0],str(foto[0][0])))

    def get_info_perfil_u(self, id):
        info = """
            <div id="info_p">
                <h2>Informaci&oacute;n</h2>
                <div id="nombre_i">
                    <p>Nombre: %s</p>
                </div>
                <div id="edad_i">
                    <p>Edad: %s</p>
                    <p>Fecha de nacimiento: %s</p>
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
                <div id="rating">
                    <p>Rating: %g</p>
                </div>
                <div id="foto_i">
                    <img src=\'%s\'/>
                </div>
            </div>
            """
        import Controller
        control = Controller.Controller()        
        nombre = control.get_nombre_u(id)
        edad = control.get_edad_u(id)
        f_nac = Comandos.consulta('SELECT f_nacimiento FROM usuario WHERE id=%d;' % (id))
        g = Comandos.consulta('SELECT genero FROM usuario WHERE id=%d;' % (id))
        if g[0][0] == 'm':
            genero = "Masculino"
        else:
            genero = "Femenino"
        id_escuela = Comandos.consulta('SELECT escuela FROM usuario WHERE id=%d;' % (id))
        escuela = Comandos.consulta('SELECT nombre FROM escuela where id=%d;' % (id_escuela[0][0]))
        id_pais = Comandos.consulta('SELECT nacionalidad FROM usuario WHERE id=%d;' % (id))
        pais = Comandos.consulta('SELECT pais FROM paises WHERE id=%d;' % (id_pais[0][0]))
        raiting = Comandos.consulta('SELECT rating FROM usuario WHERE id=%d;' % (id))
        foto = Comandos.consulta('SELECT foto FROM usuario WHERE id=%d;' % (id))
        return (info % (str(nombre),str(edad),str(f_nac[0][0]),str(genero),str(control.get_nick(id)),str(escuela[0][0]),str(pais[0][0]),raiting[0][0],str(foto[0][0])))



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
            tipo=""
            if(str(archivo.type) == 'application/pdf'):
                tipo = 'pdf'
            else:
                tipo = 'imagen'
            shutil.move('/tmp/'+archivo.filename,'home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/archivos')
            os.chmod('home/miguel/Documentos/Modelado/Subject/web-server/Vista/img/archivos/%s'%(archivo.filename),stat.S_IRWXU)      
            Comandos.ejecuta_comando('INSERT INTO archivos (url_archivo,id_usuario,id_grupo,tipo) VALUES (\'%s\',%d,NULL,\'%s\');' % (('/static/img/archivos/%s'%(archivo.filename)),id_usuario[0][0],tipo))            
            id_archivo = Comandos.consulta('SELECT id FROM archivos WHERE url_archivo = \'%s\';' % (('/static/img/archivos/%s'%(archivo.filename))))
            Comandos.ejecuta_comando('INSERT INTO publicaciones (id_usuario,id_grupo,id_archivo,id_materia,fecha,visibilidad,contenido,hora) VALUES (%d,NULL,%d,%d,\'%s\',NULL,\'%s\',\'%s\');' %(id_usuario[0][0],id_archivo[0][0],id_materia[0][0],fecha,contentp,hora))
            return
        Comandos.ejecuta_comando('INSERT INTO publicaciones (id_usuario,id_grupo,id_materia,fecha,visibilidad,contenido,hora,calificacion,num_calif) VALUES (%d,NULL,%d,\'%s\',NULL,\'%s\',\'%s\',0,0);' %(id_usuario[0][0],id_materia[0][0],fecha,contentp,hora))
        return

    def busca(self, buscador_personas, email):
        '''
        Busca a la persona en la base de datos
        buscador_personas: el nombre de la persona a buscar
        '''
        if not self.cadena_valida(buscador_personas):
            return []
        i = 0
        nombre_completo = buscador_personas.split()
        s = "SELECT * FROM usuario WHERE "
        for name in nombre_completo:
            if i != 0:
                s += "OR"
            s += "LOWER(nombre) LIKE LOWER(\'%" + name + "%\') OR LOWER(apellido) LIKE LOWER(\'%" + name + "%\') OR id IN(SELECT id_usuario FROM persona_carrera WHERE id_carrera_titulo IN (SELECT id FROM carrera WHERE LOWER(nombre) LIKE LOWER(\'%" + name + "%\'))) "
            i += 1
        rows=Comandos.consulta(s)
        results_u="""
        <form action="../perfil" method="post">
                %s
        </form>        
        """
        d_u=""" 
        <form action="../perfil" method="post">   
            <div id="result_item">
                <div id="img_result">
                    <img src="%s"/>
                </div>
                <button type="submit">%s %s</button>
            </div>        
        </form>
        <div id="espacio_resultados"></div>
        """
        d="""
        <form action="../visita_perfil" method="post">            
            <div id="result_item">
                <img src="%s"/>
                <button type="submit" name="usuario" value="%d">%s %s</button>
            </div>
            <div id="espacio_resultados"></div>
         </form>
         <div id="espacio_resultados"></div>
        """
        c=""
        for x in range (0,len(rows)):
            if(rows[x][4] == email):
                 c+= d_u % (rows[x][9],rows[x][1],rows[x][2])
            else:
                c+= d % (rows[x][9],rows[x][0],rows[x][1],rows[x][2])
        return {'cadena':buscador_personas,'resultados': c}

    def get_grupos_usuario(self, id):
        '''
        Regresa los grupos de un usuario dado su id
        id: el id en la base del usuario
        '''
        if self.is_number(id):
            s = "SELECT * FROM grupos WHERE id IN (SELECT id_grupo FROM grupo_usuario WHERE id_usuario = "
            s += id + ')'
            return Comandos.consulta(s)
        return []

    def cadena_valida(self, cadena):
        '''
        Regresa True si la cadena es valida (no contiene palabras reservadas) y
        False en otro caso
        cadena: la cadena a analizar
        returns: si la cadena es valida
        '''
        baja = cadena
        palabras_reservadas = ["drop", " or ", " or", "or ", " and ", " and", 
                               "and ", "select", "*", "#", "$", "%", "&", "/", 
                               "(", ")", "?", "\'", "\"", "!", "\\", "+",
                               " - ", "- ", " -"] 
        for palabra in palabras_reservadas:
            if palabra in baja:
                return False
        return True

    def is_number(self, s):
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

    def comenta(self,coment,id_usr,id_publicacion):
        fecha = time.strftime('%Y-%m-%d')
        hora = time.strftime('%X')
        Comandos.ejecuta_comando('INSERT INTO comentarios(contenido,id_usuario,id_publicacion,fecha,hora) VALUES(\'%s\',%d,%d,\'%s\',\'%s\');'%(coment,id_usr,int(id_publicacion),fecha,hora))
        id_visit = Comandos.consulta('SELECT id_usuario FROM publicaciones WHERE id = %d;' % (int(id_publicacion)))
        return id_visit[0][0]

    def get_comentarios_en_publicaciones(self,id_publicacion):
        comentarios_usuario = """<div id="comentarios_usuario">
            %s
            </div>"""
        comentario = ""
        rows = Comandos.consulta('SELECT * FROM comentarios WHERE id_publicacion = %d;'%(id_publicacion))        
        for row in rows:
            nom = Comandos.consulta('SELECT nombre,apellido FROM usuario WHERE id = %d;'%row['id_usuario'])
            nombre ="%s %s"%(nom[0][0],nom[0][1]) 
            comentario += """<div id="comment">
            <div id="nombre_usr">
                <a href="../perfil"><p>%s</p></a>
            </div>
            <div id="fecha_comment">
                <p>%s - %s</p>
            </div>
            <div id="contenido_comment">
                <p>%s</p>
            </div>
            </div>\n"""%(nombre,row['fecha'],row['hora'],row['contenido'])
        return comentarios_usuario%comentario
        
