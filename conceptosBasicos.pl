%%%%%%Defino (defino cosas ciertas)
humano(platon).
humano(aristoteles).
humano(socrates).
%%%%%%Variables
% si humano(Alguien) entonces mortal(Alguien)
mortal(Alguien) :- humano(Alguien).
mortal(elGalloDeAsclepio).
%%%%%%
maestro(socrates, platon).
maestro(platon, aristoteles).
%%%%%%Condicional
groso(Alguien):-
    maestro(Alguien, Uno),
    maestro(Alguien, Otro),
    Uno \= Otro.   %uno es distinto de otro

%%%%%%Consola
/*
---Consultas individuales
?- mortal(sócrates).
   true.
?- mortal(seus).
   false.
----Consulta existencial . = una respuesta posible ; mas de una respuesta
?- mortal(Alguien).
   Alguien = platón
?- mortal(Alguien).
   Alguien = platón;
   Alguien = aristóteles;
   Alguien = sócrates;
   Alguien = elGalloDeAsclepio;
   false.
?- maestro(Maestro, platón).
   Maestro = sócrates;
   false.
?- maestro(platón, _).
   true.


%%% Un Predicado, MUCHAS Consultas
?- maestro(_, _).  ---> ¿Hay alguien que sea maestro de alguien?
   true;
   true.
*/


