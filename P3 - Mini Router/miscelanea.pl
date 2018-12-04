% Malvaes DÃ­az, Stephanie Lizeth - 135515
% PeÃ±a Flores, Luis Fernando     - 158488
% OrduÃ±a Ferreira, FabiÃ¡n        - 159001

% IMPORTANTE: El working_directory de Prolog debe estar en
% la carpeta de este archivo para no tener problemas.
% En caso contrario, el archivo proyecto.pl contiene todo junto
% para su correcta ejecución.

% Archivo de SWI Prolog que implementa
% mÃ©todos interesantes para aplicar
% a la red del Sistema Transporte
% Colectivo Metro.


% Es necesario tener cargado el archivo 'stcm.pl'
% que contiene la base de conocimiento del programa.
% AsÃ­ como mÃ©todos auxilares del archivo 'rutas.pl'
:- ensure_loaded(stcm). %Carga la base de conocimiento
:- ensure_loaded(rutas). %Carga mÃ©todos principales

% ruta(i,i,o,o).
% Encuentra una ruta y la longitud
% de dicho ruta entre dos estaciones
% dadas, A y B.
%
% i: EstaciÃ³n A
% i: EstaciÃ³n B
% o: Ruta de A a B
% o: Longitud de la ruta de A a B
ruta(A,B,Path,Len) :-
       recorre(A,B,[A],Q),
       reverse(Q,Path),
       longitud_ruta(Path,Len).

% recorre(i,i,i,o).
% Aplica bÃºsqueda en profundidad para
% encontrar un camino de A a B.
%
% i: EstaciÃ³n A
% i: EstaciÃ³n B
% i: Lista de estaciones visitadas
% o: Ruta de A a B
recorre(A,B,P,[B|P]) :-
       estaciones_conectadas(A,B,_).
recorre(A,B,Visited,Path) :-
       estaciones_conectadas(A,C,_),
       C \== B,
       \+member(C,Visited),
       recorre(C,B,[C|Visited],Path).

% escribe_rutas(i,i).
% Escribe en un archivo todas
% las rutas entre A y B.
%
% i: EstaciÃ³n A
% i: EstaciÃ³n B
escribe_rutas(A, B) :-
    open('file.txt', write, Stream),
    ( ruta(A, B, X, _), write(Stream, X), 
      write(Stream,"."), nl(Stream), fail; true ),
    close(Stream).

% escribe_subrutas(i).
% Escribe en la base de casos todas
% las subrutas de una ruta dada.
%
% i: Ruta
escribe_subrutas(Ruta, MinConexiones) :-
    MinConexiones >= 0,
    sublistas(Ruta, L),
    largo_ruta(L, Len),
    Len > MinConexiones,
    escribe_a_archivo(L),
    fail.

% subcaminos(i).
% Dada una ruta imprime todas las posibles
% subrutas válidas que tengan más de una
% estación.
%
% i: Lista de rutas
subcaminos(Ruta, MinConexiones):-
  MinConexiones >= 0,
  sublistas(Ruta, L),
  largo_ruta(L, Len),
  Len > MinConexiones,
  write(L),
  nl,
  fail.

% sublistas(i, o).
% Dada una lista regresa todas las
% 2^n sublistas distinas.
% (n es el tamaño de la lista)
%
% i: Lista
% o: Sublista correspondiente
sublistas([],[]):-!.
sublistas([E|Resto], [E|N]):-
  sublistas(Resto, N).
sublistas([_|Resto], N):-
  sublistas(Resto, N).