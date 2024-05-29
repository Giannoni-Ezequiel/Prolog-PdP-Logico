% amigo(Uno, Otro)
amigo(nico, fernando).
amigo(axel, Persona):- amigo(Persona, nico).
amigo(alf, _).
% El primero parametro es un valor: nico, axel, alf . Es completamente inversible
% Si me pasan Persona sin ligar, necesito usarla en un lugar donde pueda ligar
% El tercero no sirve para inversibilidad. "Alf es amigo de todo el mundo"

% id(Algo, LoMismo)
id(X, X).
% El predicado ID es inversible.
/*
?- id(julia, Id).
  Id = julia.
?- id(Id, julia).
  Id = julia.
?- id(Id, Id).
  true
%Error, Esperaba una respuesta existencial. 
Es inversible si: 
    le paso el primero, 
    o si le paso el segundo
Por lo tanto, no es totalmente inversible.
*/

% mayorDeEdad(Persona)
mayorDeEdad(Persona):-
   Edad > 18,
   edad(Persona, Edad).
% Se necesita saber si las variables son inversibles, para determinar si un predicado es o no inversible
% los operadores no son inversibles.( > )
% Arreglo :
mayorDeEdad(Persona):-
   edad(Persona, Edad),
   Edad > 18.

-------------------------------------

%Relacion genealogica

% padre(Padre, Hijo)
padre(abraham, homero).
padre(homero, bart).
...
padre(Padre, _).
padre(_, Hijo).
% abuelo(Abuelo, Nieto)
abuelo(Abuelo, Nieto):-
  padre(Abuelo, Padre).
  padre(Padre, Nieto).
abuelo(fry, fry).
% abuelo es abuelo de si mismo. Es completamente inversible
%% hermano(Uno, Otro)
hermano(Uno, Otro):-
   padre(Padre, Uno),
   padre(Padre, Otro).
   Uno \= Otro.
% uno es hermano de otro si no es la misma persona. el operador \= no es inverible (Ojo de poner al principio)
% si esta a lo ultimo, ya fue inversible, por lo tanto es totalmente inversible.
%% ancestro(Ancestro, Descendiente)
ancestro(Ancestro, Descendiente):- padre(Ancestro, Descendiente).
ancestro(Ancestro, Descendiente):- padre(Ancestro, Alguien),
                                   ancestro(Alguien, Descendiente).
   