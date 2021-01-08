:- use_module(library(lists)).
:- use_module(library(between)).

prog1(N,M,L1,L2) :-
    length(L1,N),
    N1 is N-1, length(L2,N1), % L2 tem tamanho 1 menor que L1
    findall(E,between(1,M,E),LE),
    fill(L1,LE,LE_),
    fill(L2,LE_,_),
    check(L1,L2).

fill([],LEf,LEf).
fill([X|Xs],LE,LEf) :-
    select(X,LE,LE_), % select(Element, List1, List2) -> List2 is List1 but without an occurrence of Element
    fill(Xs,LE_,LEf).

% sucede quando as listas são da forma [X1, X2, X3,...], [Y1, Y2,...] sendo Y1 = X1 + X2 e Y2 = X2 + X3 (lista Y com menos 1 elemento)
check([_],[]).
check([A,B|R],[X|Xs]) :-
    A+B =:= X,
    check([B|R],Xs).

% O programa gera 2 listas, L1 e L2, tendo L1 tamanho N e L2 tamanho N-1.
% Cada elemento de cada uma das listas tem valor compreendido entre [1,M], sendo estas preenchidas recorrendo ao predicado fill.
% A soma do valor de cada par consecutivo de elementos de L1 é igual ao valor do elemento de L2 respetivo, sendo isto verificado recorrendo ao predicado check. Por exemplo:
% L1 = [1,2,3,4], L2 = [3,5,7] (3 = 1+2; 5 = 2+3; 7 = 3+4)
