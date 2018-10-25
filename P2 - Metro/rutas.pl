% Malvaes Díaz, Stephanie Lizeth - 135515
% Peña Flores, Luis Fernando     - 158488
% Orduña Ferreira, Fabián        - 159001

% Archivo de Prolog que implementa
% la búsqueda A* para encontrar un
% camino óptimo en la red del Sistema
% de Transporte Colectivo Metro.

% Es necesario tener cargado el archivo 'stcm'
% que contiene la base de conocimiento del programa.
:- ensure_loaded(stcm). %Carga la base de conocimiento

% estaciones_conectadas(i,i,o).
% Averigua si existen un predicado que cumpla
% conexion(i,i,o) valido.
%
% i: Estación A
% i: Estación B
% o: Distancia de A a B
estaciones_conectadas(X,Y,L) :- conexion(X,Y,L).
estaciones_conectadas(X,Y,L) :- conexion(Y,X,L).

% estaciones_adyacentes(i,o).
% Regresa una lista con las estaciones adyacentes
% de una estación dada, X.
%
% i: Estación A
% o: Lista de estaciones adyacentes a A
estaciones_adyacentes(X, Z) :-
       findall(Y, estaciones_conectadas(X, Y,_), Z).

% longitud_ruta(i,o).
% Calcula la longitud de un camino dado.
%
% El camino debe ser dado en una lista y
% dicho camino dado debe ser válido.
%
% i: Lista con la ruta
% o: Largo de la ruta
longitud_ruta([_],0) :-!.
longitud_ruta([A,B|R],Len) :-
       estaciones_conectadas(A,B,L),
       longitud_ruta([B|R],T),
       Len is T + L.

% largo_ruta(i,o).
% Calcula el número de estaciones a recorrer
% de un camino dado.
%
% El camino debe ser dado en una lista y
% dicho camino dado debe ser válido.
%
% i: Lista con la ruta
% o: Número de estaciones en de la ruta
largo_ruta([_],0) :-!.
largo_ruta([A,B|R],Len) :-
       estaciones_conectadas(A,B,_),
       largo_ruta([B|R],T),
       Len is T + 1.

% transforma_rutas_a_distancia(i,o).
% Dada una lista de rutas regresa una
% lista con la longitud de las rutas en cuestión.
%
% i: Lista de rutas (Lista de listas)
% o: Lista de distancias
transforma_rutas_a_distancia(Rutas,Distancias) :-
       trans_aux(Rutas,[],Distancias).

%Métodos auxiliares para transforma_rutas_a_distancia(i,o).
trans_aux([],ListaTemp,ListaTemp).
trans_aux([RutaActual|Resto],ListaTemp,Final) :-
       longitud_ruta(RutaActual,DistanciaActual),
       append(ListaTemp,[DistanciaActual],Res),
       trans_aux(Resto,Res,Final).

agrega_rutas_a_cola_de_prioridad(Destino,Ruta,Cola,Resultado) :-
       append([Ruta],Cola,ColaParcial),
       ordena(Destino,ColaParcial,Resultado).

% ordena(i,i,o).
% Dada una estación destino y una lista de estaciones
% regresa una lista de las estaciones dadas ordenadas
% según la función heuristica
% Se utiliza el algoritmo de Insertion Sort
%
% i: Estación destino
% i: Lista de estaciones
% o: Lista de estaciones ordenadas
ordena(_,[],[]).
ordena(Destino,[Cabeza|Cola],Resultado) :-
       ordena(Destino,Cola,ResP),
       agrega_orden(Destino,Cabeza,ResP,Resultado).

% ordena(i,i,i,o).
% Dada una estación destino y una lista de estaciones
% aplica el algoritmo Insertion Sort para ordenar las
% estaciones.
%
% i: Estación destino
% i: Lista de estaciones
% i: Lista restante
% o: Lista de estaciones ordenadas
agrega_orden(_,Elem,[],[Elem]) :-!.
agrega_orden(Destino,Elem,[X|Y],[Elem,X|Y]) :-
       heuristica(Destino,Elem,Res1),
       heuristica(Destino,X,Res2),
       Res1 =< Res2,!.
agrega_orden(Destino,Elem,[X|Y],[X|Z]) :-
       agrega_orden(Destino,Elem,Y,Z),!.

% heuristica(i,i,o).
% Calcula la heuristica de la situacion actual
% 
% i: Estación destino
% i: Lista de la ruta
% o: Valor heurístico
heuristica(Destino, [EstacionActual|CaminoRecorrido], ValorCalculado) :-
       longitud_ruta([EstacionActual|CaminoRecorrido],Res1),
       heuristica_geografica(EstacionActual,Destino,Res2),
       ValorCalculado is Res1 + Res2.

% heuristica(i,i,o).
% Calcula la heuristica de la situacion actual
% Esta calculo determina que tan lejos se encuentra de
% la estación destino.
% 
% i: Estación actual
% i: Estación destino
% o: Valor heurístico geográfico
heuristica_geografica(EstacionOrigen,EstacionDestino,Resultado) :-
       estacion(EstacionOrigen,Coord1,Coord12),
       estacion(EstacionDestino,Coord2,Coord22),
       calcula_distancia(Coord1,Coord12,Coord2,Coord22,Resultado).

% calcula_distancia(i,i,i,i,o).
% Calcula la distancia entre dos estaciones
% 
% i: Latitud de estacion A
% i: Longitud de estacion A
% i: Latitud de estacion B
% i: Longitud de estacion B
% o: Distancia entre las estaciones
calcula_distancia(Ll1,Ln1,Ll2,Ln2,Res) :-
       Res is sqrt( (Ll1-Ll2)**2 + (Ln1-Ln2)**2) * 110.57. %110.57,111.70

% ruta_Aestrella(i,i,o).
% Calcula una ruta entre dos estaciones dadas
% Utiliza la búsqueda heurístico A*
%
% i: Estacion origen
% i: Estacion destino
% o: Ruta entre estación origen y estación destino
ruta_Aestrella(Origen,Destino,Ruta) :-
       estacion(Origen,_,_),
       estacion(Destino,_,_),
       recorre_Aestrella(Destino,[Origen],[],Ruta).

% recorre_Aestrella(i,i,i,o).
% Dadas las estaciones adyacentes de una estación
% se concatenan a la ruta actual y se agregan a la cola de
% prioridad antes de seguir aplicando la búsqueda A*.
%
% i: Estacion destino
% i: Ruta actual
% i: Cola de prioridad
% o: Ruta propuesta entre estación origen y estación destino
recorre_Aestrella(Destino,[Destino|Resto],_,[Destino|Resto]) :-!.
recorre_Aestrella(Destino,[CabezaRutaActual|ColaRutaActual],ColaDePrioridad,Resultado) :-
       %de los resultados de ruta actual con sus adyacentes       write("Bandera 1"),nl,
       estaciones_adyacentes(CabezaRutaActual,ResultadosAdyacentes),
       %write("Adyacentes a "),write(CabezaRutaActual),write(" son : "),nl,write("    "),write(ResultadosAdyacentes),
       %agregar todos a cola de prioridad, meter si no estan repetidos o si la ruta no esta repetida
       inserta_aux(Destino,[CabezaRutaActual|ColaRutaActual],ResultadosAdyacentes,ColaDePrioridad,[CabezaColaActualizada|RestoColaActualizada]),
       %nos regresa la cola de prioridad y el ultimo argumento es una lista de listas
       %nl,nl,write("Después de agregar adyacentes. "),write([CabezaColaActualizada|RestoColaActualizada]),nl,nl,
       %write(" * * *  RECURSION ESTRELLA * * *"),nl,
       %write([CabezaColaActualizada|RestoColaActualizada]),nl,nl,
       recorre_Aestrella(Destino,CabezaColaActualizada,RestoColaActualizada,Resultado).

% inserta_aux(i,i,i,i,o).
% Método auxiliar que agrega las estaciones
% adyacentes a la cola de prioridad en caso
% de que aún no se encuentren en ella.
%
% i: Estacion destino
% i: Ruta actual
% i: Lista de estaciones adyacentes
% i: Cola de prioridad
% o: Cola de prioridad actualizada
inserta_aux(_,_,[],ColaDePrioridadActualizada,ColaDePrioridadActualizada) :-!.
inserta_aux(Destino,[CabezaRutaActual|RestoRutaActual],[CabezaListaAdyacentes],ColaPrioridad,Resultado):-
      (   \+member(CabezaListaAdyacentes,[CabezaRutaActual|RestoRutaActual]) ->
      append([CabezaListaAdyacentes],[CabezaRutaActual|RestoRutaActual],AInsertar),
      %Destino,Ruta,Cola,Resultado
      agrega_rutas_a_cola_de_prioridad(Destino,AInsertar,ColaPrioridad,ResP),
          inserta_aux(_,_,[],ResP,Resultado)
      ;inserta_aux(_,_,[],ColaPrioridad,Resultado)),!.
inserta_aux(Destino,RutaActual,[CabezaListaAdyacentes|RestoListaAdyacentes],ColaPrioridad,Resultado) :-
       %nl,nl,nl,write(ColaPrioridad),nl,nl,nl,
       %nl,nl,write("Inserta a adyacentes"),
       (\+member(CabezaListaAdyacentes,RutaActual)->
       append([CabezaListaAdyacentes],RutaActual,AInsertar),
       %write("antes de agregar a la cola :     "),nl,nl,write(ColaPrioridad),
       agrega_rutas_a_cola_de_prioridad(Destino,AInsertar,ColaPrioridad,ColaPrioridadActualizada),
       %write("despues de agregar a la cola :     "),nl,nl,write(ColaPrioridadActualizada),

       % nl,nl,write("Se va a insertar : "),nl,nl,write(AInsertar),
        %DETALLE
        %nl,write("-> Cola de prioridad actual"),write([Cabeza|ColaPrioridadActualizada]),nl,
        inserta_aux(Destino,RutaActual,RestoListaAdyacentes,ColaPrioridadActualizada,Resultado);
       %en caso de que este en la lista
       %write("Ya estaba en lista de prioridad"),
        inserta_aux(Destino,RutaActual,RestoListaAdyacentes,ColaPrioridad,Resultado)
       ).

% imprime(i).
% imprime línea a línea el contenido
% de una lista.
%
% i: Lista
imprime([]) :-!.
imprime([Ultimo]) :-
       write(Ultimo).
imprime([Cabeza|Resto]) :-
       write(Cabeza),
       nl,
       imprime(Resto).

% calcula_ruta_optima(i,i,o).
% Calcula una ruta entre dos estaciones dadas.
% Además imprime la ruta, su longitud y su
% número de estaciones.
% Utiliza la búsqueda heurística A*
%
% i: Estacion origen
% i: Estacion destino
% o: Ruta entre estación origen y estación destino
calcula_ruta_optima(Origen,Destino,RutaDesdeInicio) :-
       ruta_Aestrella(Origen,Destino,RutaI),!,
       reverse(RutaI,RutaDesdeInicio),
       longitud_ruta(RutaDesdeInicio,Len),
       largo_ruta(RutaDesdeInicio,Size),
       write("Distancia: "), write(Len),nl,
       write("# estaciones: "), write(Size),nl,
       %write(RutaDesdeInicio),!.
       imprime(RutaDesdeInicio),!.