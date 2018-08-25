%valor_max(X,Y,X):-
 %   X > Y.
%valor_max(X,Y,Y):-
 %   X =< Y.

valor_max(X,Y,X):-
    X > Y, !.
valor_max(_,Y,Y).
