#!/usr/bin/python
# -*- coding: utf-8 -*-

import psycopg2
conn = None
    
def getConexion():
       '''
       Regresa la conexión a la base y la crea si no existe
       Returns: la conexión a la base
       '''
       global conn
       if conn == None:
           conn = psycopg2.connect(database="subject", user="postgres", password="proyecto3", host="127.0.0.1", port="5432")
       return conn 

def cierraConexion():
       '''
       Cierra la conexión a la base de datos
       '''
       global conn
       if conn != None:
          conn.close()
