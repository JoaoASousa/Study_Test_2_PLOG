:- use_module(library(clpfd)).

p2(L1,L2) :-
    length(L1,N), % <-- L1 e L2 têm o mesmo comprimento (N)
    length(L2,N),
    % <-- falta aqui o domínio das variáveis
    pos(L1,L2,Is),
    all_distinct(Is),
    % <-- falta aqui restrições porque L2 pode não estar ordenada neste ponto, ou seja, mesmo antes das variáveis de domínio serem instanciadas
    % (nem todas as restrições foram colocadas antes da fase de pesquisa)
    labeling([],Is), % <-- instanciamento antes da fase de pesquisa
    test(L2).

% nth1 (Index, List, Element)

% pos gera uma lista com os indexes das posições de cada elemento da 1ª lista na 2ª
pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    nth1(I,L2,X),
    pos(Xs,L2,Is).

% Opção: As variáveis de domínio estão a ser instanciadas antes da fase de pesquisa e nem todas as restrições foram colocadas antes da fase da pesquisa.