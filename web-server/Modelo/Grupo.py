#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
sys.path.append("..")
from Controlador import Comandos
import psycopg2

class Grupo(object):
	
    def __init__(self,id,nombre,id_usuario,visibilidad,imagen):
        '''
        Constructor
        id: el id del grupo en la base
        nombre: el nombre del grupo
        id_usuario: el id del usuario que creo el grupo
        visibilidad: la visibilidad del grupo
        imagen: la imagen del grupo
        '''
        self.__id = id
        self.__nombre = nombre
        self.__id_usuario = id_usuario
        self.__visibilidad = visibilidad
        self.__imagen = imagen
	
    def __str__(self):
        '''
        Regresa una cadena con el nombre del grupo
        Returns: el nombre del grupo
        '''
        return self.__nombre

    def cambia_parametros(self):
        '''
        'Construye' los parametros de un grupo a partir de su id
        '''
        busqueda = "SELECT * FROM grupos WHERE id = " + str(self.__id) 
        rows = Comandos.consulta(busqueda)
        if len(rows) == 0:
            return
        self.__nombre = rows[0][4]
        self.__imagen = rows[0][1]
        self.__visibilidad = rows[0][2]
        self.__id_usuario = rows[0][3]

    def get_id(self):
        '''
        Regresa el id del grupo
        Returns: el id del grupo
        '''
        return self.__id
	
    def get_nombre(self):
	'''
        Regresa el nombre del grupo
        Returns: el nombre del grupo
        '''
        return self.__nombre

    def get_id_usuario(self):
        '''
        Regresa el id del usuario que creo el grupo
        Returns: el id del usuario que creo el grupo
        '''
        return self.__id_usuario

    def get_visibilidad(self):
        '''
        Regresa la visibilidad del grupo
        Returns: la visibilidad del grupo
        '''
	return self.__visibilidad

    def get_imagen(self):
        '''
        Regresa la imagen del grupo
        Returns: la imagen del grupo
        '''
	return self.__imagen

    def set_id(self, id):
        '''
        Actualiza el valor del id del grupo
        id: el nuevo id
        '''
        self.__id = id
    
    def set_nombre(self, nombre):
        '''
        Actualiza el nombre del grupo
        nombre: el nuevo nombre para el grupo
        '''
        self.__nombre = nombre
    
    def set_id_usuario(self, id_usuario):
        '''
        Actualiza el valor del id del administrador del grupo
        id_usuario: el nuevo id del usuario
        '''
        self.__id_usuario = id_usuario
        
    def set_visibilidad(self, visibilidad):
        '''
        Cambia la visibilidad del grupo
        visibilidad: la nueva visibilidad del grupo
        '''
        self.__visibilidad = visibilidad
        
    def set_imagen(self, imagen):
        '''
        Cambia la imagen del grupo
        imagen: la nueva imagen del grupo
        '''
        self.__imagen = imagen
    
    def get_usuarios(self):
        '''
        Regresa a los usuarios del grupo en una lista de tuples
        Returns: una lista de tuples con los usuarios
        '''
        s = 'SELECT * FROM usuario WHERE id IN (SELECT id_usuario FROM '
        s += 'grupo_usuario WHERE id_grupo = '
        s += str(self.__id) + ');' 
        return Comandos.consulta(s)

    def get_publicaciones(self):
        '''
        Regresa las publicaciones del grupo en una lista de tuples
        Returns: una lista de tuples con las publicaciones que
        pertenecen al grupo
        '''
        s = 'SELECT * FROM publicaciones WHERE id_grupo = '
        s += str(self.__id) + ';'
        return Comandos.consulta(s)
    
    def get_archivos(self):
        '''
        Regresa los archivos en las publicaciones del grupo
        Returns: una lista de tuples con los archivos que pertenecen a
        publicaciones del grupo
        '''
        s = 'SELECT * FROM archivos WHERE id_grupo = '
        s += str(self.__id) + ';'
        return Comandos.consulta(s)

    def agrega(self):
        '''
        Agrega el grupo a la base
        '''
        s = 'INSERT INTO grupos (nombre, id_usuario, visibilidad, imagen) VALUES(\''
        s += str(self.__nombre) + '\', ' + str(self.__id_usuario) + ', ' + str(self.__visibilidad) + ', \'' + str(self.__imagen) + '\')'
        Comandos.ejecuta_comando(s)

    def agrega_usuario(self, id_usuario):
        '''
        Agrega un usuario al grupo
        id_usuario: el id del usuario a agregar al grupo
        '''
        s = 'INSERT INTO grupo_usuario (id_grupo, id_usuario) VALUES('
        s += str(self.__id) + ', ' + str(id_usuario) + ')'
        Comandos.ejecuta_comando(s)
    
def existe(nombre):
    '''
    Nos dice si el grupo con nombre 'nombre' ya existe
    nombre: el nombre del grupo que queremos saber si existe
    '''
    query = "SELECT * FROM grupos WHERE nombre = " + nombre
    rows = Comandos.consulta(s)
    return len(rows) != 0
