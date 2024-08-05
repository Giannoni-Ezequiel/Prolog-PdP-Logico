%carta(numero, palo). Functor
mata(carta(1, espada), carta(1, basto)).
mata(carta(1, basto), carta(7, espada)).
mata(carta(1, espada), carta(7, oro)).
mata(carta(7, oro), carta(3, _)).
mata(carta(3, _), carta(2, _)).

mata(carta(2, _), As):- falsoAs(As).
falsoAs(carta(1, copa)).
falsoAs(carta(1, oro)).
falsoSiete(carta(7, basto)).
falsoSiete(carta(7, copa)).
%cartaDeTruco
valeMas(carta(7, oro), carta(3, _)).

valeMas(carta(2, _), As):- falsoAs(As).
valeMas(As, carta(12, _)):- falsoAs(As).

valeMas(carta(Figura1, _), carta(Figura2, _)):-
    between(11, 12, Figura1),
    Figura2 is Figura1 - 1.

valeMas(carta(10, _), Siete):- falsoSiete(Siete).
valeMas(Siete, carta(6, _)):- falsoSiete(Siete).

valeMas(carta(6, _), carta(5, _)).
valeMas(carta(5, _), carta(4, _)).
%inversibilidad
cartaDeTruco(carta(Numero,Palo)):-
    palo(Palo),
    numeroValido(Numero).

palo(basto).
palo(espada).
palo(oro).
palo(copa).

numeroValido(Numero):-
    between(1, 12, Numero),
    not(between(8, 9, Numero)).

/*mata(MasValiosa, MenosValiosa):-
    cartaDeTruco(MasValiosa),
    cartaDeTruco(MenosValiosa),
    valeMas(MasValiosa,MenosValiosa).*/
%opcion transitiva
mata(MasValiosa, MenosValiosa):-
    cartaDeTruco(MasValiosa),
    cartaDeTruco(OtraCarta),
    valeMas(MasValiosa,OtraCarta),
    mata(OtraCarta, MenosValiosa).