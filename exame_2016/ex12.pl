:- use_module(library(clpfd)).

% ups_and_downs(+Min,+Max,+N,-L)
ups_and_downs(Min, Max, N, L) :-

    length(L, N),   % Length of generated List is N
    domain(L, Min, Max),
    ensureOscillations(L),
    labeling([], L).

ensureOscillations([_]).
ensureOscillations([_, _]).
ensureOscillations([X1, X2, X3 | T]) :-
    ( (X1 #> X2) #/\ (X2 #< X3) ) #\/ ( (X1 #< X2) #/\ (X2 #> X3) ),
    ensureOscillations([X2, X3 | T]).
