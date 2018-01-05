:- use_module(library(lists)).
:- use_module(library(clpfd)).

p1(L1,L2) :-
    gen(L1,L2),
    test(L2).

gen([],[]).
gen(L1,[X|L2]) :-
    select(X,L1,L3),
    gen(L3,L2).

test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 > X3; X1 > X2, X2 < X3),
    test([X2,X3|Xs]).


    testt([_,_]).
    testt([X1,X2,X3|Xs]) :-
        (X1 #< X2, X2 #> X3; X1 #> X2, X2 #< X3),
        testt([X2,X3|Xs]).



    p2(L1,L2) :-
        length(L1,N),
        length(L2,N),
        max_member(Max, L1),
        min_member(Min, L1),
        domain(L2,Min,Max),
        testt(L2),
        all_distinct(L2).
        labeling([],L2).


mygen([],[],1).
mygen(L1,[X|L2],Counter) :-
            select(X,L1,L3),
            NewC is Counter  - 1,
            gen(L3,L2,NewC).




constroi(Nemb,Orcamento,EmbPorObjeto,CustoPorObjeto,EmbUsadas,Objetos):-
  mygen(EmbPorObjeto, L2, 4),
  sumlist(L2, EmbUsadas),
  maximize(EmbUsadas),
