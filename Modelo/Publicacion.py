class Publicacion(object):
	def __init__(self,id,id_usuario,texto,visto,fecha):
		self.__id=id
		self.__id_usuario = id_usuario
		self.__texto = texto
		self.__visto = visto
		self.__fecha = fecha
		self.__website = website
	
	def get_id(self):
		return self.id
	
	def get_id_usuario(self):
		return self.id_usuario

	def get_texto(self):
		return self.texto

	def get_visto(self):
		return self.visto

	def get_fecha(self):
		return self.fecha
