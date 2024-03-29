/* Este es un comentario*/
% Otro comentario

% El predicado hombre tiene un argumento cuyo valor es el
% nombre de un hombre.
hombre(jose).
hombre(juan).
mujer(maria).

% El primer argumento del predicado "papa" debe ser el nombre de un
% papá. El segundo argumeto es el nombre de su hijo/a.
papa(juan, jose).
papa(juan, maria).
valioso(dinero).
dificilDeObtener(dinero).
le_da(pedro, libro, antonio).

hermana(X,Y):-
    papa(Z,X), %AND
    mujer(X),
    papa(Z,Y),
    X\==Y.

hijo(X,Y):-
    papa(Y,X),
    hombre(X).

humano(X):-
    mujer(X); %OR
    hombre(X).

/* Predicado no determinístico
humano(X):-
    mujer(X).
humano(X):-
    hombre(X).*/


