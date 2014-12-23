#!/usr/bin/python
# -*- coding: utf-8 -*-
#Clase que abstrae la informacion de un usuario
import sys
sys.path.append("..")
from Controlador import Comandos
import psycopg2


class Usuario(object):
    '''
    Constructor
    id: el id del usuario en la base
    nombre: el nombre del usuario
    apellido: el apellido del usuario
    genero: el genero del usuario (m o f)
    nick_name: el nickname del usuario
    foto: la foto del usuario
    escuela: el id de la escuela del usuario
    password: la contrasena del usuario
    nacionalidad: el id del pais en que nacio el usuario
    f_nacimiento: la fecha de nacimiento del usuario
    rating: la calificacion del usuario
    '''
    def __init__(self,id,nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating):
        if(not id is None):
            self.__id=id
        self.__nombre = nombre
        self.__apellido = apellido
        self.__genero = genero
        self.__nick_name = nick_name
        self.__foto = foto
        self.__escuela = escuela
        self.__password = password
        self.__nacionalidad = nacionalidad
        self.__f_nacimiento = f_nacimiento
        self.__rating = rating
        
    def get_id(self):
        '''
        Regresa el id del usuario en la base de datos
        returns: el id del usuario
        '''
        return self.__id
    
    def get_nombre(self):
        '''
        Regresa el nombre del usuario
        returns: el nombre del usuario
        '''
        return self.__nombre

    def get_apellido(self):
        '''
        Regresa el apellido del usuario
        returns: el apellido del usuario
        '''
        return self.__apellido

    def get_genero(self):
        '''
        Regresa el genero del usuario
        returns: el genero del usuario
        '''
        return self.__genero

    def get_nick_name(self):
        '''
        Regresa el nickname del usuario
        returns: el nickname del usuario
        '''
        return self.__nick_name

    def get_foto(self):
        '''
        Regresa la foto del usuario
        returns: la foto del usuario
        '''
        return self.__foto

    def get_escuela(self):
        return self.__escuela
    
    def get_nacionalidad(self):
        return self.__nacionalidad

    def get_f_nacimiento(self):
        return self.__f_nacimiento
        
    def get_rating(self):
        return self.__rating

    def get_password(self):
        return self.__password

    def registra(self):
        ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating) \
        VALUES ('+'\''+str(self.__nombre)+'\''+','+'\''+str(self.__apellido)+'\''+','+'\''+str(self.__genero)+'\''+','+'\''+str(self.__nick_name)+'\''+','+ str(self.__foto)+','+str(self.__escuela)+','+'\''+str(self.__password)+'\''+','+str(self.__nacionalidad)+','+'\''+str(self.__f_nacimiento)+'\''+','+str(self.__rating)+')')
        
        


