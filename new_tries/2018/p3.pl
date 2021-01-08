:- use_module(library(clpfd)).
:- use_module(library(lists)).

prog2(N,M,L1,L2) :-
    length(L1,N),
    N1 is N-1, length(L2,N1),
    domain(L1,1,M),
    domain(L2,1,M),
    check(L1,L2),
    all_distinct(L1), % <-- solução aparently
    labeling([],L1).

check([],[]).
check([A,B|R],[X|Xs]) :-
    A + B #= X,
    check([B|R],Xs).

% ????????????????? não funciona o enunciado???