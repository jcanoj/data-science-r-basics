
# Empenzado por lo básico #


## Consultando la ayuda ##

En cualquier momento en la consola de comandos podemos invocar la ayuda acerca de un comando de la siguiente manera

```R
?print
```

## moviendonos por los directorios ##

Desde la línea de comandos de R podemos movernos por las carpetas de nuestro ordenador y crear y cargar archivos usando estos comandos


```R
getwd() 				# nos devuelve el directorio actual de trabajo
setwd('..') 			# accede al nivel superior en el arbol de carpetas
setwd('c:/Projects/...')				# cambia al 
list.files()		
dir()					# igual que list.files()
file.path()
dir.create()
file.exists()
file.info()
file.create()
file.rename('test1.R', 'test2.R)
file.copy(from='', to='')
file.path()
```

## Objetos en R: tipos básicos ##

Todo elemento en R es un objeto. Existen 5 tipos de objetos básicos llamados atomicos: **character, numeric, integer, complex, logic (true/false)**. La asignación de los tipos atómicos es dinámica, no es necesario hacer una declaración explícita. Para asignar un valor a una variable usamos **<-**


```R
x <- 5
y <- 5L
```

Los valores numéricos son de doble precisión. Si queremos guardar un número entero debemos usar el sufijo "L"


```R
class(x)
class(y)
```
'numeric'
'integer'


**Inf** es una palabra reservada para representar el valor infinito y **NaN** representa el valor "Not a Number" y puede usarse para representar la ausencia de un dato en un conjunto.

Todos los objetos en R tienen **atributos**. Algunos de los más comunes son **names**, **dimnames**, **dimension**, **class**, **length**. No todos los objetos tienen los mismos atributos. Para conocer que atributos tienen usamos la función **attributes**


```R
attributes(x)
```

    NULL


Podemos listar los objetos creados 
```R
ls() # list objets
```




