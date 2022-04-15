%specific faptul ca valorile 1,2 si 3 reprezinta
%candidati in formarea unei solutii
candidat(1).
candidat(2).
candidat(3).

%modelul de flux (i,o)
%predicatul care genereaza posibilitatile de aranjare
%a pronosticurilor pentru cele 4 meciuri
%generare_variante(el:integer,rez:list)
%predicat nedeterminist

generare_variante(0, []).
generare_variante(K, [R|Rez]) :-
    K > 0,
    K1 is K - 1,
    candidat(R),
    generare_variante(K1, Rez).

%modelul de flux (i,i)
%predicatul care verifica sa fie indeplinita conditia
%ca o solutie sa fie valida
%predicat determinist
%conditie(L:list,Cnt:int)

conditie([2], _) :- !, false.
conditie(_, 3) :- !, false.
conditie([], _) :- !.
conditie([H|T], Cnt) :-
    H =:= 3,
    !,
    Cnt1 is Cnt + 1,
    conditie(T, Cnt1).
conditie([_|T], Cnt) :-
    conditie(T, Cnt).

%predicat care transforma val 3
%in simbolul X conform cerintei
%model de flux (i,o)

transform([], []).
transform([H|T], ['X'|Rez]) :-
    H =:= 3,
    !,
    transform(T, Rez).
transform([H|T], [H|Rez]) :-
    transform(T, Rez).

main(R) :-
    generare_variante(4, Rez),
    conditie(Rez, 0),
    transform(Rez, R).
