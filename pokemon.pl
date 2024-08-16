%Pokemon
%Legends of Logic

%%Parte 1. Pokédex

%pokemones(Pokemon, Tipo).

pokemon(pikachu, electrico).

pokemon(charizard, fuego).

pokemon(venusaur, planta).

pokemon(blastoise, agua).
pokemon(totodile, agua).

pokemon(snorlax, normal).

pokemon(rayquaza, dragon).
pokemon(rayquaza, volador).

pokemon(arceus, _).


%% No lo ponemos, por principio de universo cerrado que maneja Prolog. 

%entrenadores(Entrenador, Pokemones).
entrenador(ash, charizard).
entrenador(ash, pikachu).

entrenador(brock, snorlax).

entrenador(misty, blastoise). 
entrenador(misty, arceus).
entrenador(misty, venusaur).

%tipoMultiple(Pokemon).
esTipoMultiple(Pokemon):-
    pokemon(Pokemon, T1),
    pokemon(Pokemon, T2),
    T1 \= T2.



%esLegendario(Pokemon).

esLegendario(Pokemon):-
    esTipoMultiple(Pokemon),
    not(entrenador(_,Pokemon)).

%esMisterioso(Pokemon).
esMisterioso(Pokemon):-
    pokemon(Pokemon, Tipo),
    not((pokemon(Otro, Tipo), Otro \= Pokemon)).

esMisterioso(Pokemon):-
    pokemon(Pokemon,_),
    not(entrenador(_, Pokemon)).

/*
%%Parte 2. Movimientos

%fisicos(Potencia). fisicos(Nombre,Potencia).
%especiales(Potencia, Tipo). especiales(Nombre,Potencia, Tipo).
%defensivos(Defensa, Reduccion). defensivos(Nombre, Reduccion).

/*CONSULTAS
movimientos(Movimiento, Tipo(Potencia)).
movimientos(Movimiento, Potencia).
movimientos(Movimiento, Ataque).
*/
/*fisicos(mordedura).
especiales(impactrueno, electrico).

movimiento(pikachu, fisico, mordedura(95)).
movimiento(pikachu, fisico(mordedura,95)).
movimiento(pikachu, especial, impactrueno(40)).
movimiento(pikachu, defensivo, 0).
movimientos(Pokemon, Tipo, Ataque):-
    movimiento(Pokemon, Tipo, Ataque),
    esEspecial(Tipo, Ataque),
    pokemones(Pokemon, _).
esEspecial(Tipo):-
    pokemones(_, Tipo)*/
/*movimiento(pikachu,mordedura(fisico,95)).
fisicos(Pokemon):-
    movimiento(Pokemon, Movimiento(fisico,Potencia)).
movimientos(Movimiento, Pokemon):-
    pokemones(Pokemon, Tipo),
    fisicos(Potencia).
movimientos(Movimiento, Pokemon):-
    pokemones(Pokemon, Tipo),
    especiales(Potencia, Tipo).
movimientos(Movimiento, Pokemon):-
    pokemones(Pokemon, Tipo),
    movimientos(Movimiento, Pokemon).*/