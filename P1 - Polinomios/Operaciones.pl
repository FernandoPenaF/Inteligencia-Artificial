% Malvaes Díaz, Stephanie Lizeth - 135515
% Peña Flores, Luis Fernando     - 158488
% Orduña Ferreira, Fabián        - 159001
%
% El presente programa implementa polinomios y sus operaciones básicas.
% Los polinomios son representados con listas cuyos elementos representan
% el coeficiente de la variable x^i, donde i es el "indice" de cada
% elemento en la lista.
%
% El "indice" i = 0 representa el coeficiente de x^0, i = 1 el de x^1 y así
% sucesivamente. Y el indice mayor siempre estara hasta la izquierda.
% 
% Ejemplo:
%
% La siguiente lista [1,2,-3,-4,5] representa el polinomio 5x^4 - 4x^3 - 3x^2 + 2x + 1.
%
% El programa fue realizado bajo el supuesto de que el usuario no debe
% crear polinomios o dar listas de coeficientes con ceros innecesarios, es decir,
% las listas del tipo [a, b, c, d, 0, 0] no están permitidas (a,b,c,d son reales).
%
% Al final del código del programa se encuentra el predicado test() 
% con los casos de prueba solicitados por el profesor.



% El siguiente predicado hace la funcion de 'constructor' como se conoce en otros lenguajes
% Parametros:
%    i: coeficiente del polinomio
%    i: grado del polinomio
%    o: regresa el polinomio
creaPolinomio(0,_,[0]):-!.
creaPolinomio(Coeficiente,Grado,Pol):-
    build_zeros(Grado,Res),
    combina(Res,[Coeficiente],Pol).

% El siguiente predicado regresa el grado del polinomio. 
% Por el típo de implementación el grado es el número de elementos en la lista.
% Parametros:
%   i: arreglo que representa al polinomio
%   o: grado del polinomio
grado([],0):-!.
grado([_],0):-!.
grado([_|Z], Grado):-
    grado(Z, ACUM),
    Grado is ACUM + 1.

% El siguiente predicado realiza la suma de dos polinomios y regresa el resultado.
% Parametros:
%   i: primer polinomio a sumar (lista)
%   i: segundo polinomio a sumar (lista)
%   o: regresa el resultado de la suma
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

% El siguiente predicado realiza la resta de dos polinomios y regresa el resultado.
% Parametros:
%   i: primer polinomio  (lista)
%   i: segundo polinomio que se le resta al primero (lista)
%   o: regresa el resultado de la resta
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



% El siguiente predicado realiza la multiplicacion de dos polinomios y regresa el resultado.
% Parametros:
%   i: primer polinomio a multiplicar (lista)
%   i: segundo polinomio a multiplicar (lista)
%   o: regresa el resultado de la multiplicacion
multiplica([],_,[]):-!.
multiplica(_,[],[]):-!.
multiplica([0],_,[0]):-!.
multiplica(_,[0],[0]):-!.
multiplica(Pol1,Pol2,Res):-
    grado(Pol1,Grado1),
    grado(Pol2,Grado2),
    Max is Grado1 + Grado2 + 1,
    build_zeros(Max,Ceros),
    recorreListas(Pol1,Pol2,Pol2,0,0,[],Max,Grado2,Ceros,Res).



% El siguiente predicado realiza la composicion de dos polinomios.
% Compone el primer polinomio con el segundo.
% Parametros:
%   i: primer polinomio 
%   i: segundo polinomio 
%   o: regresa el resultado de la composicion
compone([],_,[]):-!.
compone(_,[],[]):-!.
compone([X|Resto],PolB,PolN):-
   compone(Resto,PolB,PNew),
   multiplica(PolB,PNew,R),
   suma([X],R,PolN).


% El siguiente predicado hace la evaluacion de un numero en cierto polinomio
% por el metodo de Horner.
% Parametros:
%     i: polinomio en el que se va a evaluar el valor
%     i: valor que se desea evaluar en el polinomio
%     o: resultado de la evaluacion
evalua([],_,0):-!.
evalua([X|Resto],Eval,Acum) :-
  evalua(Resto,Eval,Res),
  Acum is X + Res * Eval.

% El siguiente predicado deriva el polinomio que se le da.
% Parametros:
%     i: polinomio a derivar
%     o: resultado de la derivada
deriva([],[]):-!.
deriva([_],[0]):-!.
deriva(Coeffs, Deriv):-
	multiply_list(Coeffs,0,Res),
	quita_primero(Res, Deriv).

% El siguiente predicado regresa el toString del polinomio dado.
% Parametros:
%     i: polinomio
%     o: representacion del polionomio
toString([],""):-!.
toString([0],0):-!.
toString(Lista,Res):-
    grado(Lista,Grado),
    toStringAux(Lista,0,Grado,"",Res).







% predicado auxiliares usados en los métodos principales.
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




% Predicado auxiliar que sirve para realizar la multiplicacion
% Parámetros:
%     i:polinomio 1
%     i:polinomio 2
%     i:polinomio 2
%     i:contador sobre el polinomio 1
%     i:contador sobre el polinomio 1
%     i:lista vacia
%     i:grado del polinomio resultante
%     i:Grado del segundo polinomio dado
%     i:lista de ceros con numero total de ceros igual al grado del resultado del polinomio
%     o:resultado de la multiplicacion
%
%Posible consulta:
%recorreListas([12,87,-78],[-6,14,78,-2],[-6,14,78,-2],0,0,[],5,4,[0,0,0,0,0,0],Res).
recorreListas([],_,_,_,_,_,_,_,X,X).
recorreListas([_|Cola1],[],CopiaDos,Indice1,_,ListaNums,GradoMax,GradoSegundo, PolInicial, D):-
    Aux1 is Indice1 +1,
    %se agregan ceros antes
    build_zeros(Indice1,ListaCeros),
    combina(ListaCeros,ListaNums,Respuesta),
    %se agregan ceros despues
    Auxi is GradoMax-GradoSegundo-Aux1,
    build_zeros(Auxi,SegundosCeros),
    combina(Respuesta,SegundosCeros,PolASumar),
    suma(PolASumar,PolInicial,Res),
    recorreListas(Cola1,CopiaDos,CopiaDos,Aux1,0,[],GradoMax,GradoSegundo,Res, D),!.
recorreListas([Cabeza1|Cola1],[Cabeza2|Cola2],CopiaDos,Indice1,Indice2,Temp,GradoMax,GradoSegundo, PolInicial,O):-
    Aux2 is Indice2 + 1,
    AuxNum is Cabeza1*Cabeza2,
    combina(Temp,[AuxNum],  Res),
    recorreListas([Cabeza1|Cola1],Cola2,CopiaDos,Indice1,Aux2,Res,GradoMax,GradoSegundo, PolInicial,O),!.



% Predicado para dar formato al toString del polinomio
toStringAux([],_,_,Res,Res):-!.
toStringAux([Cabeza|Cola],Exp,Grado,Res,O):-

    (Grado=:=Exp,Cabeza>0 ->
    positivoEspecial(Cabeza,Exp,Aux),
     string_concat(Aux,Res,Res2)
    ;
    formato(Cabeza,Exp,Res1),
    string_concat(Res1,Res,Res2)
    ),
    IAux is Exp +1,
    toStringAux(Cola,IAux,Grado,Res2,O).
% Predicado para dar formato al toString del polinomio
formato(Numero,Exponente,Res):-
    (   Numero > 0 ->
    positivos(Numero,Exponente,Res);
    (   Numero < 0 ->
    negativos(Numero,Exponente,Res);
    Res = ""
    )
    ).
% Predicado para dar formato al toString del polinomio
negativos(Numero,Exponente,Res):-
    (   Exponente=:= 0 ->
    Num is abs(Numero),
    string_concat(" - ",Num,Res);
    %cuando el exponente no es cero
    (    Exponente =:= 1 ->
           (   Numero =:= -1 ->
                   string_concat(""," - x",Res);
           (   Numero =:= 0 ->
           Res = "";
              string_concat(Numero, "x",Res)))
    );
    %aqui el exponente es mayor que cero
    (   Numero =:= -1 ->
                   string_concat(""," - x^",Res1),
                   string_concat(Res1,Exponente,Res);

    Num is abs(Numero),
    string_concat(" - ",Num,Resx),
    string_concat(Resx,"x^",Res1),
        string_concat(Res1,Exponente,Res)
    )).
% Predicado para dar formato al toString del polinomio
positivos(Numero,Exponente,Res):-
    (   Exponente=:= 0 ->
    string_concat(" + ",Numero,Res);
    %cuando el exponente no es cero
    (    Exponente =:= 1 ->
           (   Numero =:= 1 ->
                   string_concat(""," + x",Res);
           string_concat(" + ",Numero,Res1),
           string_concat(Res1, "x",Res)

           )
    );
    %aqui el exponente es mayor que cero
    (   Numero =:= 1 ->
                   string_concat(""," + x^",Res1),
                   string_concat(Res1,Exponente,Res);

    string_concat(Numero,"x^",Res1),
        string_concat(" + ",Res1,Res2),
        string_concat(Res2,Exponente,Res)
    )).
% Predicado para dar formato al toString del polinomio
positivoEspecial(Numero,Exponente,Res):-
    (   Exponente=:= 0 ->
    string_concat("",Numero,Res);
    %cuando el exponente no es cero
    (    Exponente =:= 1 ->
           (   Numero =:= 1 ->
                   string_concat("","x",Res);
           string_concat("",Numero,Res1),
           string_concat(Res1, "x",Res)

           )
    );
    %aqui el exponente es mayor que cero
    (   Numero =:= 1 ->
                   string_concat("","x^",Res1),
                   string_concat(Res1,Exponente,Res);

    string_concat(Numero,"x^",Res1),
        string_concat("",Res1,Res2),
        string_concat(Res2,Exponente,Res)
    )).




%Metodo que realiza pruebas de toda la implementación de los distintos predicados
test():-
    creaPolinomio(0,0,Zero),
    creaPolinomio(4,3,P1),
    creaPolinomio(3,2,P2),
    creaPolinomio(1,0,P3),
    creaPolinomio(2,1,P4),
    suma(P1,P2,X),suma(X,P3,Y),suma(Y,P4,P),

    creaPolinomio(3,2,Q1),
    creaPolinomio(5,0,Q2),
    suma(Q1,Q2,Q),

    suma(P,Q,R),
    multiplica(P,Q,S),
    compone(P,Q,T),
    resta(Zero,P,U),
    evalua(P,3,Eval),
    deriva(P,Dev1),
    deriva(Dev1,Dev2),

    toString(Zero,S1),
    toString(P,S2),
    toString(Q,S3),
    toString(R,S4),
    toString(S,S5),
    toString(T,S6),
    toString(U,S7),
    toString(Dev1,S8),
    toString(Dev2,S9),

    write('zero(x)       = '),write(S1),nl,
    write('p(x)          = '),write(S2),nl,
    write('q(x)          = '),write(S3),nl,
    write('p(x) + q(x)   = '),write(S4),nl,
    write('p(x) * q(x)   = '),write(S5),nl,
    write('p(q(x))       = '),write(S6),nl,
    write('0 - p(x)      = '),write(S7),nl,
    write('p(3)          = '),write(Eval),nl,
    write("p'(x)         = "),write(S8),nl,
    write("p''(x)        = "),write(S9),nl.