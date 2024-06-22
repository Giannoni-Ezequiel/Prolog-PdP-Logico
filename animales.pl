% habitat(Animal, Bioma)
habitat(jirafa, sabana).
habitat(tigre, sabana).
habitat(tigre, bosque).
habitat(tiburon, mar).
habitat(foca, costa).
habitat(foca, mar).

% acuatico(Animal)
acuatico(Animal):- habitat(Animal, mar).

% terrestre(Animal)
/*terrestre(Animal):-
    not(habitat(Animal, mar)).*/
%%el not no es inversible, al menos que ligue antes la varible que se este por usar por primera vez
animal(Animal):- habitat(Animal, _).
terrestre(Animal):-
    animal(Animal),
    not(habitat(Animal, mar)).
%al ligar la variable, podemos decir este animal en particular no vive en el mar

% templado(Bioma)
templado(costa).
templado(sabana).

% friolento(Animal)
friolento(Animal):-
    habitat(Animal, Bioma),
    templado(Bioma).
% Cuantificador Universal: forall/2  forall(Universo, Condicion)
%                                           X = _   , true/false
friolentoForAll(Animal):-
    forall(habitat(Animal, Bioma),
           templado(Bioma)).
%Todos los biomas que habita la foca sean templados.
%En un universo vacio, va a dar True.
friolentoForAllReversible(Animal):-
    animal(Animal),
    forall(habitat(Animal, Bioma),
           templado(Bioma)).

%forall(animal(X), friolento(X))  ==   not((animal(X), not(friolento(X))))
%"Todos los animales son friolentos"  ==   "No existe animal que no sea friolento"

%not(forall(animal(X), friolento(X)))   ==    animal(X), not(friolento(X))
%"No todos los animales son friolentos"  ==   "Existen animales que no son friolentos"

%forall(animal(X), not(friolento(X)))   ==    not((animal(X), friolento(X)))
%"Ningun animal es friolento"    ==           "No existen animales friolentos"

% come(Comedor, Comido)

%Todos los animales que me comen viven aca
hostil(Animal, Bioma):-
    animal(Animal),
    habitat(_, Bioma), 
    forall(habitat(OtroAnimal, Bioma), come(OtroAnimal, Animal)).
%Todos los animales que viven aca me comen
terrible(Animal, Bioma):-
    animal(Animal),
    habitat(_, Bioma),
    forall(come(OtroAnimal, Animal), habitat(OtroAnimal, Bioma)).

compatibles(UnAnimal, OtroAnimal):-
    animal(UnAnimal),
    animal(OtroAnimal),
    not(come(UnAnimal, OtroAnimal)),
    not(come(OtroAnimal, UnAnimal)).

%No siempre hay que ligar todas las variables
adaptable(Animal):-
    animal(Animal),
    forall(habitat(_, Bioma), habitat(Animal, Bioma)).

raro(Animal):-
    habitat(Animal, Bioma),
    not((habitat(Animal, OtroBioma),
        Bioma \= OtroBioma)).

dominante(Animal):-
    habitat(Animal, Bioma),
    forall((habitat(Otro, Bioma),
            Otro \= Animal),
            come(Animal, Otro)).

