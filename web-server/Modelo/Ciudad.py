class Ciudad(object):

    def __init__(self,id = None,pais,ciudad):
        '''
        Constructor con id
        id: el id en la tabla de la ciudad
        pais: el pais al que pertenece la ciudad
        ciudad: el nombre de la ciudad
        '''
        if not id is None:
            self.__id = id
        self.__pais = pais
        self.__ciudad = ciudad
                
    def __str__(self):
        '''
        Regresa el nombre de la ciudad
        Returns: el nombre de la ciudad
        '''
        return self.__ciudad

    def get_id(self):
        '''
        Regresa el id de la ciudad en la base de datos
        Returns: el id de la ciudad
        '''
        return self.__id
   
    def get_pais(self):
        '''
        Regresa el nombre del país al que pertenece la ciudad
        Returns: el país al que pertenece la ciudad
        '''
	return self.__pais
	
    def get_ciudad(self):
        '''
        Regresa el nombre de la ciudad
        Returns: el nombre de la ciudad
        '''
	return self.__ciudad

    def set_id(self, id):
         '''
         Modifica el id de la ciudad
         id: el nuevo id de la ciudad
         '''
         self.id = id

    def set_ciudad(self, ciudad):
        '''
        Modifica el nombre de la ciudad
        ciudad: el nuevo nombre de la ciudad
        '''
        self.__ciudad = ciudad

    def set_pais(self, pais):
        '''
        Modifica el nombre del pais al que pertenece la ciudad
        pais: el pais al que pertenece la ciudad
        '''
        self.__pais = pais
