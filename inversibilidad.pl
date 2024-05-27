%%Inversibilidad = "Capacidad de ligar una variable"
%para consultas individuales

maestro(sócrates, platón).
maestro(platón, aristóteles).

odia(platón, diógenes).
odia(diógenes, _).

/*
%Consola
?- maestro(Maestro, Discípulo).
   Maestro = sócrates, Discípulo = platón;
   Maestro = platón, Discípulo = aristóteles;
   false.
?- odia(diógenes, platón).
   true.
?- odia(Alguien, platón).
   Alguien = diógenes.
?- odia(diógenes, Alguien).
   true.
*/