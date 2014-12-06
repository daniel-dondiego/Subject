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

rows = consulta("SELECT id, name, address, salary  from COMPANY")
for row in rows:
     print ("ID = ", row[0])
     print ("NAME = ", row[1])
     print ("ADDRESS = ", row[2])
     print ("SALARY = ", row[3], "\n")

