class Ciudad(object):

	def __init__(self,id,pais,ciudad):
		self.__id = id
		self.__pais = pais
		self.__ciudad = ciudad
	
	def __str__(self):
	   return self.__pais

	def get_pais(self):
		return self.__pais
	
	def get_ciudad(self):
		return self.ciudad
