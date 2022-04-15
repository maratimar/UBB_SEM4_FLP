%el=integer
%list=el*

%punctul a problema 15

lungime(list).

%predicat determinist
%list este o lista cu elemente intregi

lungime([]) :- true.
lungime([_, _|T]):- lungime(T).
%punctul b problema 15
%min(el,el,el)
%modelul de flux (i,i,o)
%predicat determinist

min(A,B,A):- A<B.
min(A,B,B):- B<A.

%minim(list,el)
%modelul de flux (i,o)
%list-lista,el-int
%predicat determinist

minim([H|T],H):- T=[], !.
minim([H|T],M):- minim(T,M), min(H,M,M).

%elimin(list,list)
%modelul de flux (i,o)
%list-lista
%predicat determinist

elimin([],[]).
elimin([H|T],[]):- T=[],!.
elimin([H|T],T):- minim(T,M), H=<M, !.
elimin([H|T],[H,L]):- elimin(T,L).

