#!/usr/bin/python
# -*- coding: utf-8 -*-

import psycopg2
import psycopg2.extras
import sys
import Conexion
import random
import smtplib

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

def correo_de_confirmacion(correo,clave):
    '''
    Envia un correo de confirmacion para validar el registro
    correo: el correo del usuario
    clave: la clave de validacion
    '''
    TO = correo
    SUBJECT = "TERMINA TU REGISTRO!"
    TEXT = "tu clave de cuatro digitos es: %s" % str(clave)
    gmail_sender = 'notificaciones.subject@gmail.com'

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.ehlo()
    server.starttls()
    server.ehlo()
    server.login(gmail_sender,'proyecto3')
        
    BODY = '\r\n'.join([
           'To: %s'%TO,
           'From: %s'%gmail_sender,
           'Subject: %s'%SUBJECT,
           '',
           TEXT
           ])
    try:
       server.sendmail(gmail_sender,[TO],BODY)
       print 'email sent'
    except:
       print 'error'
    server.quit()

def genera_clave():
    '''
    Genera la clave de validacion del usuario
    returns: una clave aleatoria para validar la cuenta
    '''
    clave = ''
    for x in range(0,4):
        clave += str(random.randint(0,9))
    return clave

Conexion.cierraConexion()
