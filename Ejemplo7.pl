gusta(jorge, X):-
    carne(X).
gusta(beatriz,X):-
    X\==higado,carne(X).
carne(pancita).
carne(higado).
carne(filete).
