conexion(el_rosario, tezozomoc, 1). %rojo
conexion(tezozomoc, azcapotzalco, 1).%rojo
conexion(azcapotzalco, ferreria, 1).%rojo
conexion(ferreria, norte_45, 1).%rojo
conexion(norte_45, vallejo, 1).%rojo
conexion(vallejo,instituto_del_petroleo,1).%rojo
conexion(instituto_del_petroleo, lindavista, 1).%rojo
conexion(lindavista, deportivo_18_de_marzo, 1).%rojo
conexion(deportivo_18_de_marzo, la_villa_basilica, 1).%rojo
conexion(la_villa_basilica, martin_carrera, 1).%rojo

conexion(el_rosario, aquiles_serdan, 1).%naranja
conexion(aquiles_serdan, camarones, 1).%naranja
conexion(camarones, refineria, 1).%naranja
conexion(refineria, tacuba, 1).%naranja
conexion(tacuba, san_joaquin,1).%naranja
conexion(san_joaquin, polanco,1).%naranja
conexion(polanco, auditorio,1).%naranja
conexion(auditorio, constituyentes,1).%naranja
conexion(constituyentes, tacubaya, 1).%naranja
conexion(san_pedro_de_los_pinos,tacubaya,1).%naranja
conexion(san_pedro_de_los_pinos,san_antonio,1).%naranja
conexion(san_antonio, mixcoac,1).%naranja
conexion(mixcoac, barranca_del_muerto,1).%naranja

conexion(politecnico, instituto_del_petroleo,1).%amarilla
conexion(instituto_del_petroleo, autobuses_del_norte,1).%amarilla
conexion(autobuses_del_norte, la_raza,1).%amarilla
conexion(la_raza,misterios,1).%amarilla
conexion(misterios, valle_gomez,1).%amarilla
conexion(valle_gomez, consulado,1).%amarilla
conexion(consulado, eduardo_molina,1).%amarilla
conexion(eduardo_molina, aragon,1).%amarilla
conexion(aragon, oceania, 1).%amarilla
conexion(oceania, terminal_aerea,1).%amarilla
conexion(terminal_aerea, hangares, 1).%amarilla
conexion(hangares, pantitlan,1).%amarilla

conexion(pantitlan, puebla,1).%cafe
conexion(puebla, ciudad_deportiva, 1).%cafe
conexion(ciudad_deportiva, velodromo, 1).%cafe
conexion(velodromo, mixiuhca, 1).%cafe
conexion(mixiuhca, jamaica, 1).%cafe
conexion(jamaica, chabacano, 1).%cafe
conexion(chabacano, lazaro_cardenas, 1).%cafe
conexion(lazaro_cardenas, centro_medico, 1).%cafe
conexion(centro_medico,chilpancingo,1).%cafe
conexion(chilpancingo, patriotismo, 1).%cafe
conexion(patriotismo, tacubaya,1).%cafe

conexion(observatorio, tacubaya,1).%rosa
conexion(tacubaya, juanacatlan,1).%rosa
conexion(juanacatlan,chapultepec,1).%rosa
conexion(chapultepec, sevilla,1).%rosa
conexion(sevilla, insurgentes,1).%rosa
conexion(insurgentes, cuauhtemoc, 1).%rosa
conexion(cuauhtemoc, balderas,1).%rosa
conexion(balderas, salto_del_agua,1).%rosa
conexion(salto_del_agua,isabel_la_catolica,1).%rosa
conexion(isabel_la_catolica, pino_suarez,1).%rosa
conexion(pino_suarez,merced, 1).%rosa
conexion(merced, candelaria,1).%rosa
conexion(candelaria, san_lazaro,1).%rosa
conexion(san_lazaro, moctezuma, 1).%rosa
conexion(moctezuma, balbuena, 1).%rosa
conexion(balbuena,boulevard_puerto_aereo,1).%rosa
conexion(boulevard_puerto_aereo,gomez_farias,1).%rosa
conexion(gomez_farias, zaragoza, 1).%rosa
conexion(zaragoza, pantitlan,1).%rosa

conexion(pantitlan, agricola_oriental,1).%morada
conexion(agricola_oriental, canal_de_san_juan,1).%morada
conexion(canal_de_san_juan,tepalcates,1).%morada
conexion(tepalcates,guelatao,1).%morada
conexion(guelatao, pe�on_viejo,1).%morada
conexion(pe�on_viejo, acatitla, 1).%morada
conexion(acatitla, santa_marta, 1).%morada
conexion(santa_marta, los_reyes,1).%morada
conexion(los_reyes,la_paz,1).%morada






connectedEdges(X,Y) :- conexion(X,Y,_).
connectedEdges(X,Y) :- conexion(Y,X,_).

%Consultas para probar conexiones
%
%connectedEdges(X,barranca_del_muerto),write(X),nl,fail.
%connectedEdges(X,Y),write(X),nl,fail.
%path(tacuba, norte_45,X),write(X), nl, fail.

path(A,B,Path) :-
       travel(A,B,[A],Q),
       reverse(Q,Path).

travel(A,B,P,[B|P]) :-
       connectedEdges(A,B).

travel(A,B,Visited,Path) :-
       connectedEdges(A,C),
       C \== B,
       \+member(C,Visited),
       travel(C,B,[C|Visited],Path).



%F U E N T E:
%https://stackoverflow.com/questions/40072311/directed-graph-in-prolog
%https://en.wikipedia.org/wiki/Negation_as_failure
%http://www.swi-prolog.org/pldoc/man?predicate=findall/3

estaciones_adyacentes(X, Z):-
       findall(Y, connectedEdges(X, Y), Z).
