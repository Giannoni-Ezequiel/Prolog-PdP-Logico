paises(america,[arg,bra,uru])
cuantosPaises(Continente,Cantidad):-
    paises(Continente,Paises),
    length(Paises,Cantidad).