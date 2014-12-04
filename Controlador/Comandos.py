#!/usr/bin/python

import psycopg2
from Conexion import Conexion

def ejecuta_comando(conexion, comando_sql):
    '''
    Ejecuta el comando de sql dado
    '''
    c = conexion.getConexion()
    cur = c.cursor()
    cur.execute(comando_sql)
    c.commit()

def consulta(conexion, consulta):
    '''
    Regresa los renglones con los resultados de la consulta
    Returns: una lista de renglones con los resultados de la consulta, para iterar sobre ellos
    '''
    c = conexion.getConexion()
    cur = c.cursor()
    cur.execute(consulta)
    rows = cur.fetchall()
    return rows
    
