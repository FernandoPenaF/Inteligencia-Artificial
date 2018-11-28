% Malvaes D韆z, Stephanie Lizeth - 135515
% Pe馻 Flores, Luis Fernando     - 158488
% Ordu馻 Ferreira, Fabi醤        - 159001

% IMPORTANTE: El working_directory de Prolog debe estar en
% la carpeta de este archivo para no tener problemas.
% En caso contrario, el archivo proyecto.pl contiene todo junto
% para su correcta ejecuci髇.

% Archivo de SWI Prolog que implementa
% la b鷖queda A* para encontrar un
% camino 髉timo en la red del Sistema
% de Transporte Colectivo Metro.

% Es necesario tener cargado el archivo 'stcm'
% que contiene la base de conocimiento del programa.
:- ensure_loaded(stcm). %Carga la base de conocimiento

% estaciones_conectadas(i,i,o).
% Averigua si existen un predicado que cumpla
% conexion(i,i,o) valido.
%
% i: Estaci髇 A
% i: Estaci髇 B
% o: Distancia de A a B
estaciones_conectadas(X,Y,L) :- conexion(X,Y,L).
estaciones_conectadas(X,Y,L) :- conexion(Y,X,L).

% estaciones_adyacentes(i,o).
% Regresa una lista con las estaciones adyacentes
% de una estaci髇 dada, X.
%
% i: Estaci髇 A
% o: Lista de estaciones adyacentes a A
estaciones_adyacentes(X, Z) :-
       findall(Y, estaciones_conectadas(X, Y,_), Z).

% longitud_ruta(i,o).
% Calcula la longitud de una ruta dada.
% El camino debe ser dado en una lista y
% dicho camino dado debe ser v醠ido.
%
% i: Lista con la ruta
% o: Largo de la ruta
longitud_ruta([_],0) :-!.
longitud_ruta([A,B|R],Len) :-
       estaciones_conectadas(A,B,L),
       longitud_ruta([B|R],T),
       Len is T + L.

% largo_ruta(i,o).
% Calcula el n鷐ero de estaciones a recorrer
% de una ruta dada.
% El camino debe ser dado en una lista y
% dicho camino dado debe ser v醠ido.
%
% i: Lista con la ruta
% o: N鷐ero de estaciones en de la ruta
largo_ruta([_],0) :-!.
largo_ruta([A,B|R],Len) :-
       estaciones_conectadas(A,B,_),
       largo_ruta([B|R],T),
       Len is T + 1.

% transforma_rutas_a_distancia(i,o).
% Dada una lista de rutas regresa una
% lista con la longitud de las rutas en cuesti髇.
%
% i: Lista de rutas (Lista de listas)
% o: Lista de distancias
transforma_rutas_a_distancia(Rutas,Distancias) :-
       trans_aux(Rutas,[],Distancias).

% trans_aux(i,o).
% M閠odo auxiliar que agrega la longitud de
% las rutas a la lista de distancias.
%
% i: Lista de rutas (Lista de listas)
% i: Lista auxiliar
% i: Lista de distancias
trans_aux([],ListaTemp,ListaTemp).
trans_aux([RutaActual|Resto],ListaTemp,Final) :-
       longitud_ruta(RutaActual,DistanciaActual),
       append(ListaTemp,[DistanciaActual],Res),
       trans_aux(Resto,Res,Final).

% agrega_rutas_a_cola_de_prioridad(i,i,i,o).
% Agrega, de forma ordenada, una ruta nueva
% a la cola de rutas.
%
% i: Estaci髇 destino
% i: Ruta a agregar
% i: Cola de prioridad actual
% o: Cola de prioridad nueva
agrega_rutas_a_cola_de_prioridad(Destino,Ruta,Cola,Resultado) :-
       append([Ruta],Cola,ColaParcial),
       ordena(Destino,ColaParcial,Resultado).

% ordena(i,i,o).
% Dada una estaci髇 destino y una lista de estaciones
% regresa una lista de las estaciones dadas ordenadas
% seg鷑 la funci髇 heuristica
% Se utiliza el algoritmo de Insertion Sort
%
% i: Estaci髇 destino
% i: Lista de estaciones
% o: Lista de estaciones ordenadas
ordena(_,[],[]).
ordena(Destino,[Cabeza|Cola],Resultado) :-
       ordena(Destino,Cola,ResP),
       agrega_orden(Destino,Cabeza,ResP,Resultado).

% ordena(i,i,i,o).
% Dada una estaci髇 destino y una lista de estaciones
% aplica el algoritmo Insertion Sort para ordenar las
% estaciones.
%
% i: Estaci髇 destino
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
% Calcula la heuristica de la situacion actual.
%
% i: Estaci髇 destino
% i: Lista de la ruta
% o: Valor heur韘tico
heuristica(Destino, [EstacionActual|CaminoRecorrido], ValorCalculado) :-
       longitud_ruta([EstacionActual|CaminoRecorrido],Res1),
       heuristica_geografica(EstacionActual,Destino,Res2),
       ValorCalculado is Res1 + Res2.

% heuristica(i,i,o).
% Calcula la heuristica geogr醘ica
% de la situacion actual.
% Esta calculo determina que tan lejos
% se encuentra de la estaci髇 destino.
%
% i: Estaci髇 actual
% i: Estaci髇 destino
% o: Valor heur韘tico geogr醘ico
heuristica_geografica(EstacionOrigen,EstacionDestino,Resultado) :-
       estacion(EstacionOrigen,Coord1,Coord12),
       estacion(EstacionDestino,Coord2,Coord22),
       calcula_distancia(Coord1,Coord12,Coord2,Coord22,Resultado).

% calcula_distancia(i,i,i,i,o).
% Calcula la distancia geogr醘ica entre dos estaciones.
% Se utiliza una constante de normalizaci髇 para ajustar
% la diferencia entre las coordenadas geogr醘icas.
%
% i: Latitud de estacion A
% i: Longitud de estacion A
% i: Latitud de estacion B
% i: Longitud de estacion B
% o: Distancia entre las estaciones
calcula_distancia(Ll1,Ln1,Ll2,Ln2,Res) :-
       Res is sqrt( (Ll1-Ll2)**2 + (Ln1-Ln2)**2) * 110.57. %110.57,111.70

% ruta_Aestrella(i,i,o).
% Calcula una ruta entre dos estaciones dadas.
% Utiliza la b鷖queda heur韘tico A*.
%
% i: Estacion origen
% i: Estacion destino
% o: Ruta entre estaci髇 origen y estaci髇 destino
ruta_Aestrella(Origen,Destino,Ruta) :-
       estacion(Origen,_,_),
       estacion(Destino,_,_),
       recorre_Aestrella(Destino,[Origen],[],Ruta).

% recorre_Aestrella(i,i,i,o).
% Dadas las estaciones adyacentes de una estaci髇
% se concatenan a la ruta actual y se agregan a la cola de
% prioridad antes de seguir aplicando la b鷖queda A*.
%
% i: Estacion destino
% i: Ruta actual
% i: Cola de prioridad
% o: Ruta propuesta entre estaci髇 origen y estaci髇 destino
recorre_Aestrella(Destino,[Destino|Resto],_,[Destino|Resto]) :-!.
recorre_Aestrella(Destino,[CabezaRutaActual|ColaRutaActual],ColaDePrioridad,Resultado) :-
       %de los resultados de ruta actual con sus adyacentes       write("Bandera 1"),nl,
       estaciones_adyacentes(CabezaRutaActual,ResultadosAdyacentes),
       %write("Adyacentes a "),write(CabezaRutaActual),write(" son : "),nl,write("    "),write(ResultadosAdyacentes),
       %agregar todos a cola de prioridad, meter si no estan repetidos o si la ruta no esta repetida
       inserta_aux(Destino,[CabezaRutaActual|ColaRutaActual],ResultadosAdyacentes,ColaDePrioridad,[CabezaColaActualizada|RestoColaActualizada]),
       %nos regresa la cola de prioridad y el ultimo argumento es una lista de listas
       %nl,nl,write("Despu閟 de agregar adyacentes. "),write([CabezaColaActualizada|RestoColaActualizada]),nl,nl,
       %write(" * * *  RECURSION ESTRELLA * * *"),nl,
       %write([CabezaColaActualizada|RestoColaActualizada]),nl,nl,
       recorre_Aestrella(Destino,CabezaColaActualizada,RestoColaActualizada,Resultado).

% inserta_aux(i,i,i,i,o).
% M閠odo auxiliar que agrega las estaciones
% adyacentes a la cola de prioridad en caso
% de que a鷑 no se encuentren en ella.
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
% Imprime, l韓ea a l韓ea, el contenido
% de una lista.
%
% i: Lista
imprime([]) :-!.
imprime([Cabeza|Resto]) :-
       write(Cabeza),
       nl,
       imprime(Resto).

% calcula_ruta_optima(i,i,o).
% Calcula una ruta entre dos estaciones dadas.
% Adem醩 imprime la ruta, su longitud y su
% n鷐ero de estaciones.
% Utiliza la b鷖queda heur韘tica A*.
%
% i: Estacion origen
% i: Estacion destino
% o: Ruta entre estaci髇 origen y estaci髇 destino
calcula_ruta_optima(Origen,Destino,RutaDesdeInicio) :-
       ruta_Aestrella(Origen,Destino,RutaI),!,
       reverse(RutaI,RutaDesdeInicio),
       longitud_ruta(RutaDesdeInicio,Len),
       largo_ruta(RutaDesdeInicio,Size),
       write("Distancia: "), write(Len),nl,
       write("# estaciones: "), write(Size),nl,
       %write(RutaDesdeInicio),!.
       imprime(RutaDesdeInicio),!.

% ruta(i,i,o,o).
% Encuentra una ruta y la longitud
% de dicho ruta entre dos estaciones
% dadas, A y B.
%
% i: Estaci贸n A
% i: Estaci贸n B
% o: Ruta de A a B
% o: Longitud de la ruta de A a B
ruta(A,B,Path,Len) :-
       recorre(A,B,[A],Q),
       reverse(Q,Path),
       longitud_ruta(Path,Len).

% recorre(i,i,i,o).
% Aplica b煤squeda en profundidad para
% encontrar un camino de A a B.
%
% i: Estaci贸n A
% i: Estaci贸n B
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
% i: Estaci贸n A
% i: Estaci贸n B
rutas(A, B):-
      ruta(A, B, X, _),
      write(X),
      nl,
      fail.

% escribe_rutas(i,i).
% Escribe en un archivo todas
% las rutas entre A y B.
%
% i: Estaci贸n A
% i: Estaci贸n B
escribe_rutas(A, B) :-
    open('file.txt', write, Stream),
    ( ruta(A, B, X, _), write(Stream, X), write(Stream,"."), nl(Stream), fail; true ),
    close(Stream).

% escribe_caso(i,i).
% Escribe en la base de casos la ruta
% 髉tima, calculada con A*, entre A y B.
%
% i: Estaci贸n A
% i: Estaci贸n B
escribe_caso(A, B) :-
    open('casos.txt', append, Stream),
    ( calcula_ruta_optima(A, B, X), write(Stream, X), write(Stream,"."), nl(Stream), !; true ),
    close(Stream).

% lee_casos(o).
% Lee la base de casos y regresa
% su contenido en una lista.
%
% o: Lista de rutas del metro
lee_casos(L):-
  setup_call_cleanup(
    open('casos.txt', read, In),
    lee_datos(In, L),
    close(In)
  ).

% lee_datos(i,o).
% Dado un archivo de entrada lee, l韓ea
% a l韓ea y hasta el final del archivo,
% su contenido y regresa su contenido en una
% lista.
%
% i: Archivo
% o: Datos leidos
lee_datos(In, L):-
  read_term(In, H, []),
  (   H == end_of_file
  ->  L = []
  ;   L = [H|T],
      lee_datos(In,T)
  ).

% imprime_casos().
% Imprime los datos leidos de
% lee_casos(o).
imprime_casos():-
  lee_casos(L),
  imprime(L).



hay_caso(Estacion1,Estacion2,Caso):-
       lee_casos(ListaDeCasos),
       aux_hay_caso(Estacion1,Estacion2,ListaDeCasos,Caso).


aux_hay_caso(_,_,[],[]).
aux_hay_caso(Estacion1, Estacion2,[CasoActual|CasosSobrantes],Caso):-
       (member(Estacion1,CasoActual),member(Estacion2,CasoActual) ->
       Caso = CasoActual       );
       aux_hay_caso(Estacion1, Estacion2,CasosSobrantes,Caso),!.


limpia_caso(Estacion1,Estacion2,Caso,Res):-
       encuentraInicial(Estacion1,Estacion2,Caso,Res1),
       reverse(Res1,Res2),
       encuentraInicial(Estacion1,Estacion2,Res2,Res).

encuentraInicial(_,_,[],[]):-!.
encuentraInicial(Est1,_,[Est1|Resto],[Est1|Resto]):-!.
encuentraInicial(_,Est2,[Est2|Resto],[Est2|Resto]):-!.
encuentraInicial(Est1,Est2,[_|Resto],Res):-
       encuentraInicial(Est1,Est2,Resto,Res).
