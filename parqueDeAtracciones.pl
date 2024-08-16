%PERSONAS
personas(Nombre, GrupoEtario, Edad, Altura).
personas(nina, joven, 22, 1.60).
personas(marcos, nino, 8, 1.32).
personas(osvaldo, adolescente, 13, 1.29).
%ATRACCIONES
atracciones(NombreDelParque, ListaDeAtracciones).
atracciones(parqueDeLaCosta, [trenFantasma, montanaRusa, maquinaTiquetera]).
atracciones(parqueAcuatico, [toboganGigante, rioLento, piscinaDeOlas]).

atraccion(Lugar, Atraccion):-
    atracciones(Lugar, Atraccion),
    member(trenFantasma, Atraccion),
    personas(_, _, Edad, _),
    Edad >= 12.

atraccion(Lugar, Atraccion):-
    atracciones(Lugar, Atraccion),
    member(montanaRusa, Atraccion),
    personas(_, _, _, Altura),
    Altura > 1.30.

atraccion(Lugar, Atraccion):-
    atracciones(Lugar, Atraccion),
    member(toboganGigante, Atraccion),
    personas(_, _,_, Altura),
    Altura > 1.50.

atraccion(Lugar, Atraccion):-
    atracciones(Lugar, Atraccion),
    member(piscinaDeOlas, Atraccion),
    personas(_,_, Edad, _),
    Edad >= 5.

%1
puedeSubir(Persona, Atraccion):-
    personas(Persona,_,_,_),
    atraccion(_, Atraccion).
%2
esParaElle(Parque, Persona):-
    personas(Persona,_,_,_),
    forall(atracciones(Parque,_), puedeSubir(Persona,_)).
%3
malaIdea(GrupoEtario, Parque):-
    personas(_,GrupoEtario,_,_),
    atraccion(Parque, _),
    forall(personas(_,GrupoEtario,_,_), esParaElle(Parque,_)),
    not(forall(personas(_,GrupoEtario,_,_), puedeSubir(_,_))).
%4
%programa(Atracciones)
programa(Atracciones):-
    atraccion(_, Atracciones).

%programaLogico(Programa):-

