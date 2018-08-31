gusta(jorge, X):-
    carne(X).
gusta(beatriz,X):-
    X==higado,!,fail.
gusta(beatriz,X):-
    carne(X).
carne(pancita).
carne(higado).
carne(filete).
