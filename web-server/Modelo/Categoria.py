import sys
sys.path.insert(0,'../Controlador')

import Comandos

class Categoria(object):

	def __init__(self,id,nombre):
                '''
                Funcion constructora.
                id: el id de la categoria en la tabla
                nombre: el nombre de la categoria
                '''
                self.__id = id
		self.__nombre = nombre


        def get_id(self):
                ''' 
                Regresa el id de la categoria
                Returns: el id de la categoia
                '''
                return self.__id

	def get_nombre(self):
                '''
                Regresa el nombre de la categoria
                Returns: el nombre de la categoria
                '''
                return self.__nombre
	
        def agrega(self):
                '''
                Agrega la categoria a la base de datos.
                '''
                s = 'INSERT INTO categoria (nombre) VALUES(' + str(self.nombre) + ')'
                Comandos.ejecuta_comando(s)
 
