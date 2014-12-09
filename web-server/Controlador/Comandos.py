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

ejecuta_comando('''CREATE TABLE COMPANY
       (ID INT PRIMARY KEY     NOT NULL,
       NAME           TEXT    NOT NULL,
       AGE            INT     NOT NULL,
       ADDRESS        CHAR(50),
       SALARY         REAL);''')
ejecuta_comando("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (1, 'Paul', 32, 'California', 20000.00 )")
ejecuta_comando("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (2, 'Allen', 25, 'Texas', 15000.00 )")
ejecuta_comando("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (3, 'Teddy', 23, 'Norway', 20000.00 )")
ejecuta_comando("INSERT INTO COMPANY (ID,NAME,AGE,ADDRESS,SALARY) \
      VALUES (4, 'Mark', 25, 'Rich-Mond ', 65000.00 )")
rows = consulta("SELECT id, name, address, salary  from COMPANY")
for row in rows:
    print ("ID = ", row[0])
    print ("NAME = ", row[1])
    print ("ADDRESS = ", row[2])
    print ("SALARY = ", row[3], "\n")
Conexion.cierraConexion()
