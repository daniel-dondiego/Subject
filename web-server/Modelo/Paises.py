#Clase que abstrae la informacion de un pais
class Pais(object):

	def __init__(self,id,pais,nacionalidad):
		'''
		Inicializa una instancia de tipo pais.
		id: el id del pais en la base de datos
		pais: el nombre del pais
		nacionalidad: gentilicio de las personas que pertenecen al pais
		'''
		self.id = id
		self.__pais = pais
		self.__nacionalidad = nacionalidad
	
	def __str__(self):
	   '''
	   Regresa el pais como cadena.
	   returns: el nombre del pais
	   '''
	   return self.__pais

	def get_pais(self):
		'''
		Regresa el nombre del pais.
		returns: el nombre del pais
		'''
		return self.__pais

	def get_nacionalidad(self):
		'''
		Regresa la nacionalidad de las personas del pais.
		returns: la nacionalidad de las personas del pais
		'''
		return self.nacionalidad
