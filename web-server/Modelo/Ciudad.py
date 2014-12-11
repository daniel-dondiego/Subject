class Ciudad(object):

	def __init__(self,id,pais,ciudad):
                '''
                Constructor con id
                id: el id en la tabla de la ciudad
                pais: el pais al que pertenece la ciudad
                ciudad: el nombre de la ciudad
                '''
                self.__id = id
		self.__pais = pais
		self.__ciudad = ciudad
                
	def __str__(self):
	   return self.__pais

	def get_pais(self):
		return self.__pais
	
	def get_ciudad(self):
		return self.ciudad
