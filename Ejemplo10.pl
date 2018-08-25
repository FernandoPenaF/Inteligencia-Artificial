%combina(i,i,o). donde i = input/argumento instanciado
%combina(i,i,i). donde o = output/argumento NO instanciado

combina([], Lista, Lista):-!.
combina([X|Lista1], Lista2, [X|Lista3]):-
    combina(Lista1, Lista2, Lista3).
