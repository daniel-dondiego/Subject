class Grupo(object):
	def __init__(self,id,nombre,id_usuario,visibilidad,imagen):
		self.__id=id
		self.__nombre = nombre
		self.__id_usuario = id_usuario
		self.__visibilidad = visibilidad
		self.__imagen = imagen
	
	def get_id(self):
		return self.id
	
	def get_nombre(self):
		return self.nombre

	def get_id_usuario(self):
		return self.id_usuario

	def get_visibilidad(self):
		return self.visibilidad

	def get_imagen(self):
		return self.imagen