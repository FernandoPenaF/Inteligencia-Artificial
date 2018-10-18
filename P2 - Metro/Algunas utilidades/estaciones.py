# -*- coding: utf-8 -*-
"""
Editor de Spyder

Este es un archivo temporal
"""

def prologATXT():
    flec= open('bdc.pl','r')
    for linea in flec:
        linAct = ""
        if linea[:6] == "%Línea":
            if linea != linAct:
                print(linAct)
                print("")
            linAct = linea
        if  linea[:8] == "conexion":
            linea = linea[9:]
            arre = linea.split(",")
            print("estacion("+repr(arre[0]).replace("'","")+",1,1)")  
    flec.close()
    
def txtAProlog():
    flec = open("repetidas.txt",'r')
    dic = {}
    for linea in flec:
        if linea in dic:
            print("repetido")
        else:
            dic[linea]=1
    flec.close()
    
    escribe = open('nuevo.txt','w')
    for key in dic.keys():
        escribe.write(key.replace("'",""))
    escribe.close()

txtAProlog()