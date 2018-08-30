:-dynamic antes_de/2.

antes_de(ayer, hoy).
antes_de(hoy, maniana).

main:-
    not(antes_de(ayer, maniana)), write("uno"), nl,
    assert((antes_de(X,Y):-antes_de(X,Z), antes_de(Z,Y))),
    write("dos"), nl,
    antes_de(ayer, maniana), write("tres"),nl,!.
