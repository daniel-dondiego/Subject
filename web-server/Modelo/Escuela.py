#!/usr/bin/python
# -*- coding: utf-8 -*-

class Escuela(object):

    def __init__(self,id,nombre,imagen):
        '''
        Constructor
        id: el id de la escuela en la base de datos
        nombre: el nombre de la escuela
        imagen: la imagen que se mostrará de la escuela
        '''
        self.__id = id
        self.__nombre = nombre
        self.__imagen = imagen

    def __str__(self):
        '''
        Regresa un string con el nombre de la escuela
        Returns: el nombre de la escuela
        '''
        return self.__nombre
    
    def get_id(self):
        '''
        Regresa el id de la escuela en la base de datos
        Returns: el id de la escuela
        '''
        return self.__id

    def get_nombre(self):
	'''
	Regresa el nombre de la escuela
        Returns: el nombre de la escuela
        '''
        return self.__nombre

    def get_imagen(self):
        '''
        Regresa la imagen de la escuela
        Returns: la imagen de la escuela
        '''
        return self.__imagen

    def set_id(self, id):
        '''
        Actualiza el valor del id
        id: el nuevo id
        '''
        self.__id = id

    def set_nombre(self, nombre):
        '''
        Actualiza el valor del nombre
        nombre: el nuevo valor del nombre
        '''
        self.__nombre = nombre

    def set_imagen(self, imagen):
        '''
        Actualiza la imagen de la escuela
        imagen: la nueva imagen
        '''
        self.__imagen = imagen

    
	
                
