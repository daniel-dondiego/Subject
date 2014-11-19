class Archivo(object):
    
    def __init__(self, id, url, id_usuario, id_grupo):
        '''
        Crea una instancia de tipo archivo.
        url: el url con la ubicacion del archivo
        id_usuario: el id del usuario al que pertenece el archivo
        id_grupo: el id del grupo al que pertenece el archivo o 0 si no 
                  pertenece a ningun grupo
        '''
        self.__id = id
        self.__url = url
        self.__id_usuario = id_usuario
        self.__id_grupo = id_grupo
    
    def get_id(self):
        '''
        Regresa el id del archivo en la tabla de archivos.
        returns: el id del archivo en la base
        '''
        return self.id

    def get_url(self):
        '''
        Regresa el url con la ubicacion del archivo.
        returns: el url del archivo
        '''
        return self.url
    
    def get_id_usuario(self):
        '''
        Regresa el id del usuario al que pertenece el archivo.
        returns: el id del usuario.
        '''
        return self.id_usuario
        
    def get_id_grupo(self):
        '''
        Regresa el id del grupo al que pertenece el archivo.
        returns: el id del grupo.
        '''
        return self.id_grupo
        
