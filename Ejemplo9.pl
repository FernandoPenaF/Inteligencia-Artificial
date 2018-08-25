pertenece_a(X,[X|_]):-!.
pertenece_a(X,[_|Z]):-
    pertenece_a(X,Z).
