#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
sys.path.append("..")
import Comandos
from Modelo import Grupo 
from Modelo import Usuario
from Modelo import Publicacion
import matplotlib
matplotlib.use('Agg')
import pylab as pl
import numpy as np


class Reportero(object):
    
    def escuela_por_id(self,id_escuela):
        q="SELECT nombre FROM escuela WHERE id="+str(id_escuela)+";"
        id_res=Comandos.consulta(q);
        return id_res[0][0]
    
    def pais_por_id(self,id_pais):
        q="SELECT pais FROM paises WHERE id="+str(id_pais)+";"
        id_res=Comandos.consulta(q);
        return id_res[0][0]
    
    def grafica_usr_pais(self,rows):
        labels=[]
        sizes=[]
        i=0
        for x in range(len(rows)):
            sizes.append(rows[x][1])
            i+=rows[x][1]
            labels.append(self.pais_por_id(rows[x][0]))
        sizes.append(i)
        labels.append("Otros")
        pl.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
        pl.axis('equal')
        pl.savefig("/home/luis/proyecto/Subject/web-server/Vista/img/archivos/grafica_usuario_pais.png")
        pl.clf()
        
        
    def grafica_usr_escuela(self,rows):
        labels=[]
        sizes=[]
        i=0
        for x in range(len(rows)):
            sizes.append(rows[x][1])
            i=rows[x][1]
            labels.append(self.escuela_por_id(rows[x][0]))
        sizes.append(i)
        labels.append("Otros")
        pl.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
        pl.axis('equal')
        pl.savefig("/home/luis/proyecto/Subject/web-server/Vista/img/archivos/grafica_top_usuario_escuela.png")
        pl.clf()
    
    def num_registros(self,tabla):
        q="select count(id) from "+tabla+";"
        num=Comandos.consulta(q)
        return num[0][0]

    def top10_usuarios(self):
        q="select nick_name,rating from usuario order by rating desc limit 10;"
        usuario=Comandos.consulta(q)
        top10=""
        for x in range(len(usuario)):
            top10+="    <tr>"
            top10+="        \n<td>"+usuario[x][0]+"</td>"
            top10+="        \n<td>"+str(usuario[x][1])+"</td>"
            top10+="    \n</tr>\n"
        return top10
    
    def top_paises_usuarios(self):
        q="SELECT nacionalidad, count(*) as num FROM usuario GROUP BY nacionalidad ORDER BY num LIMIT 10;"
        top=Comandos.consulta(q);
        self.grafica_usr_pais(top)
        return "../static/img/archivos/grafica_usuario_pais.png"

    def top_materia_publicacion(self):
        q="SELECT id_materia, count(*) as num FROM publicaciones GROUP BY id_materia ORDER BY num LIMIT 10;"
        top=Comandos.consulta(q);
        return len(top)

    def top_escuela_usuarios(self):
        q="SELECT escuela, count(*) as num FROM usuario GROUP BY escuela ORDER BY num LIMIT 7;"
        top=Comandos.consulta(q);
        self.grafica_usr_escuela(top)
        return "../static/img/archivos/grafica_top_usuario_escuela.png"

    def top10publicaciones(self):
        q="SELECT id_publicacion, count(*) as num FROM likes GROUP BY id_publicacion ORDER BY num LIMIT 10;"
        publi=Comandos.consulta(q);
        top=""
        for x in range(len(publi)):
            top+="    <tr>"
            top+="        \n<td>"+str(publi[x][0])+"</td>"
            top+="        \n<td>"+str(publi[x][1])+"</td>"
            top+="    \n</tr>\n"
        return top
    
    def hacer_reporte(self):
        total_usuarios=self.num_registros("usuario")
        top_usr=self.top10_usuarios()
        top_pais=self.top_paises_usuarios()
        top_esc=self.top_escuela_usuarios()
        total_pub=self.num_registros("publicaciones")
        top_publi=self.top10publicaciones()
        top_mat=self.top_materia_publicacion()
        total_gru=self.num_registros("grupos")
        rows={"usr_num":total_usuarios,
              "usr_top":top_usr,
              "usr_pais":top_pais,
              "usr_esc":top_esc,
              "pub_num":total_pub,
              "pub_top":top_publi,
              "tem_top":top_mat,
              "gru_num":total_gru}
        return rows
        
