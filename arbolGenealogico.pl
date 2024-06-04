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



%relaciones familiares, deducir a partir de relaciones padre - hijo y pareja
progenitor(homero, bart).
progenitor(homero, lisa).
progenitor(homero, maggie).
progenitor(abe, homero).
progenitor(abe, jose).
progenitor(jose, pepe).
progenitor(mona, homero).
progenitor(jacqueline, marge).
progenitor(marge, bart).
progenitor(marge, lisa).
progenitor(marge, maggie).
                                   
mediosHermanos(P1,P2):-
    not(hermanos(P1, P2)),
    progenitor(Padre, P1),
    progenitor(Padre, P2),
    P1 \= P2.
                                   
hermanos(P1,P2):-
    progenitor(Padre, P1),
    progenitor(Padre, P2),
    progenitor(Madre, P1),
    progenitor(Madre, P2),
    Padre \= Madre,
    P1 \= P2.
                                   
compartenProgenitor(P1, P2):- hermanos(P1,P2).
compartenProgenitor(P1, P2):- mediosHermanos(P1,P2).
                                   
pareja(P1, P2):-
    progenitor(P1, Hijo),
    progenitor(P2, Hijo),
    P1 \= P2.
                                   
tio(Tio, Sobrino):-
    progenitor(Padre, Sobrino),
    compartenProgenitor(Padre, Tio).
                                   
                                   /* En el caso que no fuese tio entraria en un loop infinito
                                   tio(Tio, Sobrino):-
                                       pareja(Tio, Tia),
                                       tio(Tia, Sobrino).
                                   */
                                   tio(Tio, Sobrino):- %evitamos entrar en el loop infinito
                                       pareja(Tio, Tia),
                                       progenitor(Padre, Sobrino),
                                       compartenProgenitor(Padre, Tia).
                                   
                                   primos(P1, P2):-
                                       progenitor(Padre, P1),
                                       tio(Padre, P2).
                                   
                                   abuelo(Abuelo, Nieto):-
                                       progenitor(Padre, Nieto),
                                       progenitor(Abuelo, Padre).
                                   