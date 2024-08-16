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


%%Parte 2. Movimientos

%fisicos(Potencia). fisicos(Nombre,Potencia).
%especiales(Potencia, Tipo). especiales(Nombre,Potencia, Tipo).
%defensivos(Defensa, Reduccion). defensivos(Nombre, Reduccion).

/*CONSULTAS
movimientos(Movimiento, Tipo(Potencia)).
movimientos(Movimiento, Potencia).
movimientos(Movimiento, Ataque).
*/


% Pikachu 
movimiento(pikachu, fisico(mordedura, 95)).
movimiento(pikachu, especial(impactrueno, 40, electrico)).

% Charizard
movimiento(charizard, especial(garraDragon, 100, dragon)).
movimiento(charizard, fisico(mordedura, 95)).

% Blastoise
movimiento(blastoise, defensivo(proteccion, 10)).
movimiento(blastoise, fisico(placaje, 50)).

% Arceus
movimiento(arceus, especial(impactrueno, 40, electrico)).
movimiento(arceus, especial(garraDragon, 100, dragon)).
movimiento(arceus, defensivo(proteccion, 10)).
movimiento(arceus, fisico(placaje, 50)).
movimiento(arceus, defensivo(alivio, 100)).

% Punto 1

% danioAtaque(Movimiento, Daño).
danioAtaque(fisico(_, Potencia), Potencia).
danioAtaque(defensivo(_, _), 0).
danioAtaque(especial(_, Potencia, Tipo), Danio):-
    multiplicadorTipo(Tipo, Multiplicador),
    Danio is Potencia * Multiplicador. 

multiplicadorTipo(Tipo, 1.5):-
    tipoBasico(Tipo).

multiplicadorTipo(dragon, 3).
multiplicadorTipo(Tipo, 1):-
    Tipo \= dragon, 
    not(tipoBasico(Tipo)).

tipoBasico(fuego).
tipoBasico(agua).
tipoBasico(planta).
tipoBasico(normal).

% Punto 2

capacidadOfensiva(Pokemon, CapacidadOfensiva):-
    pokemons(Pokemon),
    findall(Danio, danioAtaquePokemon(Pokemon, Danio), Danios),
    sumlist(Danios, CapacidadOfensiva).
pokemons(Pokemon):- pokemon(Pokemon,_).

danioAtaquePokemon(Pokemon, Danio):-
    movimiento(Pokemon, Ataque), 
    danioAtaque(Ataque, Danio).

% Punto 3

entrenadorPicante(Entrenador):-
    entrenadores(Entrenador),
    forall(entrenador(Entrenador, Pokemon), pokemonPicante(Pokemon)).
entrenadores(Entrenador):- entrenador(Entrenador,_).
pokemonPicante(Pokemon):-
    capacidadOfensiva(Pokemon, CapacidadOfensiva),
    CapacidadOfensiva > 200.

pokemonPicante(Pokemon):-
    esMisterioso(Pokemon).

