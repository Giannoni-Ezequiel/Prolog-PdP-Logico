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
