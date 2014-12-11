#Clase que abstrae la informacion de un usuario
class Mensaje(object):
	#constructor 
	def __init__(self,id,id_remitente,id_destinatario,mensaje,fecha):
		self.__id = id
		self.__id_remitente = id_remitente
		self.__id_destinatario = id_destinatario
		self.__mensaje = mensaje
		self.__fecha = fecha
	
	def get_id(self):
	        return self.id
	  
	def get_id_remitente(self):
		return self.id_remitente

	def get_id_destinatario(self):
		return self.id_destinatario

	def get_mensaje(self):
		return self.mensaje

	def get_fecha(self):
		return self.fecha
