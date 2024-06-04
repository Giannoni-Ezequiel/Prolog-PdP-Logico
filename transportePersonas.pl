
%estado(apurado).
%estado(normal).
estado(sobrado).

traslado(moto) :- estado(apurado).
traslado(bicicleta) :- estado(normal).
traslado(caminar) :- estado(sobrado).
traslado(colectivo) :- estado(cansado).
traslado(subte) :- estado(cansado).
traslado(auto) :- estado(resfriado).

esFeliz(_) :- traslado(moto).
esFeliz(_) :- traslado(bicicleta).

tieneSalud(_) :- traslado(bicicleta).
tieneSalud(_) :- traslado(caminar).