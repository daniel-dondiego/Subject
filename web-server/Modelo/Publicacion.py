#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
sys.path.append("..")
from Controlador import Comandos

class Publicacion(object):

    def __init__(self,id,id_usuario,id_grupo,id_archivo,id_materia,fecha,visibilidad):
        '''
        Constructor
        id: el id de la publicacion en la base de datos
        id_usuario: el id del usuario que publico
        id_grupo: el id de grupo en el que se hizo la publicacion
        id_archivo: el archivo que tiene la publicacion
        id_materia: la materia sobre la cual se publico
        fecha: la fecha en que se hizo la publicacion
        visibilidad: la visibilidad de la publicacion
        '''
        self.__id = id
	self.__id_usuario = id_usuario
	self.__id_grupo = id_grupo
	self.__id_archivo = id_archivo
	self.__id_materia = id_materia
	self.__fecha = fecha
	self.__visibilidad = visibilidad

    def get_id(self):
        '''
        Regresa el id de la publicacion en la base de datos
        returns: el id de la publicacion
        '''
        return self.__id
    
    def set_id(self, id):
        '''
        Actualiza el id de la publicacion
        id: el nuevo id de la publicacion
        '''
        self.__id = id

    def get_id_usuario(self):
        '''
        Regresa el id del usuario que publico
        returns: el id del usuario que creo la publicacion
        '''
        return self.__id_usuario

    def set_id_usuario(self, id_usuario):
        '''
        Actualiza el valor del id del usuario que publico
        id_usuario: el nuevo id del usuario
        '''
        self.__id_usuario = id_usuario

    def get_id_grupo(self):
        '''
        Regresa el id del grupo en el que se publico
        returns: el id del grupo en el que esta la publicacion
        '''
        return self.__id_grupo

    def set_id_grupo(self, id_grupo):
        '''
        Actualiza el id del grupo en el que se publico
        id_grupo: el nuevo id del grupo
        '''

    def get_id_archivo(self):
        '''
        Regresa el id del archivo que esta en la publicacion(si este existe)
        returns: el id del archivo que esta en la publicacion
        '''
        return self.__id_archivo

    def set_id_archivo(self, id_archivo):
        '''
        Actualiza el id del archivo que esta en la publicacion
        id_archivo: el nuevo id del archivo de la publicacion
        '''
        self.__id_archivo = id_archivo

    def get_id_materia(self): 
        '''
        Regresa el id de la materia sobre la que se publico
        returns: el id de la materia sobre la que es la publicacion
        '''
        return self.__id_materia

    def set_id_materia(self, id_materia):
        '''
        Actualiza el id de la materia sobre la que es la publicacion
        id_materia: el nuevo id de la materia
        '''
        self.__id_materia = id_materia

    def get_fecha(self):
        '''
        Regresa la fecha en que se publico
        returns: la fecha de publicacion
        '''
        return self.__fecha

    def set_fecha(self, fecha):
        '''
        Actualiza la fecha de la publicacion
        fecha: la nueva fecha de la publicacion
        '''
        self.__fecha = fecha

    def get_visibilidad(self):
        '''
        Regresa la visibilidad de la publicacion
        returns: la visibilidad de la publicacion
        '''
        return self.__visibilidad	

    def set_visibilidad(self, visibilidad):
        '''
        Actualiza la visibilidad de la publicacion
        visibilidad: la nueva visibilidad de la publicacion
        '''
        self.__visibilidad = visibilidad

    def get_likes(self):
        '''
        Regresa los likes de la publicacion
        returns: los likes de la publicacion
        '''
        s = "SELECT * FROM likes WHERE id_publicacion = " + str(self.id)
        return Comandos.Consulta(s)

    def get_numero_likes(self):
        '''
        Regresa el numero de likes en la publicacion
        returns: el numero de likes en la publicacion
        '''
        likes = self.get_likes()
        return len(likes)
        
    def like(self, id_usuario):
        '''
        Agrega un like a la publicacion 
        id_usuario: el id del usuario que dio el like
        '''
        if not self.has_liked(id_usuario):
            s = "INSERT INTO likes (id_usuario, id_publicacion) VALUES (" + str(id_usuario) + ", " + str(self.__id) + ")"
            Comandos.ejecuta_comando(s)

    def dislike(self, id_usuario):
        '''
        Elimina el like de la publicacion dado por el usuario(si este existe)
        id_usuario: el id del usuario de quien se quiere eliminar el like
        '''
        Comandos.ejecuta_comando("DELETE * FROM likes WHERE id_usuario = " + str(id_usuario) + " AND id_publicacion = " + str(self.__id))

        
    def has_liked(self, id_usuario):
        '''
        Regresa True si el usuario le dio like a la publicacion y False en otro caso
        id_usuario: el id del usuario que se quiere saber si dio like
        returns: si el usuario con el id le dio like a la publicacion
        '''
        s = 'SELECT * FROM likes WHERE id_usuario = ' + str(id_usuario) 
        likes = Comandos.consulta(s)
        return len(likes) != 0
