# QOSQO BONOCREDITOS

## ¿Que es un bonocrédito?

El **bonocrédito** es un puntaje que los alumnos deben obtener para aprobar una materia. Se requiere un total de quince. Pueden ser adquiridos en tres tipos de eventos: Responsabilidad Social, Semana de la Ingeniería y Conferencias y Concresos.
En total el alumno deberá adquirir como mínimo cinco de cada uno para aprobar la materia.

## ¿Como funciona esta extensión?
Permite, a los docentes *(de la cátedra **"Proyectos"** de la carrera de Ingeniería en Sistemas de Información de la UTN-FRT)* hacer el seguimiento de los bonocréditos de alumnos.

Por cada evento el alumno crea una petición de tipo **"Bonocrédito"**. En la misma deberá agregar el titulo del evento, la descripción, y la documentación que respalda la cantidad de puntos que le brindará el docente y finalmente ser asignada al docente.
Una vez que la petición es asignada al docente, el ser el encargado de definir la puntuación por la actividad (0, 1 , 2 o 3 puntos), definir el tipo (Responsabilidad Social, Semana de la Ingeniería o Conferencias y Concresos) y asignarle al alumno que acreditar estos puntos. 

   ### Vista de Totales

En una pestaña del **proyecto padre** *(que agrupa los proyectos finales de los alumnos)* se podrá visualizar la cantidad total de los bonocréditos que poseen todos los alumnos regulares de la materia "Proyecto".
Asimismo en una pestaña su proyecto personal, el alumno podrá ver la cantidad de bonocréditos que posee.

   ### Detalles de las vistas

Si el alumno alcanzó o superó cinco puntos en un tipo de evento, el valor deberá mostrarse de color verde. Caso contrario será de color Rojo.
El nombre del alumno deberá mostrarse destacado si alcanzó o superó el total de 5 puntos por cada evento. Caso contrario el nombre aparerá sin destacar.

## Instalación

1. Ingresar a la raiz de QOSQO
```
cd {QOSQO ROOT}
```
2. Clonar el repositorio dentro del directorio plugins con el nombre que posee en el repositorio
```
git clone https://github.com/i4dev/qosqo_bonocreditos.git plugins/qosqo_bonocreditos
```
3. Correr las migraciones
```
RAILS_ENV=production rake redmine:plugins:migrate NAME=qosqo_bonocreditos
```
4. Reiniciar el app server (Si es passenger: touch tmp/restart.txt)


## Configuración

1. Habilitar el módulo del plugin en el proyecto "padre", que sería de la cátedra, que alojará los subproyectos, de cada grupo de alumnos.

2. Configurar en el mismo proyecto padre los *settings* de **Tipo de petición de bonocréditos** (donde se cargarán los bonocréditos) y el **perfil o rol** que usan los alumnos en sus proyectos.

3. Habilitar en cada subproyecto de los alumnos el módulo del plugin (no requiere otras configuraciones).

4. Agregar en el rol de los profesores o tutores el permiso correspondiente al plugin de bonocredito para que puedan cargar los mismos.

