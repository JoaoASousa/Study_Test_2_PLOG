:- use_module(library(clpfd)).

pres(N, K, Vars) :-
    length(Vars, N),
    domain(Vars, 1, K),
    %
    indices(1, Vars),
    %
    labeling([], Vars).

indices(I, [V|Vs]) :-
    V mod 2 #\= I mod 2,
    I1 is I + 1,
    indices(I1, Vs).
indices(_, []).

% O programa gera uma lista com N elementos cujos valores estão compreendidos nos intervalo [1,K] e possuem paridade diferente ao índice respetivo, ou seja, o elemento de índice 1 será par, o de índice 2 será ímpar, o de índice 3 será par e assim sucessivamente.