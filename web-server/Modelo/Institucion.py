class Institucion(object):
    def __init__(self,id,nombre,id_pais,id_ciudad,imagen,website):
        '''
        Constructor
        id: el id de la institucion
        nombre: el nombre de la institucion
        id_pais: el id del pais al que pertenece la institucion
        id_ciudad: el id de la ciudad a la que pertenece la institucion
        imagen: una imagen de la institucion
        website: el sitio web de la institucion
        '''
	self.__id=id
	self.__nombre = nombre
	self.__id_pais = id_pais
	self.__id_ciudad = id_ciudad
	self.__imagen = imagen
	self.__website = website
	
    def __str__(self):
        '''
        Regresa una cadena con el nombre de la institucion
        Returns: el nombre de la institucion
        '''
        return self.__nombre

    def get_id(self):
        '''
        Regresa el id de la institucion en la base de datos
        Returns: el id de la institucion
        '''
	return self.__id
	
    def get_nombre(self):
       '''
       Regresa el nombre de la institucion
       Returns: el nombre de la institucion
       '''
       return self.__nombre

    def get_id_pais(self):
        '''
        Regresa el id del pais al que pertenece la institucion
        Returns: el id del pais al que pertenece la institucion
        '''
        return self.id_pais

    def get_id_ciudad(self):
        '''
        Regresa el id de la ciudad a la que pertenece la institucion
        Returns: el id de la ciudad a la que pertenece la institucion
        '''
        return self.id_ciudad

    def get_imagen(self):
	return self.imagen

    def get_website(self):
	return self.website
