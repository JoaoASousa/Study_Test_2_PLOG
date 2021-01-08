:- use_module(library(clpfd)).

p1(L1, L2) :-
    gen(L1, L2),
    test(L2).

% gen gera 2 listas com os mesmos elementos em ordem diferente
gen([], []).
gen(L1, [X|L2]) :-
    select(X, L1, L3), % L3 = L1, tirando o X
    gen(L3, L2).


% test vê se a lista está ordenada (ou crescente ou decrescente)
test([_,_]).
test([X1,X2,X3|Xs]) :-
    (X1 < X2, X2 < X3; X1 > X2, X2 > X3),
    test([X2,X3|Xs]).

% eficiência reduzida devido à aleatoriedade da lista gerada que pode implicar backtrackings possivelmente infinitos até uma lista ordenada ter sido gerada.