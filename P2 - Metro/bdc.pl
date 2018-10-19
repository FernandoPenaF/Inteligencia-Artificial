%Linea 1
%estacion(nombre,latitud,longitud).

%calculaDistancia(Estacion1,Estacion2,Distancia)
% estacion(Estacion1,Lt1,Ll1),
% estacionEstacion2,Lt2,Ll2),
% k is 10,
% Distancia is (Lt1-Lt2+Ll1-Ll2) * K.

%Línea 1
conexion(observatorio, tacubaya,1.46).%rosa
conexion(tacubaya, juanacatlan,1.4).%rosa
conexion(juanacatlan,chapultepec,1.16).%rosa
conexion(chapultepec, sevilla,0.68).%rosa
conexion(sevilla, insurgentes,0.82).%rosa
conexion(insurgentes, cuauhtemoc, 0.95).%rosa
conexion(cuauhtemoc, balderas,0.62).%rosa
conexion(balderas, salto_del_agua,0.64).%rosa
conexion(salto_del_agua,isabel_la_catolica,0.62).%rosa
conexion(isabel_la_catolica, pino_suarez,0.57).%rosa
conexion(pino_suarez,merced, 0.79).%rosa
conexion(merced, candelaria,0.70).%rosa
conexion(candelaria, san_lazaro,0.59).%rosa
conexion(san_lazaro, moctezuma, 0.82).%rosa
conexion(moctezuma, balbuena, 0.94).%rosa
conexion(balbuena,boulevard_puerto_aereo,0.86).%rosa
conexion(boulevard_puerto_aereo,gomez_farias,0.76).%rosa
conexion(gomez_farias, zaragoza, 1.06).%rosa
conexion(zaragoza, pantitlan,1.32).%rosa

%Línea 2
conexion(cuatro_caminos, panteones, 1.74). %azul
conexion(panteones, tacuba, 1.64). %azul
conexion(tacuba, cuitlahuac, 0.84). %azul
conexion(cuitlahuac, popotla, 0.86). %azul
conexion(popotla, colegio_militar, 0.68). %azul
conexion(colegio_militar, normal, 0.69). %azul
conexion(normal, san_cosme, 0.75). %azul
conexion(san_cosme, revolucion, 0.86). %azul
conexion(revolucion, hidalgo, 0.75). %azul
conexion(hidalgo, bellas_artes, 0.63). %azul
conexion(bellas_artes, allende, 0.49). %azul
conexion(allende, zocalo, 0.72). %azul
conexion(zocalo, pino_suarez, 0.8). %azul
conexion(pino_suarez, san_antonio_abad, 1.1). %azul
conexion(san_antonio_abad, chabacano, 0.79). %azul
conexion(chabacano, viaducto, 0.91). %azul
conexion(viaducto, xola, 0.65). %azul
conexion(xola, villa_de_cortes, 0.85). %azul
conexion(villa_de_cortes, nativitas, 0.91). %azul
conexion(nativitas, portales, 1.08). %azul
conexion(portales, ermita, 0.89). %azul
conexion(ermita, general_anaya, 0.99). %azul
conexion(general_anaya, tasqueña, 1.5). %azul

% Línea 3
% En Etiopia - Plaza de la Transparencia se consideró
% solamente como Etiopia
% Analogamente, Viveros - Derechos humanos se consideró
% solamente como Viveros
conexion(indios_verdes, deportivo_18_de_marzo, 1.42). %verde
conexion(deportivo_18_de_marzo, potrero, 1.08). %verde
conexion(potrero, la_raza, 1.11). %verde
conexion(la_raza, tlatelolco, 1.6). %verde
conexion(tlatelolco, guerrero, 1.18). %verde
conexion(guerrero, hidalgo, 0.91). %verde
conexion(hidalgo, juarez, 0.42). %verde
conexion(juarez, balderas, 0.75). %verde
conexion(balderas, niños_heroes, 0.86). %verde
conexion(niños_heroes, hospital_general, 0.71). %verde
conexion(hospital_general, centro_medico, 0.72). %verde
conexion(centro_medico, etiopia, 1.3). %verde
conexion(etiopia, eugenia, 1.1). %verde
conexion(eugenia, division_del_norte, 0.87). %verde
conexion(division_del_norte, zapata, 1.05). %verde
conexion(zapata, coyoacan, 1.22). %verde
conexion(coyoacan, viveros, 0.98). %verde
conexion(viveros, miguel_angel_de_quevedo, 1.02). %verde
conexion(miguel_angel_de_quevedo, copilco, 1.25). %verde
conexion(copilco, universidad, 1.42). %verde

%Línea 4
conexion(martin_carrera, talisman, 1.3). %verde claro
conexion(talisman, bondojito, 1.2). %verde claro
conexion(bondojito, consulado, 0.94). %verde claro
conexion(consulado, canal_del_norte, 0.99). %verde claro
conexion(canal_del_norte, morelos, 1.07). %verde claro
conexion(morelos, candelaria,1.25). %verde claro
conexion(candelaria, fray_servando, 0.93). %verde claro
conexion(fray_servando, jamaica, 1.33). %verde claro
conexion(jamaica, santa_anita, 0.83). %verde claro

%Línea 5
conexion(politecnico, instituto_del_petroleo,1.32).%amarilla
conexion(instituto_del_petroleo, autobuses_del_norte,1.35).%amarilla
conexion(autobuses_del_norte, la_raza,1.17).%amarilla
conexion(la_raza,misterios,0.95).%amarilla
conexion(misterios, valle_gomez,1.28).%amarilla
conexion(valle_gomez, consulado,0.84).%amarilla
conexion(consulado, eduardo_molina,1.05).%amarilla
conexion(eduardo_molina, aragon,1.09).%amarilla
conexion(aragon, oceania, 1.21).%amarilla
conexion(oceania, terminal_aerea,1.42).%amarilla
conexion(terminal_aerea, hangares, 1.18).%amarilla
conexion(hangares, pantitlan,1.69).%amarilla

%Línea 6
conexion(el_rosario, tezozomoc, 1.16). %rojo
conexion(tezozomoc, azcapotzalco, 1.13).%rojo
conexion(azcapotzalco, ferreria, 1.39).%rojo
conexion(ferreria, norte_45, 1.33).%rojo
conexion(norte_45, vallejo, 0.84).%rojo
conexion(vallejo,instituto_del_petroleo,0.88).%rojo
conexion(instituto_del_petroleo, lindavista, 1.35).%rojo
conexion(lindavista, deportivo_18_de_marzo, 1.05).%rojo
conexion(deportivo_18_de_marzo, la_villa_basilica, 0.85).%rojo
conexion(la_villa_basilica, martin_carrera, 1.29).%rojo

%Línea 7
conexion(el_rosario, aquiles_serdan, 1.82).%naranja
conexion(aquiles_serdan, camarones, 1.24).%naranja
conexion(camarones, refineria, 1.11).%naranja
conexion(refineria, tacuba, 1.2).%naranja
conexion(tacuba, san_joaquin,1.54).%naranja
conexion(san_joaquin, polanco,1.35).%naranja
conexion(polanco, auditorio,0.9).%naranja
conexion(auditorio, constituyentes,1.56).%naranja
conexion(constituyentes, tacubaya, 1.13).%naranja
conexion(san_pedro_de_los_pinos,tacubaya,1.27).%naranja
conexion(san_pedro_de_los_pinos,san_antonio,0.71).%naranja
conexion(san_antonio, mixcoac,0.99).%naranja
conexion(mixcoac, barranca_del_muerto,1.69).%naranja

%Línea 8
conexion(garibaldi_lagunilla, bellas_artes, 0.80). %verde oscuro
conexion(bellas_artes, san_juan_de_letran, 0.65). %verde oscuro
conexion(san_juan_de_letran, isabel_la_catolica, 0.46). %verde oscuro
conexion(isabel_la_catolica, doctores, 0.77). %verde oscuro
conexion(doctores, obrera, 0.85). %verde oscuro
conexion(obrera, chabacano, 0.99). %verde oscuro
conexion(chabacano, la_viga, 1.02). %verde oscuro
conexion(la_viga, santa_anita, 0.66). %verde oscuro
conexion(santa_anita, coyuya, 1.22). %verde oscuro
conexion(coyuya, iztacalco, 1.04). %verde oscuro
conexion(iztacalco, apatlaco, 1.09). %verde oscuro
conexion(apatlaco, aculco, 0.69). %verde oscuro
conexion(aculco, escuadron_201, 1.04). %verde oscuro
conexion(escuadron_201, atlalilco, 1.35). %verde oscuro
conexion(atlalilco, iztapalapa, 0.86). %verde oscuro
conexion(iztapalapa, cerro_de_la_estrella, 1.91). %verde oscuro
conexion(cerro_de_la_estrella, uamI, 1.25). %verde oscuro
conexion(uamI, constitucion_de_1917, 1.27). %verde oscuro

%Línea 9
conexion(pantitlan, puebla,1.55).%cafe
conexion(puebla, ciudad_deportiva, 0.93).%cafe
conexion(ciudad_deportiva, velodromo, 1.26).%cafe
conexion(velodromo, mixiuhca, 1.06).%cafe
conexion(mixiuhca, jamaica, 0.95).%cafe
conexion(jamaica, chabacano, 1.23).%cafe
conexion(chabacano, lazaro_cardenas, 1.1).%cafe
conexion(lazaro_cardenas, centro_medico, 1.15).%cafe
conexion(centro_medico,chilpancingo,1.4).%cafe
conexion(chilpancingo, patriotismo, 1.1).%cafe
conexion(patriotismo, tacubaya,1.05).%cafe

%Línea A
conexion(pantitlan, agricola_oriental,1.58).%morada
conexion(agricola_oriental, canal_de_san_juan,1.23).%morada
conexion(canal_de_san_juan,tepalcates,1.6).%morada
conexion(tepalcates,guelatao,1.3).%morada
conexion(guelatao, peñon_viejo,2.36).%morada
conexion(peñon_viejo, acatitla, 1.56).%morada
conexion(acatitla, santa_marta, 1.24).%morada
conexion(santa_marta, los_reyes,1.93).%morada
conexion(los_reyes,la_paz,2.11).%morada

%Línea B
conexion(buenavista, guerrero, 0.49). %gris-verde
conexion(guerrero, garibaldi_lagunilla, 0.64). %gris-verde
conexion(garibaldi_lagunilla, lagunilla, 0.76). %gris-verde
conexion(lagunilla, tepito, 0.81). %gris-verde
conexion(tepito, morelos, 0.60). %gris-verde
conexion(morelos, san_lazaro, 1.33). %gris-verde
conexion(san_lazaro, flores_magon, 1.17). %gris-verde
conexion(flores_magon, romero_rubio, 1.06). %gris-verde
conexion(romero_rubio, oceania, 0.96). %gris-verde
conexion(oceania, deportivo_oceania, 1.01). %gris-verde
conexion(deportivo_oceania, bosque_de_aragon, 1.32). %gris-verde
conexion(bosque_de_aragon, villa_de_aragon, 0.93). %gris-verde
conexion(villa_de_aragon, nezahualcoyotl, 1.47). %gris-verde
conexion(nezahualcoyotl, impulsora, 1.55). %gris-verde
conexion(impulsora, rio_de_los_remedios, 0.60). %gris-verde
conexion(rio_de_los_remedios, muzquiz, 1.27). %gris-verde
conexion(muzquiz, ecatepec, 1.69). %gris-verde
conexion(ecatepec, olimpica, 0.70). %gris-verde
conexion(olimpica, plaza_aragon, 0.86). %gris-verde
conexion(plaza_aragon, ciudad_azteca, 0.74). %gris-verde

%Línea 12
conexion(mixcoac, insurgentes_sur, 1). %dorada
conexion(insurgentes_sur, hospital_20_de_noviembre, 1). %dorada
conexion(hospital_20_de_noviembre, zapata, 1). %dorada
conexion(zapata, parque_de_los_venados, 1). %dorada
conexion(parque_de_los_venados, eje_central, 1). %dorada
conexion(eje_central, ermita, 1). %dorada
conexion(ermita, mexicaltzingo, 1). %dorada
conexion(mexicaltzingo, atlalilco, 1). %dorada
conexion(atlalilco, culhuacan, 1). %dorada
conexion(culhuacan, san_andres_tomatlan, 1). %dorada
conexion(san_andres_tomatlan, lomas_estrella, 1). %dorada
conexion(lomas_estrella, calle_11, 1). %dorada
conexion(calle_11, periferico_oriente, 1). %dorada
conexion(periferico_oriente, tezonco, 1). %dorada
conexion(tezonco, olivos, 1). %dorada
conexion(olivos, nopalera, 1). %dorada
conexion(nopalera, zapotitlan, 1). %dorada
conexion(zapotitlan, tlaltenco, 1). %dorada
conexion(tlaltenco, tlahuac, 1). %dorada

connectedEdges(X,Y,L) :- conexion(X,Y,L).
connectedEdges(X,Y,L) :- conexion(Y,X,L).

%Consultas para probar conexiones
%
%connectedEdges(X,barranca_del_muerto),write(X),nl,fail.
%connectedEdges(X,Y),write(X),nl,fail.
%path(tacuba, norte_45,X),write(X), nl, fail.

path(A,B,Path,Len) :-
       travel(A,B,[A],Q),
       reverse(Q,Path),
       pathLen(Path,Len).

travel(A,B,P,[B|P]) :-
       connectedEdges(A,B,_).
%esta es busqueda en profundidad
travel(A,B,Visited,Path) :-
       connectedEdges(A,C,_),
       C \== B,
       \+member(C,Visited),
       travel(C,B,[C|Visited],Path).

%pathLen(i,o).
%Calcula el número de estaciones a recorrer
%de un camino dado, i.
%
%Notar que el camino dado a calcular
%debe ser un camino válido.
pathLen([_],0).
pathLen([A,B|R],Len):-
       connectedEdges(A,B,L),
       pathLen([B|R],T),
       Len is T + L.

%pathSize(i,o).
%Calcula la longitud de un camino dado, i.
%Notar que el camino dado a calcular
%debe ser un camino válido.
pathSize([_],0).
pathSize([A,B|R],Len):-
       connectedEdges(A,B,_),
       pathSize([B|R],T),
       Len is T + 1.

all_paths(A, B):-
	path(A, B, X, _),
	write(X),
	nl,
	fail.

write_all_paths(A, B) :-
    open('file.txt', write, Stream),
    ( path(A, B, X, L), write(Stream, X), write(Stream," "), write(Stream, L), nl(Stream), fail; true ),
    close(Stream).

%F U E N T E:
%https://stackoverflow.com/questions/40072311/directed-graph-in-prolog
%https://en.wikipedia.org/wiki/Negation_as_failure
%http://www.swi-prolog.org/pldoc/man?predicate=findall/3

estaciones_adyacentes(X, Z):-
       findall(Y, connectedEdges(X, Y,_), Z).

% metodo que dada una lista, te regresa el indice de donde se encuentra
% el menor valor.

%indiceValorMenor([],0):-!.
%indiceValorMenor([_],1):-!.
%indiceValorMenor([Primero|Cola],Res):-
%      indiceMenor(1,Primero,2,Cola,Res).
%%%
%indiceMenor(IndiceMenor,Menor,_, [],IndiceMenor):-
%       write(Menor),!.
% indiceMenor(IndiceMenor, Menor, IndiceActual,[DatoActual | Resto], Res):-
%        IndiceSiguiente is IndiceActual + 1, ( Menor>DatoActual ->
% indiceMenor(IndiceActual, DatoActual, IndiceSiguiente,Resto, Res);(
% indiceMenor(IndiceMenor,Menor,IndiceSiguiente,Resto,Res))).
%



estacionADistanciaMenor(EstacionInicio,EstacionResultado,Distancia):-
       estaciones_adyacentes(EstacionInicio, ListaAdyacentes),
       estacionMenor(EstacionInicio,ListaAdyacentes,EstacionResultado,Distancia).


% El siguiente predicado regresa la estación adyacente, según la lista
% de estaciones adyacentes que recibe,que está a la menor distancia de
% la estacion dada.
%
% i: Estacion de la que se quiere obtener la estación a menor distancia
% i: Lista de las estaciones adyacentes
% o: Nombre de la estacion con distancia menor adyacente
% o: Distancia a la estacion adyacente
estacionMenor(Inicio,[],Inicio,0):-!.
estacionMenor(Inicio,[A],A, Dist):-
       connectedEdges(Inicio,A,Dist),!.
estacionMenor(Inicio,[Primera|Cola],Estacion,Res):-
       estMenorAux(Inicio,Primera,Cola,Estacion,Res),!.


estMenorAux(EstacionInicial,EstacionMenorActual,[],EstacionMenorActual,Distancia):-
            connectedEdges(EstacionInicial,EstacionMenorActual,Distancia),!.
estMenorAux(EstacionInicial,EstacionMenorActual,[EstacionAPrueba|Resto],Estacion,Res):-
       connectedEdges(EstacionInicial,EstacionMenorActual,J),
       DistanciaActual is J,
       connectedEdges(EstacionInicial, EstacionAPrueba,K),
       DistanciaAComparar is K,
        (   DistanciaActual > DistanciaAComparar ->
        estMenorAux(EstacionInicial,EstacionAPrueba,Resto,Estacion,Res);(
       estMenorAux(EstacionInicial,EstacionMenorActual,Resto,Estacion,Res)
                                )).


elemEnLista(_,[]):-
       fail,!.
elemEnLista(A,[A|_]):-
       !.
elemEnLista(A,[_|Cola]):-
       elemEnLista(A,Cola).



%buscaAmplitud(Inicio,Fin,Res):-
%       reverse(ResParcial,Res),
%       buscaAmplitudAux(Inicio,Fin,Inicio,[Inicio],,ResParcial).
%pat
%buscaAmplitudAux(Inicio,Fin,Actual,Camino,Res



%Metodos de push y pop para una cola representada como lista
sacaDeCola([A|Resto],Resto,A).
agregaACola(Elemento,Cola,NuevaCola):-
       append(Cola,[Elemento],NuevaCola).

agregaAColaDePrioridad(Elemento,Cola,NuevaCola):-
       append(Cola,[Elemento],ColaParcial),
       msort(ColaParcial,NuevaCola).

%Rutas es una lista de listas
transformaRutasADistancia(Rutas,Distancias):-
       transAux(Rutas,[],Distancias).
transAux([],ListaTemp,ListaTemp).
transAux([RutaActual|Resto],ListaTemp,Final):-
       pathLen(RutaActual,DistanciaActual),
       append(ListaTemp,[DistanciaActual],Res),
       transAux(Resto,Res,Final).

%agregaRutasAColaDePrioridad([],Cola,Cola):-!.
agregaRutasAColaDePrioridad(Ruta,Cola,Resultado):-
       append(Cola,[Ruta],ColaParcial),
       ordena(ColaParcial,Resultado).


%tal vez puede servir:   https://stackoverflow.com/questions/28070482/sort-a-list-by-the-second-atom-in-functor

%https://ai.ia.agh.edu.pl/wiki/_media/pl:dydaktyka:pp:prolog-lists-advanced.pdf

%insertion sort
ordena([],[]).
ordena([Cabeza|Cola],Resultado):-
       ordena(Cola,ResP),
       agregaOrden(Cabeza,ResP,Resultado).
%aqui agrega comparando las distancias de las rutas
agregaOrden(Elem,[],[Elem]):-!.
agregaOrden(Elem,[X|Y],[Elem,X|Y]):-
       pathLen(Elem,Res1),
       pathLen(X,Res2),
       Res1<Res2,!.
agregaOrden(Elem,[X|Y],[X|Z]):-
       agregaOrden(Elem,Y,Z),!.

%Consulta para ordenar
%ordena([[barranca_del_muerto,mixcoac,san_antonio,san_pedro],[barranca_del_muerto,mixcoac]],Res).
