class Grupo(object):
	
    def __init__(self,id,nombre,id_usuario,visibilidad,imagen):
        '''
        Constructor
        id: el id del grupo en la base
        nombre: el nombre del grupo
        id_usuario: el id del usuario que creo el grupo
        visibilidad: la visibilidad del grupo
        imagen: la imagen del grupo
        '''
        self.__id = id
        self.__nombre = nombre
        self.__id_usuario = id_usuario
        self.__visibilidad = visibilidad
        self.__imagen = imagen
	
    def __str__(self):
        '''
        Regresa una cadena con el nombre del grupo
        Returns: el nombre del grupo
        '''
        return self.__nombre

    def get_id(self):
        '''
        Regresa el id del grupo
        Returns: el id del grupo
        '''
        return self.__id
	
    def get_nombre(self):
	'''
        Regresa el nombre del grupo
        Returns: el nombre del grupo
        '''
        return self.__nombre

    def get_id_usuario(self):
        '''
        Regresa el id del usuario que creo el grupo
        Returns: el id del usuario que creo el grupo
        '''
        return self.__id_usuario

    def get_visibilidad(self):
        '''
        Regresa la visibilidad del grupo
        Returns: la visibilidad del grupo
        '''
	return self.__visibilidad

    def get_imagen(self):
        '''
        Regresa la imagen del grupo
        Returns: la imagen del grupo
        '''
	return self.__imagen

    def set_id(self, id):
        '''
        Actualiza el valor del id del grupo
        id: el nuevo id
        '''
        self.__id = id
    
    def set_nombre(self, nombre):
        '''
        Actualiza el nombre del grupo
        nombre: el nuevo nombre para el grupo
        '''
        self.__nombre = nombre
    
    def set_id_usuario(self, id_usuario):
        '''
        Actualiza el valor del id del administrador del grupo
        id_usuario: el nuevo id del usuario
        '''
        self.__id_usuario = id_usuario
        
    def set_visibilidad(self, visibilidad):
        '''
        Cambia la visibilidad del grupo
        visibilidad: la nueva visibilidad del grupo
        '''
        self.__visibilidad = visibilidad
        
    def set_imagen(self, imagen):
        '''
        Cambia la imagen del grupo
        imagen: la nueva imagen del grupo
        '''
        self.__imagen = imagen
