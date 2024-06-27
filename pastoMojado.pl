clima(bsas,lluvia,10).
clima(cordoba,sol,23).
clima(rosario,lluvia,100).

seRego(pasto).
seRego(vereda).
seRego(canchaDeFutbol).
alAireLibre(pasto).
alAireLibre(vereda).

ubicacion(pasto, sas).
ubicacion(vereda,cordoba).
ubicacion(jardin,rosario).


/*
seMojo(Lugar):-seRego(Lugar).
seMojo(Lugar):-clima(lluvia,X).
*/
%en este caso la coma (,) representa el AND
%seMojo(Lugar):-seRego(Lugar).
%seMojo(Lugar):-alAireLibre(Lugar),clima(lluvia,Cantidad),Cantidad > 20.

seMojo(Lugar):-seRego(Lugar).
seMojo(Lugar):-
    alAireLibre(Lugar),
    ubicacion(Lugar, Ciudad),
    clima(lluvia,Cantidad),
    Cantidad > 20.

llovioMucho(Ciudad):-
    clima(Ciudad, lluvia, Cantidad),
    Cantidad > 20.

seMojo(Lugar):-seRego(Lugar).
seMojo(Lugar):-
    alAireLibre(Lugar),
    ubicacion(Lugar, Ciudad),
    llovioMucho(Ciudad).

% Cantidad representa un numero