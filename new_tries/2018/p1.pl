:- use_module(library(lists)).
:- use_module(library(between)).

prog1(N,M,L1,L2) :-
    length(L1,N),
    N1 is N-1, length(L2,N1),
    findall(E,between(1,M,E),LE),
    fill(L1,LE,LE_),
    fill(L2,LE_,_),
    check(L1,L2).

fill([],LEf,LEf).
fill([X|Xs],LE,LEf) :-
    select(X,LE,LE_),
    fill(Xs,LE_,LEf).
    check([_],[]).

check([A,B|R],[X|Xs]) :-
    A+B =:= X,
    check([B|R],Xs).

% O programa gera, recorrendo ao predicado fill, 2 listas sendo L2 com tamanho menor em 1 elemento que a lista L1, estando os valores dos elementos de cada uma das listas compreendidos no intervalo [1,M].
% verificando se o valor da soma de cada par de elementos consecutivos da lista L1 é igual ao respetivo elemento na 2ª lista, ou seja, por exemplo, L1 = [1,2,3,4,5] e L2 = [3,5,7,9] faria com que o predicado check sucedesse uma vez que 1+2=3, 2+3=5, 3+4=7 e 4+5=9.