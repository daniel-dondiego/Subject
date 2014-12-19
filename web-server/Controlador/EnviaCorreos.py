#!/usr/bin/python
import sys
import smtplib
class EnviaCorreos(object):
	TO = ''
	SUBJECT = ''
	TEXT = ''
		
	def correo_de_confirmacion(correo,clave):
		return 'llego al metodo correo de conf'
		#TO = correo
		#SUBJECT = "Termina tu registro!"
		#TEXT = "tu clave de cuatro digitos es: %s" % str(clave)
		#gmail_sender = 'richarmetal@gmail.com'

		#server = smtplib.SMTP('smtp.gmail.com', 587)
		#server.ehlo()
		#server.starttls()
		#server.ehlo()
		#server.login(gmail_sender,'passwd')
		
		#BODY = '\r\n'.join([
		#		'To: %s'%TO,
		#		'From: %s'%gmail_sender,
		#		'Subject: %s'%SUBJECT,
		#		'',
		#		TEXT
		#		])
		#try:
		#	server.sendmail(gmail_sender,[TO],BODY)
		#	print 'email sent'
		#except:
		#	print 'error'
		#server.quit()

	#correo_de_confirmacion('rdondiego@ciencias.unam.mx',1234)
	
	