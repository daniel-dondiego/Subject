
class Categoria(object):

	def __init__(self,id,nombre):
		self.__id = id
		self.__nombre = nombre

	def get_id(self):
		return self.__id

	def get_nombre(self):
		return self.__nombre
	