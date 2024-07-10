%apareceEn( Personaje, Episodio, Lado de la luz).
apareceEn( luke, elImperioContrataca, luminoso).
apareceEn( luke, unaNuevaEsperanza, luminoso).
apareceEn( vader, unaNuevaEsperanza, oscuro).
apareceEn( vader, laVenganzaDeLosSith, luminoso).
apareceEn( vader, laAmenazaFantasma, luminoso).
apareceEn( c3po, laAmenazaFantasma, luminoso).
apareceEn( c3po, unaNuevaEsperanza, luminoso).
apareceEn( c3po, elImperioContrataca, luminoso).
apareceEn( chewbacca, elImperioContrataca, luminoso).
apareceEn( yoda, elAtaqueDeLosClones, luminoso).
apareceEn( yoda, laAmenazaFantasma, luminoso).

%Maestro(Personaje)
maestro(luke).
maestro(leia).
maestro(vader).
maestro(yoda).
maestro(rey).
maestro(duku).

%caracterizacion(Personaje,Aspecto).
%aspectos:
% ser(Especie,Tamaño)
% humano
% robot(Forma)
caracterizacion(chewbacca,ser(wookiee,10)).
caracterizacion(luke,humano).
caracterizacion(vader,humano).
caracterizacion(yoda,ser(desconocido,5)). %este
caracterizacion(jabba,ser(hutt,20)). %este
caracterizacion(c3po,robot(humanoide)). %este
caracterizacion(bb8,robot(esfera)). 
caracterizacion(r2d2,robot(secarropas)). %este

%elementosPresentes(Episodio, Dispositivos)
elementosPresentes(laAmenazaFantasma, [sableLaser]).
elementosPresentes(elAtaqueDeLosClones, [sableLaser, clon]).
elementosPresentes(laVenganzaDeLosSith, [sableLaser, mascara, estrellaMuerte]).
elementosPresentes(unaNuevaEsperanza, [estrellaMuerte, sableLaser, halconMilenario]).
elementosPresentes(elImperioContrataca, [mapaEstelar, estrellaMuerte]).

%precede(EpisodioAnterior,EpisodioSiguiente)
precedeA(laAmenazaFantasma,elAtaqueDeLosClones).
precedeA(elAtaqueDeLosClones,laVenganzaDeLosSith).
precedeA(laVenganzaDeLosSith,unaNuevaEsperanza).
precedeA(unaNuevaEsperanza,elImperioContrataca).
 
%%%%SOLUCION
%1
nuevoEpisodio(Heroe, Villano, Extra, Dispositivo):-
    personajesDeNuevoEpisodio(Heroe, Villano, Extra),
    maestroJedi(Heroe),
    ladoOscuro(Villano),
    vinculoEstrecho(Extra,Heroe,Villano),
    esExotico(Extra),
    esReconocible(Dispositivo).

%%%Los personajes deben haber aparecido en 
%%%alguno de los episodios anteriores y obviamente ser diferentes
personajesDeNuevoEpisodio(Heroe, Villano, Extra):-
     apareceEn( Heroe, _, _),
     apareceEn( Villano, _, _),
     apareceEn( Extra, _, _),
     Heroe \= Villano,
     Villano \= Extra,
     Extra \= Heroe.

%%%%el héroe tiene que ser un jedi (un maestro que estuvo alguna 
%%%%vez en el lado luminoso) que nunca se haya pasado al lado oscuro.
maestroJedi(Heroe):-
    maestro(Heroe), 
    apareceEn( Heroe, _, luminoso),
    not(apareceEn( Heroe, _, oscuro)).

%%%El villano debe haber estado en más de un episodio y tiene que mantener algún rasgo de ambigüedad, 
%%%por lo que se debe garantizar que haya aparecido del lado luminoso en algún episodio y del lado oscuro 
%%%en el mismo episodio o en un episodio posterior.  
ladoOscuro(Villano):- 
    apareceEn( Villano, Episodio1, luminoso),
    apareceEn( Villano, Episodio2, oscuro),
    Episodio1 \= Episodio2.

%Tiene que tener un vínculo estrecho con los protagonistas, 
%que consiste en que haya estado junto al heroe o al villano en todos los episodios en los que dicho extra apareció. 
vinculoEstrecho(Extra, Heroe, Villano):-
    maestroJedi(Heroe),
    apareceEn(Heroe, _,_),
    ladoOscuro(Villano),
    apareceEn(Villano, _, _),
    apareceEn(Extra, _, _),
    Extra\=Heroe,
    Extra\=Villano,
    forall(apareceEn(Extra, Episodio, _), aparecioAlguno(Episodio, Heroe, Villano)).
aparecioAlguno(Episodio, Heroe, _):-
    apareceEn(Heroe, Episodio, _);
    apareceEn(_, Episodio, Villano).

%Se considera exótico a los robots que no tengan forma de esfera 
%y a los seres de gran tamaño (mayor a 15) o de especie desconocida.
esExotico(Extra):-
    robotValido(Extra);
    serValido(Extra).
    /*caracterizacion(Extra,Personaje(Caracteristica1,Caracteristica2))),
    %esExoticaPrimeraCaracteristica(Caracteristica1),
    esExoticaSegundaCaracteristica(Caracteristica2).
esExoticaPrimeraCaracteristica(Caracteristica1):-
    caracterizacion(_,_(Caracteristica1)),
    Caracteristica1 \= esfera.
esExoticaSegundaCaracteristica(Caracteristica2):-
    caracterizacion(_,_(desconocido,Caracteristica2)),
    caracterizacion(_,_(_,Caracteristica2)),
    Caracteristica2 > 15. */

robotValido(Extra):-
    caracterizacion(Extra,robot(_)),
    forall(caracterizacion(Extra,robot(_)),not(caracterizacion(Extra,robot(esfera)))).

 serValido(Extra):-
     caracterizacion(Extra,ser(_,_)),
     forall(caracterizacion(Extra,ser(_,Aspecto)),aspectoDelSer(Aspecto)).
 serValido(Extra):-
     caracterizacion(Extra,ser(_,_)),
     forall(caracterizacion(Extra,ser(Aspecto,_)),aspectoDelSer(Aspecto)).
 aspectoDelSer(Aspecto):-
     caracterizacion(Extra,ser(_,Aspecto)),
     Aspecto > 15.
 aspectoDelSer(Aspecto):-
     caracterizacion(Extra,ser(Aspecto,_)),
     Aspecto == desconocido.


%El dispositivo tiene que ser reconocible por el público, 
%por lo que tiene que ser un elemento que haya estado presente en muchos episodios (3 o más)
esReconocible(Dispositivo):-
    apareceEn3PelisOMas(Dispositivo).

apareceEn3PelisOMas(Dispositivo):-
    findall(Episodio, (elementosPresentes(Episodio,Dispositivos),
                member(Dispositivo, Dispositivos)), Episodios),
    length(Episodios, Cantidad),
    Cantidad >= 3.

%2
% Consultas
% ?- nuevoEpisodio(yoda,vader,c3po,sableLaser).
%   true.
% ?- nuevoEpisodio(luke,vader,c3po,sableLaser).
%   true.
% ?- nuevoEpisodio(yoda,vader,c3po,estrellaMuerte).
%   true.
% ?- nuevoEpisodio(luke,vader,c3po,estrellaMuerte).
%   true.

%3
caracterizacion(finn,humano).
caracterizacion(finn,ser(_,5,aspectoActual)).

 