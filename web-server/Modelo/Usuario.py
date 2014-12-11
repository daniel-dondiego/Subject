#!/usr/bin/python
# -*- coding: utf-8 -*-
#Clase que abstrae la informacion de un usuario
import sys
sys.path.append("..")
from Controlador import Comandos
import psycopg2


class Usuario(object):
    #constructor 
    def __init__(self,id,nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating):
        if(id is None):
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
        else:
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
        return self.id
    
    def get_nombre(self):
        return self.nombre

    def get_apellido(self):
        return self.apellido

    def get_genero(self):
        return self.genero

    def get_nick_name(self):
        return self.nick_name

    def get_foto(self):
        return self.foto

    def get_escuela(self):
        return self.escuela
    
    def get_nacionalidad(self):
        return self.nacionalidad

    def get_f_nacimiento(self):
        return self.f_nacimiento
        
    def get_rating(self):
        return self.rating


    def registra(self):
        ejecuta_comando('INSERT INTO usuario (nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating) \
        VALUES ('+'\''+str(self.__nombre)+'\''+','+'\''+str(self.__apellido)+'\''+','+'\''+str(self.__genero)+'\''+','+'\''+str(self.__nick_name)+'\''+','+ str(self.__foto)+','+str(self.__escuela)+','+'\''+str(self.__password)+'\''+','+str(self.__nacionalidad)+','+'\''+str(self.__f_nacimiento)+'\''+','+str(self.__rating)+')')
        
        


