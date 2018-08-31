%consecutivos(i,i,i).

consecutivos(A, B, [A,B|_]):-!.
consecutivos(A,B,[_|R]):-
    consecutivos(A,B,R).
