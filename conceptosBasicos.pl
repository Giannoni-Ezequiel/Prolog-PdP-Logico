%%%%%%Defino (defino cosas ciertas)
humano(platón).
humano(aristóteles).
humano(sócrates).
%%%%%%Variables
mortal(Alguien) :- humano(Alguien).
mortal(elGalloDeAsclepio).
%%%%%%
maestro(sócrates, platón).
maestro(platón, aristóteles).
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
*/


