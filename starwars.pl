

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
caracterizacion(yoda,ser(desconocido,5)).
caracterizacion(jabba,ser(hutt,20)).
caracterizacion(c3po,robot(humanoide)).
caracterizacion(bb8,robot(esfera)).
caracterizacion(r2d2,robot(secarropas)).

%elementosPresentes(Episodio, Dispositivos)
elementosPresentes(laAmenazaFantasma, [sableLaser]).
elementosPresentes(elAtaqueDeLosClones, [sableLaser, clon]).
elementosPresentes(laVenganzaDeLosSith, [sableLaser, mascara, estrellaMuerte]).
elementosPresentes(unaNuevaEsperanza, [estrellaMuerte, sableLaser, halconMilenario]).
elementosPresentes(elImperioContrataca, [mapaEstelar, estrellaMuerte] ).

%precede(EpisodioAnterior,EpisodioSiguiente)
precedeA(laAmenazaFantasma,elAtaqueDeLosClones).
precedeA(elAtaqueDeLosClones,laVenganzaDeLosSith).
precedeA(laVenganzaDeLosSith,unaNuevaEsperanza).
precedeA(unaNuevaEsperanza,elImperioContrataca).

nuevoEpisodio(Heroe, Villano, Extra, Dispositivo):-
    personajesDeNuevoEpisodio(Heroe, Villano, Extra),
    maestroJedi(Heroe),
    ladoOscuro(Villano),
    vinculoEstrecho(Extra,Heroe,Villano),
    esExotico(Extra),
    esReconocible(Dispositivo).
%los personajes deben haber aparecido en 
%alguno de los episodios anteriores y obviamente ser diferentes
personajesDelNuevoEpisodio(Personaje1, Personaje2):-
    apareceEn( Personaje1, _, _),
    apareceEn( Personaje2, _, _),
    Personaje1 \= Personaje2.
personajesDeNuevoEpisodio(Heroe, Villano, Extra):-
    apareceEn( Heroe, _, _),
    apareceEn( Villano, _, _),
    apareceEn( Extra, _, _),
    Heroe \= Villano,
    Villano \= Extra,
    Extra \= Heroe.
%el héroe tiene que ser un jedi (un maestro que estuvo alguna 
%vez en el lado luminoso) que nunca se haya pasado al lado oscuro.
maestroJedi(Heroe):-
    maestro(Heroe), 
    apareceEn( Heroe, _, luminoso),
    not(apareceEn( Heroe, _, oscuro)).

ladoOscuro(Villano):- 
    apareceEn( Villano, Episodio1, luminoso),
    apareceEn( Villano, Episodio2, oscuro),
    Episodio1 \= Episodio2.

vinculoEstrecho(Extra, Heroe, Viallno):-
    apareceEn(Extra, _, _),
    apareceEn(Heroe, _,_),
    apareceEn(Villano, _, _),
    forall(apareceEn(Extra, Episodio1, _), aparecioAlguno(Episodio, Heroe, Vilano)).
aparecioAlguno(Episodio, Heroe, _):-
    apareceEn(Heroe, Episodio, _).
aparecioAlguno(Episodio, _, Villano):-
    apareceEn(_, Episodio, Villano).
%Se considera exótico a los robots que no tengan forma de esfera 
%y a los seres de gran tamaño (mayor a 15) o de especie desconocida.
esExotico(Extra):-
    caracterizacion(Extra,Caracteristica),
    esExoticaSegundaCaracteristica(Caracteristica).


esReconocible(Dispositivo):-
    esDispositivo(Dispositivo),
    apareceEn3PelisOMas(Dispositivo).

apareceEn3PelisOMas(Dispositivo):-
    findall(Episodio, (elementosPresentes(Episodio,Dispositivo),
                member(Dispositivo, Dispositivos)), Episodios),
    length(Episodios, Cantidad),
    Cantidad >= 3.
