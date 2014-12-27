#!/usr/bin/python
# -*- coding: utf-8 -*-
import os
import hashlib

HASH_BYTE_SIZE = 32

def salt():
    '''
    Regresa una cadena de bytes aleatoria del mismo tamano del hash
    returns: una cadena aleatoria de bytes del tamano del hash
    '''
    return os.urandom(HASH_BYTE_SIZE)

def slow_equals(hash1, hash2):
    '''
    Copyright (c) 2013, Taylor Hornby
    All rights reserved.
    Funcion para comparar 2 hashes en tiempo independiente de su 
    tamano
    hash1: el primer hash a comparar
    hash2: el segundo hash a comparar
    returns: si los hashes son iguales
    '''
    bytes1 = list(hash1)
    bytes2 = list(hash2)
    l1 = len(bytes1)
    l2 = len(bytes2)
    diff = l1 ^ l2
    i = 0
    while i < l1 and i < l2:
        diff |= bytes1[i] ^ bytes2[i]
        i += 1
    return diff == 0

class Password(object):
    
    def __init__(self, password, salt):
        '''
        Construye un objeto de tipo Password
        password: la contrasena del usuario
        salt: cadena aleatoria de bytes independiente de la contrasena
        '''
        self.__password = password
        self.__salt = salt
        
    def create_hash(self):
        '''
        Crea el hash de la contrasena
        returns: el hash de la contrasena
        '''
        to_hash = str(self.__salt) + self.__password
        hashing = hashlib.sha256()
        hashing.update(to_hash)
        return hashing.digest()
    
    def get_salt(self):
        '''
        Regresa el salt de la contrasena
        returns: el salt de la contrasena
        '''
        return self.__salt
 
    
        
        
