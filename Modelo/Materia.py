class Materia(object):

	def __init__(self,id,materia,id_categoria):
		self.__id = id
		self.__materia = materia
		self.__id_categoria = id_categoria
	
	def __str__(self):
	   return self.__materia

	def get_materia(self):
		return self.__materia
	
	def get_id_categoria(self):
		return self.id_categoria
