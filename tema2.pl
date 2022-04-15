%punctul a
%predicat determinist
%modelul de flux (i,i,o)
%merge(list,list,list)
%interclasarea a 2 liste
merge(H, [], H) :- !.
merge([], H, H) :- !.
merge([H1|T1], [H2|T2], [H1|Rez]) :-
    H1 < H2,
    merge(T1, [H2|T2], Rez), !.
merge([H1|T1], [H2|T2], [H2|Rez]) :-
    H2 =< H1,
    merge([H1|T1], T2, Rez).

%predicat determinist
%modelul de flux (i,o,o)
%desparte o lista,pune elementele de pe poz pare
%intr-o lista,iar pe cele impare in a 2-a lista
split([], [], []) :- !.
split([A], [A], []) :- !.
split([H1, H2|T], [H1|Rez1], [H2|Rez2]) :-
    split(T, Rez1, Rez2).

%sortarea listei
%modelul de flux (i,o)
%predicat determinist
%mergeSort(list,list)
mergeSort([], []) :- !.
mergeSort([H], [H]) :- !.
mergeSort(L, Rez) :-
    split(L, P1, P2),
    mergeSort(P1, Rez1),
    mergeSort(P2, Rez2),
    merge(Rez1, Rez2, Rez).

%punctul b
%predicat determinist
%model de flux (i,o)
mergeSortb(L,Rez):-is_list(L),
	               split(L,P1,P2),
		       mergeSortb(P1,Rez1),
		       mergeSortb(P2,Rez2),
		       merge(Rez1,Rez2,Rez).
