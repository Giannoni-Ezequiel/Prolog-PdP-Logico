videojuego(animalCrossing).
videojuego(theLastOfUs2).
videojuego(tetris).
videojuego(doomEternal).

genero(accion, theLastOfUs2).
genero(accion, doomEternal).
genero(simulacion, animalCrossing).
genero(puzzle, tetris).
genero(aventura, Juego):- genero(rpg, Juego).

:- begin_tests(videojuegos).

test(animal_crossing_es_un_videojuego):-
    videojuego(animalCrossing).

/*test(pokemonGo_no_es_un_videojuego):-
    not(videojuego(pokemonGo)).*/

test(pokemonGo_no_es_un_videojuego, fail):-
    videojuego(pokemonGo).

:- end_tests(videojuegos).

:- begin_tests(generos).
test(the_last_of_us_2_es_de_accion, nondet):-
    genero(accion, theLastOfUs2).
%Testear inversibilidad
test(se_puede_saber_todos_los_juegos_de_accion, 
     set(Juegos == [theLastOfUs2, doomEternal, jaja])):-
    genero(accion, Juegos).
:- end_tests(generos).
