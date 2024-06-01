/*
 pastas/1 = Aridad 1. Un solo individuo participa de la relacion
 predicados unArgumento = monadicos
*/

pastas(ravioles).
pastas(fideos).

/*CONSULTAS
?- pastas(ravioles).
   true
?- pastas(fideos).
   true
?- pastas(ravioles)
   .
   true
*/

%Universo Cerrado
/*
?- pastas(pechitoCerdo).
   false
?- pastas(ñoquis).
   false

Principio de Universo Abierto
   tres estados posibles: cierto, falso y desconocido
Principio de Universo Cerrado
   tres estados posibles: cierto, falso y desconocido = falso  

hecho es una afirmación codificada en la base de conocimiento
hecho = clausula
*/

pastas(involtinis).
% pastas(berenjenasEnEscabeche).

%Predicados poliadicos
/*
Aridad 2
Aridad n
*/
come(juan, ravioles).
come(brenda, fideos).
gusta(brenda, fideos).
/*CONSULTA
? come(brenda, fideos).
true

? come(fideos, brenda).
false

%Las relaciones no son bidireccionales por defecto

? gusta(brenda, fideos).
true

? gusta(brenda, juan).
false

? come(brenda, fideos, ricos).
false
*/

%Definicion por extension

animal(tigre).
animal(oso).
animal(elefante).

%Es como decir Animales = { tigre, oso, elefante }

planeta(venus).
planeta(tierra).