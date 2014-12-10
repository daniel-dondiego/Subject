#Clase que abstrae la informacion de un usuario
import psycopg2
import Conexion
import Comandos

class Usuario(object):
    #constructor 
    def __init__(self,id,nombre,apellido,genero,nick_name,foto,escuela,password,nacionalidad,f_nacimiento,rating):
	self.__id=id
	self.__nombre = nombre
	self.__apellido = apellido
	self.__genero = genero
	self.__nick_name = nick_name
	self.__foto = foto
	self.__escuela = escuela
	self.__password = password
	self.__nacionalidad = nacionalidad
	self.__f_nacimiento = f_nacimiento
	self.__rating = rating
	
    def get_id(self):
	return self.id
	
    def get_nombre(self):
	return self.nombre

    def get_apellido(self):
	return self.apellido

    def get_genero(self):
	return self.genero

    def get_nick_name(self):
	return self.nick_name

    def get_foto(self):
        return self.foto

    def get_escuela(self):
        return self.escuela
	
    def get_nacionalidad(self):
        return self.nacionalidad

    def get_f_nacimiento(self):
        return self.f_nacimiento
        
    def get_rating(self):
        return self.rating

    def registra(self):
        ejecuta_comando("INSERT INTO usuario (nombre,apellido,genero,nick_name, \
            foto,escuela,password,nacionalidad,f_nacimiento,rating) \
            VALUES (self.nombre,self.apellido,self.genero,self.nick_name,\
            self.foto,self.escuela,self.password,self.nacionalidad,self.f_nacimiento,self.rating)")

    def ejecuta_comando(comando_sql):
        '''
        Ejecuta el comando de sql dado
        comando_sql: el comando a ejecutar
        '''
        c = Conexion.getConexion()
        cur = c.cursor()
        cur.execute(comando_sql)
        c.commit()

    def consulta(consulta):
        '''
        Regresa los renglones con los resultados de la consulta
        consulta: la consulta a realizar
        Returns: una lista de renglones con los resultados de la consulta, para iterar sobre ello
        '''
        c = Conexion.getConexion()
        cur = c.cursor()
        cur.execute(consulta)
        rows = cur.fetchall()
        return rows

Conexion.cierraConexion()
