%cartaDeTruco
valeMas(carta(7, oro), carta(3, _)).

valeMas(carta(2, _), As):- falsoAs(As).
valeMas(As, carta(12, _)):- falsoAs(As).

valeMas(carta(Figura1, _), carta(Figura2, _)):-
    between(11,12, Figura1),
    Figura2 is Figura1 - 1.
