suma_listas([],[],[]).
suma_listas([X|T],[Y|R],[SUM|L]):-
    SUM is X + Y,
    suma_listas(T,R,L).

resta_listas([],[],[]).
resta_listas([X|T],[Y|R],[SUM|L]):-
    SUM is X - Y,
    resta_listas(T,R,L).

deriva([],[],0).
deriva([X|Z],L, SUM):-
    deriva(Z,L,ACUM),
    SUM is ACUM + 1,
    COEFF is X*SUM,
    write(COEFF),nl,write(SUM),nl.