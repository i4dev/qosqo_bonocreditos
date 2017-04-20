# QOSQO BONOCREDITOS

## ¿Que es un bonocrédito?

El **bonocrédito** es un puntaje que los alumnos deben obtener para aprobar una materia. Se requiere un total de quince. Pueden ser adquiridos en tres tipos de eventos: Responsabilidad Social, Semana de la Ingeniería y Conferencias y Concresos.
En total el alumno deberá adquirir como mínimo cinco de cada uno para aprobar la materia.

## ¿Como funciona esta extensión?
Permite, a los docentes *(de la cátedra **"Proyectos"** de la carrera de Ingeniería en Sistemas de Información de la UTN-FRT)* hacer el seguimiento de los bonocréditos de alumnos.

Por cada evento el alumno crea una petición de tipo **"Bonocrédito"**. En la misma deberá agregar el titulo del evento, la descripción, la cantidad estimada de puntos (0, 1 , 2 o 3 puntos), tipo (Responsabilidad Social, Semana de la Ingeniería o Conferencias y Concresos) y finalmente ser asignada al docente.

El docente es quien validará la cantidad de puntos que se acreditarán por el tipo de evento del cual participó el alumno.

## Vista de Totales

En una pestaña del **proyecto padre** *(que agrupa los proyectos finales de los alumnos)* se podrá visualizar la cantidad total de los bonocréditos que poseen todos los alumnos regulares de la materia "Proyecto".
En una pestaña su proyecto personal, el alumno podrá ver la cantidad de bonocréditos que posee.

## Detalles de las vistas

Si el alumno alcanzó o superó cinco puntos en un tipo de evento, el valor deberá mostrarse de color verde. Caso contrario será de color Rojo.
El nombre del alumno deberá mostrarse destacado si alcanzó o superó el total de 5 puntos por cada evento. Caso contrario el nombre aparerá sin destacar.

#Instalacion
Clonar este repositorio en REDMINE_ROOT/plugins/.

Correr las migraciones
REDMINE_ROOT$ RAILS_ENV=production rake redmine:plugins:migrate NAME=qosqo_bonocreditos

Reiniciar el app server (Si es passenger: touch tmp/restart.txt)


#Configuracion
Habilitar el módulo del plugin en el proyecto "padre", que sería de la cátedra, que alojará los subproyectos, de cada grupo de alumnos.
Configurar en el mismo proyecto padre los settings de Tipo de peticion de bonocreditos (donde se cargarán los bonocreditos) y el perfil o rol que usan los alumnos en sus proyectos.
Habilitar en cada subproyecto de los alumnos el módulo del plugin (no requiere otras configuraciones)
Agregar en el rol de los profesores o tutores el permiso correspondiente al plugin de bonocredito para que puedan cargar los mismos.

 
