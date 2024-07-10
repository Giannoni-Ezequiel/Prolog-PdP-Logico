% -----------------------LAS CASAS DE HOGWARTS.-----------------------
%PARTE 1 


% sombreroSeleccionador(Mago, CasaElegida, CasaOdiada):-
%     entradaPermitidaACasa(Casa, Sangre),
%     caracterApropiado(Caracter),
%     casaSeleccionada(CasaOdiada),
%     cadenaDeAmistades(Caracter).

%mago(Nombre,Caracter[],Sangre,CasaOdiada)
/*mago(harry,[corajudo,amistoso,orgulloso,inteligencia]).
mago(draco,[inteligencia,orgulloso]).
mago(hermione,[inteligencia,orgullosa,responsable]).*/
mago(Mago):- sangre(Mago,_).

sangre(harry, mestizo).
sangre(draco, pura).
sangre(hermione, impura).

%casa(Nombre)
casa(gryffindor).
casa(slytherin).
casa(ravenclaw).
casa(hufflepuff).


%Punto 1 ------------------------
entradaPermitidaACasa(Casa, Mago):-
    casa(Casa),
    mago(Mago),
    Casa \= slytherin.

entradaPermitidaACasa(slytherin, Mago):-
    sangre(Mago,Sangre),
    Sangre \= impura.

%Punto 2 ------------------------------------
caracterApropiado(Casa,Mago):-