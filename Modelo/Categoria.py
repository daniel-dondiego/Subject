
class Categoria(object):

	def __init__(self,id,nombre):
                '''
                Método constructor
                '''
                self.__id = id
		self.__nombre = nombre

	def get_id(self):
                ''' 
                Regresa el id de la categoría
                Returns: el id de la categoría
                '''
                return self.__id

	def get_nombre(self):
                '''
                Regresa el nombre de la categoría
                Returns: el nombre de la categoría
                '''
                return self.__nombre
	
        def agrega(self):
                '''
                Agrega la categoría a la base de datos
                '''
                
