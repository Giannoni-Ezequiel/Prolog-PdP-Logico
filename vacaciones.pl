%%PUNTO 1
%destinoElegido(Persona, Lugares[])
destinoElegido(dodain, [pehuenia, sanMartinDeLosAndes, esquel, sarmiento, camarones, playasDoradas]).
destinoElegido(alf, [bariloche, sanMartinDeLosAndes, elBolson]).
destinoElegido(nico, [mdq]).
destinoElegido(vale, [calafate, elBolson]).

destinoMartu(martu):-
    destinoElegido(nico,_),
    destinoElegido(alf,_).

destinoJuan(juan):-
    destinoElegido(juan, [villaGesell]),
    destinoElegido(juan, [federacion]).

%destinoCarlos(carlos):-
 %   destinoElegido(carlos, []); 
 % Como mi base de conocimientos se basa solo en lugares, y 
 % Carlos no se va a ningun lugar, por def. Universo Cerrado, no se define un predicado.
 
%%PUNTO 2
%atraccionesPorLugar(Lugar, Atraccion)
atraccionesPorLugar(esquel, parqueNacional(losAlerces)).
atraccionesPorLugar(esquel, excursion(trochita)).
atraccionesPorLugar(esquel, excursion(trevelin)).
atraccionesPorLugar(villaPehuenia, cerro(bateaMahuida,2000)).
atraccionesPorLugar(villaPehuenia, cuerpoAgua(moquehue(sePesca,14))).
atraccionesPorLugar(villaPehuenia, cuerpoAgua(alumine(sePesca,19))).

cerroCopado(Lugar,cerro(_,Altura)).
%atraccionCopada(Lugar, Atraccion).
atraccionCopada(Atraccion):-
    atraccionesPorLugar(_, Atraccion),
    cerroCopado(Lugar,cerro(_,Altura)),
    Altura >= 2000.
atraccionCopada(Atraccion):-
    atraccionesPorLugar(_, Atraccion),
    cerroCopado(Lugar,cerro(_,Altura)),
    Altura >= 2000.
%%PUNTO 3
destinosDistintos(Persona, Lugar):-


