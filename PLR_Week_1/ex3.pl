:- use_module(library(clpfd)).

%   x   x   x   x
%   x   x   x   x
%   x   x   x   x
%   x   x   x   x

ex3_a(Cols) :-

    Cols = [A1, A2, A3, A4], % A1 é a coluna 1 e o valor de A1 é a linha que tem a rainha
    domain(Cols, 1, 4),
    all_distinct(Cols),

    A1 #\= A2 + 1, % diagonal para baixo
    A1 #\= A2 - 1, % diagonal para cima
    A1 #\= A3 + 2, % diagonal para baixo
    A1 #\= A3 - 2, % diagonal para cima
    A1 #\= A4 + 3, % diagonal para baixo
    A1 #\= A4 - 3, % diagonal para cima

    A2 #\= A3 + 1,
    A2 #\= A3 - 1,
    A2 #\= A4 + 2,
    A2 #\= A4 - 2,

    A3 #\= A4 + 1,
    A3 #\= A4 - 1,

    labeling([], Cols).

% Output:
% Cols = [2,4,1,3] ? ;
% Cols = [3,1,4,2] ? 



ex3_b(N, Cols) :-
    length(Cols, N),
    domain(Cols, 1, N),
    constrain(Cols),
    all_distinct(Cols),
    labeling([], Cols).

constrain([]).
constrain([H|T]) :-
    safe(H, T, 1),
    constrain(T).

safe(_, [], _).
safe(X, [Y | T], K) :-
    noattack(X, Y, K),
    K1 is K + 1,
    safe(X, T, K1).

noattack(X, Y, K) :-
    X #\= Y,
    X + K #\= Y,
    X - K #\= Y. 