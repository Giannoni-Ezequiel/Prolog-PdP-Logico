titulo(ezequiel, 40, utnfrba).
sabeIdioma(argentina,ingles,ezequiel).

importante(argentina).

manejaIdioma(Alguien):-
    sabeIdioma(Pais,Idioma,Alguien),
    importante(Pais).

buenIngeniero(Alguien):-
    manejaIdioma(Alguien),
    titulo(Alguien, M, Facultad),
    M >= 40.