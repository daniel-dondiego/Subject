Subject
=======
Subject es una red social que ayuda a los estudiantes de distintos niveles de escolaridad a obtener ayuda en diferentes materias, además de conocer y obtener ayuda de gente nueva.


Crear usuario de postgres llamado postgres y cambiar la contraseña en el archivo Conexion.py(sobre la linea 14), el cual está en la carpeta Controlador.

Crear una base de datos llamada subject(en Ubuntu: CREATE DATABASE subject; desde postgres)

Llamar al archivo subject.sql ubicado en la carpeta web-server/database el equivalente en Ubuntu es psql subject < /home/.../Subject/web-server/database/subject.sql

Cambiar las rutas dentro de los archivos web-server/server.conf, web-server/server.py, web-server/Controlador/Controller.py, web-server/Controlador/Reportes.py para que vayan de acuerdo con las rutas de su computadora. (Tiene que cambiar TODAS las rutas a las rutas absolutas correspondientes)

 