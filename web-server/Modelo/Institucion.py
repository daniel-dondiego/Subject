class Institucion(object):
	def __init__(self,id,nombre,id_pais,id_ciudad,imagen,website):
		self.__id=id
		self.__nombre = nombre
		self.__id_pais = id_pais
		self.__id_ciudad = id_ciudad
		self.__imagen = imagen
		self.__website = website
	
	def get_id(self):
		return self.id
	
	def get_nombre(self):
		return self.nombre

	def get_id_pais(self):
		return self.id_pais

	def get_id_ciudad(self):
		return self.id_ciudad

	def get_imagen(self):
		return self.imagen

	def get_website(self):
		return self.website
