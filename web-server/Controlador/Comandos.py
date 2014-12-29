#!/usr/bin/python
# -*- coding: utf-8 -*-

import psycopg2
import psycopg2.extras
import sys
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
    cur = c.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute(consulta)
    rows = cur.fetchall()
    return rows


Conexion.cierraConexion()
