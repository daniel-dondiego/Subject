class Grupo(object):
	
    def __init__(self,id,nombre,id_usuario,visibilidad,imagen):
        '''
        Constructor
        id: el id del grupo en la base
        nombre: el nombre del grupo
        id_usuario: el id del usuario que creó el grupo
        visibilidad: la visibilidad del grupo
        imagen: la imagen del grupo
        '''
        self.__id=id
        self.__nombre = nombre
        self.__id_usuario = id_usuario
        self.__visibilidad = visibilidad
        self.__imagen = imagen
	
    def get_id(self):
        '''
        Regresa el id del grupo
        Returns: el id del grupo
        '''
        return self.id
	
    def get_nombre(self):
	return self.nombre

    def get_id_usuario(self):
        return self.id_usuario

    def get_visibilidad(self):
	return self.visibilidad

    def get_imagen(self):
	return self.imagen
