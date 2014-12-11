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

        def set_id(self, id):
                '''
                Actualiza el valor del id de la instancia
                id: el nuevo id
                '''
                self.id = id

        def set_nombre(self, nombre):
                '''
                Actualiza el valor del nombre de la categoria
                nombre: el nuevo nombre de la categoria
                '''
                self.nombre = nombre
