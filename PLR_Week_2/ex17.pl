:- use_module(library(clpfd)).

% Os automóveis têm a seguinte distribuição de cores: 4 amarelos, 2 verdes, 3 vermelhos e 3 azuis;
% O primeiro e o último automóvel são da mesma cor;
% O segundo e o penúltimo são da mesma cor;
% O quinto automóvel é azul;
%  Todos os conjuntos de três automóveis consecutivos têm três cores distintas;
% Partindo do primeiro automóvel para o último, é possível visualizar a sequência amarelo-verdevermelho-azul uma única vez.
% Qual a cor de cada um dos doze carros parados no semáforo?

ex17(Cars) :-
    % 1 - Yellow
    % 2 - Green
    % 3 - Red
    % 4 - Blue

    Cars = [A,B,C,D,4,F,G,H,I,J,B,A],
    domain(Cars, 1, 4),

    % restringir o numero de ocorrencias de cada cor
    global_cardinality(Cars, [1-4, 2-2, 3-3, 4-3]),

    % subsequencias de 3 com cores diferentes
    subseq(Cars),

    % encontrar sequencia especifica
    find_seq(Cars, 1),

    labeling([], Cars),
    write(Cars).

subseq([_]).
subseq([_, _]).
subseq([X, Y, Z | T]) :-
    all_distinct([X, Y, Z]),
    subseq([Y, Z | T]).


find_seq([_,_,_], 0).
find_seq([Amarelo, Verde, Vermelho, Azul | T], Count) :-
    (Amarelo #= 1 #/\ Verde #= 2 #/\ Vermelho #= 3 #/\ Azul #= 4) #<=> B,
    Count #= Prev_Count + B,
    find_seq([Verde, Vermelho, Azul | T], Prev_Count).

% Output:
% [1,4,3,1,4,2,3,1,2,3,4,1]