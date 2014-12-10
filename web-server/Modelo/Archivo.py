import sys
sys.path.append('../Controlador')

import Comandos

class Archivo(object):
    
    def __init__(self, id, url, id_usuario, id_grupo):
        '''
        Crea una instancia de tipo archivo.
        id: el id del archivo en la base de datos
        url: el url con la ubicacion del archivo
        id_usuario: el id del usuario al que pertenece el archivo
        id_grupo: el id del grupo al que pertenece el archivo o 0 si no 
                  pertenece a ningun grupo
        '''
        self.__id = id
        self.__url = url
        self.__id_usuario = id_usuario
        self.__id_grupo = id_grupo

    def __init__(self, url, id_usuario, id_grupo):
        '''
        Crea una instancia de tipo archivo (constructor sin id).
        url: el url con la ubicacion del archivo
        id_usuario: el id del usuario al que pertenece el archivo
        id_grupo: el id del grupo al que pertenece el archivo o 0 si no 
                  pertenece a ningun grupo
        '''
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

    def agrega(self):
        '''
        Agrega el archivo a la base
        '''
        s = 'INSERT INTO archivos (url_archivo, id_usuario, id_grupo) VALUES(' + str(self.url) + str(self.id_usuario) + str(self.id_grupo) + ')'
        Comandos.ejecuta_comando(s)

    def set_id(self, id):
        '''
        Modifica el id del archivo
        id: el id del archivo en la tabla
        '''
        self.id = id

    def set_id_url(self, url):
        '''
        Modifica el url del archivo
        url: el nuevo url del archivo
        '''
        self.url = url

    def set_id_usuario(self, id_usuario):
        '''
        Modifica el id del usuario al que pertenece el archivo
        id_usuario: el nuevo id del usuario al que pertenece el archivo
        '''
        self.id_usuario = id_usuario

    def set_id_grupo(self, id_grupo):
        '''
        Modifica el id del grupo en el que esta el archivo
        id_grupo: el nuevo id del grupo
        '''
        self.id_grupo = id_grupo
