#!/usr/bin/python

import psycopg2
import Conexion

def ejecuta_comando(comando_sql):
    '''
    Ejecuta el comando de sql dado
    comando_sql: el comando a ejecutar
    '''
    c = Conexion.getConexion()
    cur = c.cursor()
    cur.execute(comando_sql)
    c.commit()

def consulta(consulta):
    '''
    Regresa los renglones con los resultados de la consulta
    consulta: la consulta a realizar
    Returns: una lista de renglones con los resultados de la consulta, para iterar sobre ellos
    '''
    c = Conexion.getConexion()
    cur = c.cursor()
    cur.execute(consulta)
    rows = cur.fetchall()
    return rows


Conexion.cierraConexion()
