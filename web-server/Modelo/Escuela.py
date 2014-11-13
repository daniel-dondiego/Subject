
class Escuela(object):

	def __init__(self,id,nombre,imagen,id_archivo,id_materia,fecha,visibilidad):
		self.__id = id
		self.__nombre = nombre
		self.__imagen = imagen

	def get_id(self):
		return self.__id

	def get_nombre(self):
		return self.__nombre

	def get_imagen(self):
		return self.__imagen
	
