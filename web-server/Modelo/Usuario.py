#!/usr/bin/python
#Clase que abstrae la informacion de un usuario
import sys
sys.path.append("..")
from Controlador import Conexion, Comandos, PasswordHashing
import psycopg2
import struct


class Usuario(object):
    
    def __init__(self,id,nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating):
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
        nacionalidad: el id de la nacionalidad del usuario
        f_nacimiento: la fecha de nacimiento del usuario
        rating: la calificacion del usuario
        '''
        if(not id is None):
            self.__id=id
        self.__nombre = nombre
        self.__apellido = apellido
        self.__genero = genero
        self.__nick_name = nick_name
        self.__foto = foto
        self.__escuela = escuela
        self.__password = password#PasswordHashing.Password(password, PasswordHashing.salt())
        self.__nacionalidad = nacionalidad
        self.__f_nacimiento = f_nacimiento
        self.__rating = rating
        
    def get_id(self):
        '''
        Regresa el id del usuario en la base de datos
        returns: el id del usuario
        '''
        return self.__id
    
    def set_id(self, id):
        '''
        Actualiza el valor del id
        id: el nuevo valor para el id
        '''
        self.__id = id
        
    def get_nombre(self):
        '''
        Regresa el nombre del usuario
        returns: el nombre del usuario
        '''
        return self.__nombre

    def set_nombre(self, nombre):
        '''
        Actualiza el nombre del usuario
        nombre: el nuevo nombre del usuario
        '''
        self.__nombre = nombre

    def get_apellido(self):
        '''
        Regresa el apellido del usuario
        returns: el apellido del usuario
        '''
        return self.__apellido
        
    def set_apellido(self, apellido):
        '''
        Actualiza el valor del apellido
        apellido: el nuevo apellido del usuario
        '''
        self.__apellido = apellido

    def get_genero(self):
        '''
        Regresa el genero del usuario
        returns: el genero del usuario
        '''
        return self.__genero
        
    def set_genero(self, genero):
        '''
        Actualiza el genero del usuario
        genero: el nuevo genero del usuario
        '''
        self.__genero = genero

    def get_nick_name(self):
        '''
        Regresa el nickname del usuario
        returns: el nickname del usuario
        '''
        return self.__nick_name

    def set_nick_name(self, nick_name):
        '''
        Actualiza el nickname del usuario
        nick_name: el nuevo nickname del usuario
        '''
        self.__nick_name = nick_name

    def get_foto(self):
        '''
        Regresa la foto del usuario
        returns: la foto del usuario
        '''
        return self.__foto
        
    def set_foto(self, foto):
        '''
        Actualiza la foto del usuario
        foto: el url de la nueva foto del usuario
        '''
        self.__foto = foto

    def get_escuela(self):
        '''
        Regresa el id de la escuela del usuario
        returns: el id de la escuela del usuario
        '''
        return self.__escuela
    
    def set_escuela(self, escuela):
        '''
        Actualiza la escuela del usuario
        escuela: el nuevo id de la escuela del usuario
        '''
        self.__escuela = escuela

    def get_nacionalidad(self):
        '''
        Regresa el id de la nacionalidad del usuario
        returns: el id de la nacionalidad del usuario
        '''
        return self.__nacionalidad

    def set_nacionalidad(self, nacionalidad):
        '''
        Actualiza el id de la nacionalidad del usuario
        nacionalidad: el nuevo id de la nacionalidad del usuario
        '''
        self.__nacionalidad = nacionalidad

    def get_f_nacimiento(self):
        '''
        Regresa la fecha de nacimiento del usuario
        returns: la fecha de nacimiento del usuario
        '''
        return self.__f_nacimiento

    def set_f_nacimiento(self, f_nacimiento):
        '''
        Actualiza la fecha de nacimiento del usuario
        f_nacimiento: la nueva fecha de nacimiento del usuario
        '''
        self.__f_nacimiento = f_nacimiento
        
    def get_rating(self):
        '''
        Regresa el rating del usuario
        returns: el rating del usuario
        '''
        return self.__rating

    def set_rating(self, rating):
        '''
        Actualiza el rating del usuario
        rating: el nuevo rating del usuario
        '''
        self.__rating = rating

    def get_password(self):
        '''
        Regresa la contrasena del usuario
        returns: la contrasena del usuario
        '''
        return self.__password
        
    def set_password(self, password):
        '''
        Actualiza la contrasena del usuario
        password: la nueva contrasena del usuario
        '''
        self.__password = password#PasswordHashing.Password(password, PasswordHashing.salt())

    def registra(self):
        '''
        Registra al usuario en la base de datos
        '''
        c = Conexion.getConexion()
        cur = c.cursor()
        cur.execute('INSERT INTO usuario (nombre,apellido,genero,nick_name,escuela, nacionalidad, f_nacimiento, rating, foto, salt, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', (self.__nombre, self.__apellido, self.__genero, self.__nick_name, self.__escuela, self.__nacionalidad, self.__f_nacimiento, self.__rating, self.__foto, psycopg2.Binary(self.__password.get_salt()), psycopg2.Binary(self.__password.create_hash())))
        c.commit()
     
    def get_grupos(self):
        '''
        Regresa una lista de tuples con los grupos del usuario
        returns: la lista de los grupos del usuario
        '''
        s = 'SELECT * FROM grupos WHERE id IN (SELECT id_grupo FROM grupo_usuario WHERE id_usuario = '
        s += str(self.__id) + ')'
        return Comandos.consulta(s)
        
#u = Usuario(None,"Luis","Soto","M","Lu1sZiTh0","http","1","Luisz","1","10-10-2010",0)
#u.registra()
#rows = Comandos.consulta("SELECT * FROM usuario")
#for row in rows:
#    print 'Salt: ' + str(row[10])

