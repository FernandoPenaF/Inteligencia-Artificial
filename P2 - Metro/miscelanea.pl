% Malvaes Díaz, Stephanie Lizeth - 135515
% Peña Flores, Luis Fernando     - 158488
% Orduña Ferreira, Fabián        - 159001

% Archivo de SWI Prolog que implementa
% métodos interesantes para aplicar
% a la red del Sistema Transporte
% Colectivo Metro.

% Es necesario tener cargado el archivo 'stcm.pl'
% que contiene la base de conocimiento del programa.
% Así como métodos auxilares del archivo 'rutas.pl'
:- ensure_loaded(stcm). %Carga la base de conocimiento
:- ensure_loaded(rutas). %Carga métodos auxilares principales

% ruta(i,i,o,o).
% Encuentra una ruta y la longitud 
% de dicho ruta entre dos estaciones
% dadas, A y B.
%
% i: Estación A
% i: Estación B
% o: Ruta de A a B
% o: Longitud de la ruta de A a B
ruta(A,B,Path,Len) :-
       recorre(A,B,[A],Q),
       reverse(Q,Path),
       longitud_ruta(Path,Len).

% recorre(i,i,i,o).
% Aplica búsqueda en profundidad para
% encontrar un camino de A a B.
%
% i: Estación A
% i: Estación B
% i: Lista de estaciones visitadas
% o: Ruta de A a B
recorre(A,B,P,[B|P]) :-
       estaciones_conectadas(A,B,_).
recorre(A,B,Visited,Path) :-
       estaciones_conectadas(A,C,_),
       C \== B,
       \+member(C,Visited),
       recorre(C,B,[C|Visited],Path).

% rutas(i,i).
% Imprime todas las rutas entre A y B.
%
% i: Estación A
% i: Estación B
rutas(A, B):-
	ruta(A, B, X, _),
	write(X),
	nl,
	fail.

% escribe_rutas(i,i).
% Escribe en un archivo todas
% las rutas entre A y B.
%
% i: Estación A
% i: Estación B
escribe_rutas(A, B) :-
    open('file.txt', write, Stream),
    ( ruta(A, B, X, L), write(Stream, X), write(Stream," "), 
    	write(Stream, L), nl(Stream), fail; true ),
    close(Stream).

% estacion_a_menor_distancia(i,o,o).
% El siguiente predicado regresa la estación adyacente, según la lista
% de estaciones adyacentes que recibe,que está a la menor distancia de
% la estacion dada.
%
% i: Estacion de la que se quiere obtener la estación a menor distancia
% o: Nombre de la estacion adyacente a distancia menor
% o: Distancia a dicha estacion adyacente
estacion_a_menor_distancia(EstacionInicio,EstacionResultado,Distancia):-
       estaciones_adyacentes(EstacionInicio, ListaAdyacentes),
       estacion_menor(EstacionInicio,ListaAdyacentes,EstacionResultado,Distancia).

% estacion_menor(i,i,o,o).
% Dada una lista de estaciones, regresa la que tenga una
% distancia menor y dicha distancia.
%
% i: Estacion actual
% i: Lista de estaciones adyacentes
% o: Nombre de la estacion adyacente a distancia menor
% o: Distancia a dicha estacion adyacente
estacion_menor(Inicio,[],Inicio,0):-!.
estacion_menor(Inicio,[A],A, Dist):-
       estaciones_conectadas(Inicio,A,Dist),!.
estacion_menor(Inicio,[Primera|Cola],Estacion,Res):-
       estacion_menor_aux(Inicio,Primera,Cola,Estacion,Res),!.

% estacion_menor(i,i,i,o,o).
% Método auxiliar que compara entre estaciones
% para encontrar la de menor longitud.
%
% i: Estacion actual
% i: Estacion actual con menor distancia
% i: Lista de estaciones adyacentes
% o: Nombre de la estacion adyacente a distancia menor
% o: Distancia a dicha estacion adyacente
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