% Por el típo de implementación el grado
% es el número de elementos en la lista.
grado([],0):-!.
grado([_],0):-!.
grado([_|Z], SUM):-
    grado(Z, ACUM),
    SUM is ACUM + 1.

% Hay una implementación de suma y resta más fácil y corta en
% https://stackoverflow.com/questions/26936560/multiply-two-polynomials-in-prolog
% también con ese sale la multipliación.
suma(PolA,[],PolA):-!.
suma([],PolB,PolB):-!.
suma(PolA, PolB, PolS):-
	 grado(PolA, X),
	 grado(PolB, Y),
	 (X =:= Y ->
		suma_lista(PolA, PolB, PolS);
		(X > Y ->
			G is X - Y,
			build_zeros(G,L),
			combina(PolB, L, New),
			suma_lista(PolA, New, PolS);
			G is Y - X,
			build_zeros(G,L),
			combina(PolA, L, New),
			suma_lista(New, PolB, PolS))).

resta(PolA,[],PolA):-!.
resta([],PolB,PolB):-!.
resta(PolA, PolB, PolS):-
	 grado(PolA, X),
	 grado(PolB, Y),
	 (X =:= Y ->
		resta_lista(PolA, PolB, PolS);
		(X > Y ->
			G is X - Y,
			build_zeros(G,L),
			combina(PolB, L, New),
			resta_lista(PolA, New, PolS);
			G is Y - X,
			build_zeros(G,L),
			combina(PolA, L, New),
			resta_lista(New, PolB, PolS))).

deriva([],[]):-!.
deriva([_],[0]):-!.
deriva(Coeffs, Deriv):-
	multiply_list(Coeffs,0,Res),
	quita_primero(Res, Deriv).

evaluate([],_,0):-!.
evaluate([X|Resto],Eval,Acum) :-
  evaluate(Resto,Eval,Res),
  Acum is X + Res * Eval.
  
multiplica(Pol1,Pol2,Res):-
    %hay que llamar al build zeros y a lo de los grados.
    grado(Pol1,Grado1),
    grado(Pol2,Grado2),
    Max is Grado1 + Grado2 - 2,
    build_zeros(Max,Ceros),
    recorreListas(Pol1,Pol2,Pol2,0,0,[],Max,Grado2,Ceros,Res).

% Falta implementar el multiplica
composition([],_,[]):-!.
composition([X|Resto],PolB,PolN):-
	 composition(Resto,PolB,PNew),
	 multiplica(PolB,PNew,R),
	 suma([X],R,PolN).

% Métodos auxiliares.
suma_lista([],[],[]).
suma_lista([X|T],[Y|R],[SUM|L]):-
    SUM is X + Y,
    suma_lista(T,R,L).

resta_lista([],[],[]).
resta_lista([X|T],[Y|R],[DIFF|L]):-
    DIFF is X - Y,
    resta_lista(T,R,L).

multiply_list([], _, []).
multiply_list([X|Y], Number, [X1|L]):-
     X1 is X * Number,
     Z is Number + 1,
     multiply_list(Y, Z, L).

quita_primero([],[]).
quita_primero([_|X],X).

build_zeros(0,[]):-!.
build_zeros(N1,[0|L]) :-
  N1 > 0, N is N1 - 1,
  build_zeros(N,L).

combina([],List,List):-!.
combina([X|Lista1],Lista2,[X|Lista3]):-
    combina(Lista1, Lista2, Lista3).

%parametros:
%
%forma de escribirlo
%
%recorreListas([12,87,-78],[-6,14,78,-2],[-6,14,78,-2],0,0,[],5,4,[0,0,0,0,0,0],Res).
%
%lista 1
%lista 2
%lista 2
%indice inicial 0
%indice inicial 0
%lista de numeros mezclados
%Grado mayor despues de multiplicar --> largo de los dos -1
%Grado del segundo polinomio
%Lista vacia inicial del grado mayor
%VARIABLE DE REGRESO
recorreListas([],_,_,_,_,_,_,_,X,X).
recorreListas([_|Cola1],[],CopiaDos,Indice1,_,ListaNums,GradoMax,GradoSegundo, PolInicial, D):-
    Aux1 is Indice1 +1,
    %se agregan ceros antes
    build_zeros(Indice1,ListaCeros),
    combina(ListaCeros,ListaNums,Respuesta),
    %se agregan ceros despues
    Auxi is GradoMax-GradoSegundo-1,
    build_zeros(Auxi,SegundosCeros),
    combina(Respuesta,SegundosCeros,PolASumar),
    suma(PolASumar,PolInicial,Res),
    %write("Resultado de la suma: "),nl,
    %write(Res),nl,
    recorreListas(Cola1,CopiaDos,CopiaDos,Aux1,0,[],GradoMax,GradoSegundo,Res, D),!.


recorreListas([Cabeza1|Cola1],[Cabeza2|Cola2],CopiaDos,Indice1,Indice2,Temp,GradoMax,GradoSegundo, PolInicial,O):-
    Aux2 is Indice2 + 1,
    AuxNum is Cabeza1*Cabeza2,
    combina(Temp,[AuxNum],  Res),
    recorreListas([Cabeza1|Cola1],Cola2,CopiaDos,Indice1,Aux2,Res,GradoMax,GradoSegundo, PolInicial,O),!.
