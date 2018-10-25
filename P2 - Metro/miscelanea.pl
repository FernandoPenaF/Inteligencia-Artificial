% Malvaes Díaz, Stephanie Lizeth - 135515
% Peña Flores, Luis Fernando     - 158488
% Orduña Ferreira, Fabián        - 159001

:- ensure_loaded(stcm). %Carga la base de conocimiento

% camino(i,i,o,o)
% Encuentra un camino y la longitud 
% de dicho camino entre dos estaciones
% dadas, A y B.
camino(A,B,Path,Len) :-
       recorre(A,B,[A],Q),
       reverse(Q,Path),
       longitud_camino(Path,Len).

%Método auxiliar para la regla camino/4
recorre(A,B,P,[B|P]) :-
       estaciones_conectadas(A,B,_).
recorre(A,B,Visited,Path) :-
       estaciones_conectadas(A,C,_),
       C \== B,
       \+member(C,Visited),
       recorre(C,B,[C|Visited],Path).

caminos(A, B):-
	camino(A, B, X, _),
	write(X),
	nl,
	fail.

escribe_caminos(A, B) :-
    open('file.txt', write, Stream),
    ( camino(A, B, X, L), write(Stream, X), write(Stream," "), 
    	write(Stream, L), nl(Stream), fail; true ),
    close(Stream).

% El siguiente predicado regresa la estación adyacente, según la lista
% de estaciones adyacentes que recibe,que está a la menor distancia de
% la estacion dada.
%
% i: Estacion de la que se quiere obtener la estación a menor distancia
% i: Lista de las estaciones adyacentes
% o: Nombre de la estacion con distancia menor adyacente
% o: Distancia a la estacion adyacente
estacion_a_menor_distancia(EstacionInicio,EstacionResultado,Distancia):-
       estaciones_adyacentes(EstacionInicio, ListaAdyacentes),
       estacion_menor(EstacionInicio,ListaAdyacentes,EstacionResultado,Distancia).

estacion_menor(Inicio,[],Inicio,0):-!.
estacion_menor(Inicio,[A],A, Dist):-
       estaciones_conectadas(Inicio,A,Dist),!.
estacion_menor(Inicio,[Primera|Cola],Estacion,Res):-
       estacion_menor_aux(Inicio,Primera,Cola,Estacion,Res),!.

estacion_menor_aux(EstacionInicial,EstacionMenorActual,[],EstacionMenorActual,Distancia):-
          estaciones_conectadas(EstacionInicial,EstacionMenorActual,Distancia),!.
estacion_menor_aux(EstacionInicial,EstacionMenorActual,[EstacionAPrueba|Resto],Estacion,Res):-
      estaciones_conectadas(EstacionInicial,EstacionMenorActual,J),
      DistanciaActual is J,
      estaciones_conectadas(EstacionInicial, EstacionAPrueba,K),
      DistanciaAComparar is K,
      (   DistanciaActual > DistanciaAComparar ->
      estacion_menor_aux(EstacionInicial,EstacionAPrueba,Resto,Estacion,Res);(
      estacion_menor_aux(EstacionInicial,EstacionMenorActual,Resto,Estacion,Res)
                              )).