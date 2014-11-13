
class Publicacion(object):

	def __init__(self,id,id_usuario,id_grupo,id_archivo,id_materia,fecha,visibilidad):
		self.__id = id
		self.__id_usuario = id_usuario
		self.__id_grupo = id_grupo
		self.__id_archivo = id_archivo
		self.__id_materia = id_materia
		self.__fecha = fecha
		self.__visibilidad = visibilidad

	def get_id(self):
		return self.__id

	def get_id_usuario(self):
		return self.__id_usuario

	def get_id_grupo(self):
		return self.__id_grupo

	def get_id_archivo(self):
		return self.__id_archivo

	def get_id_materia(self):
		return self.__id_materia

	def get_fecha(self):
		return self.__fecha

	def get_visibilidad(self):
		return self.__visibilidad	