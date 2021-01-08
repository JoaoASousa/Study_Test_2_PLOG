:- use_module(library(clpfd)).

p2(L1,L2) :-
    length(L1,N),
    length(L2,N),
    %
    pos(L1,L2,Is),
    all_distinct(Is),
    %
    test(L2),
    labeling([],Is).

pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    element(I,L2,X),
    pos(Xs,L2,Is).

test([]).
test([_]).
test([_,_]).
test([X1,X2,X3|Xs]) :-
    ( (X1 #< X2) #/\ (X2 #> X3) ) #\/ ( (X1 #> X2) #/\ (X2 < X3) ),
    test(Xs).