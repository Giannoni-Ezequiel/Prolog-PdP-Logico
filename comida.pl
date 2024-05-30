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