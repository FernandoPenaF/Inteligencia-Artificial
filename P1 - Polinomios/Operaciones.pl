suma_listas([],[],[]).
suma_listas([X|T],[Y|R],[SUM|L]):-
    SUM is X + Y,
    suma_listas(T,R,L).

resta_listas([],[],[]).
resta_listas([X|T],[Y|R],[SUM|L]):-
    SUM is X - Y,
    resta_listas(T,R,L).

deriva([],[]):-!.
deriva([_],[0]):-!.
deriva(Coeffs, Deriv):-
	multiply_list(Coeffs,0,Res),
	quita_primero(Res, Deriv).

multiply_list([], _, []).
multiply_list([X|Xs], Number, [X1|NewXs]):-
     X1 is X * Number,
     multiply_list(Xs, Number + 1, NewXs).

quita_primero([],[]).
quita_primero([_|X],X).