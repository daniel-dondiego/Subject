class Rating(object):

	def __init__(self,id,id_usuario,calificacion):
		self.__id = id
		self.__id_usuario = id_usuario
		self.__calificacion = calificacion
	
	def __str__(self):
	   return self.__id_usuario

	def get_id_usuario(self):
		return self.__id_usuario
	
	def get_calificacion(self):
		return self.calificacion
