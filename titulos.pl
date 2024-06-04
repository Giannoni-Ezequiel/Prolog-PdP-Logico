buenIngeniero(Alguien):-
    materiasAprobadas(Cantidad,Alguien),
    Cantidad >=40,
    titulo(Facultad,Especialidad,Alguien),
    manejaIdioma(Alguien). 

manejaIdioma(Alguien):-
    sabelenguaje(Pais,Idioma,Alguien),
    importante(Pais).

sabelenguaje(china,mandarin,ezequiel).
sabelenguaje(argentina,latino,pedro).
sabelenguaje(espania,castellano,juan).
sabelenguaje(eeuu,ingles,franco).

materiasAprobadas(40,franco).
materiasAprobadas(45,juan).
materiasAprobadas(50,pedro).
materiasAprobadas(50,ezequiel).

titulo(utn,sistemas,franco).
titulo(uba,mecanica,pedro).
titulo(itba,electronica,ezequiel).

importante(china).
importante(argentina).