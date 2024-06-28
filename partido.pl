/*
Punto 1: Acciones del partido
Conocemos el nombre de cada jugador y las acciones que fueron pasando en el partido.
Las cuales son:
el dibu hizo una atajada en el minuto 122. También, en la tanda de penales atajó 2 de ellos.
messi metió 2 goles, uno en el minuto 108 de jugada y otro en el minuto 23 de penal. A su vez, también metió el primer penal de la tanda.
montiel metió el último penal de la tanda de penales.
Se pide modelar la base de conocimientos con las acciones y quienes las realizaron.

Punto 2: Puntajes de las acciones
Queremos saber cuantos puntos suma cada acción. Los cuales son calculados de la siguiente forma:
Para las atajadas tanda de penales, suman 15 * la cantidad que se hayan atajado
Para las otras atajadas, el puntaje se calcula como el minuto en el que ocurrió más 10
Para los goles, se calcula como el minuto en el que se metió más 20
Por último, para los penales que se metieron, en caso de que sea el primero suma  45 puntos mientras que si es el último suma 80 puntos
También, queremos saber cuantos puntos suma cada jugador. Es necesario que este predicado sea inversible.

Punto 3: Puntaje total
Dada una lista de jugadores, queremos saber cuantos puntos sumaron todos.
*/

tarjeta(color, hora()).
%1
jugador(elDibu).
jugador(messi).
jugador(montiel).

accion(elDibu, atajada(122)).
accion(elDibu, atajadaPenal(2)).
accion(messi, gol(108)).
accion(messi, gol(23)).
accion(messi, penal(1)).
accion(montiel, penal(5)).
accion(messi,tarjeta(amarilla,50)).
%2
puntaje(atajadaPenal,Puntos):-
    accion(Persona,atajadaPenal(Cantidad)),
    Puntos is Cantidad * 15.
puntaje(atajada(Minuto),Puntaje):- Puntaje is Minuto +10.
%atajas de penales = 15 * 2 ... 15*atajadaPenal(Cantidad)

puntaje(atajadas,Puntos):-
    accion(Persona,atajadas(Cantidad)),
    Puntos is Cantidad + 10.
%atajadas = atajada(Minuto) + 10

puntaje(gol,Puntos):-
    accion(Persona,gol(Cantidad)),
    Puntos is Cantidad + 20.
%gol = gol(Minuto) + 20

puntaje(penal(1),45).
puntaje(penal(5),80).
%penal = nth1(N,[arg,bra,uru],X) + 45.
%                                 + 80.

puntaje(tarjeta(amarilla,_),-20).
puntaje(tarjeta(roja,Minuto),Puntaje):- Puntaje is -100*Minuto.

puntajeTotalPorJugador(Jugador, Puntaje):-
    accion(Jugador,Accion),
    puntaje(Accion,Puntaje).
%sumlistAccionesPorJugador
puntajeUnaAccionJugador(Jugador, Puntaje):-
    puntaje(Accion,Puntaje).

puntosJugador(Jugador,Puntos):-
    jugador(Jugador),
    findall(Puntaje, puntajeTotalPorJugador(Jugador,Puntaje), Puntajes),
    sum_list(Puntajes, Puntos).
puntosJugador(Jugador,Puntos):-
    findall(Puntaje, puntajeTotalPorJugador(Jugador,Puntaje), Puntajes),
    sum_list(Puntajes, Puntos).
%3
%sumlistPuntajeTotal
puntosTotales(Jugadores, Puntos):-
    findall(Puntos, (member(Jugador,Jugadores),puntosJugador(Jugador,Puntos)), Puntajes),
    sum_list(Puntajes,Puntos).

puntosTodosJugadores(Puntos):-
    findall(Punto, puntosJugador(_,Punto), Puntajes),
    sum_list(Puntajes,Puntos).