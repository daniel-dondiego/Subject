#!/usr/bin/python
# -*- coding: utf-8 -*-

import psycopg2
class Conexion(object):
    
    def __init__(self):
        '''
        Crea un objeto de tipo conexión 
        '''
        self.conn = None
    
    def getConexion(self):
        '''
        Regresa la conexión a la base y la crea si no existe
        Returns: la conexión a la base
        '''
        if self.conn == None:
            self.conn = psycopg2.connect(database="prueba", user="postgres", password="proyecto3", host="127.0.0.1", port="5432")
        return self.conn 

    def cierraConexion(self):
        '''
        Cierra la conexión a la base de datos
        '''
        if self.conn != None:
            self.conn.close()
