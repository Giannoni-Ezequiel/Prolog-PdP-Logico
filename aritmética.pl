% siguiente(Anterior, Siguiente)

siguiente(N, N + 1).
/*
?- siguiente(41, Siguiente).
   Siguiente = 41 + 1.
*/

siguiente(N, S):- S is N + 1.
/*
?-siguiente(41, 43).
  False.
?-siguiente(Anterio, 42).
  Arguments are no sufficiently instantiated
*/
siguiente(N, S):-
    numero(N),
     is N + 1.
    %42 is N + 1. --no funciona para todos los casos.
/*
?-siguiente(Anterior, 42).

*/