:- use_module(library(clpfd)).

ex7(Cars) :-
    % 1 - Yellow
    % 2 - Green
    % 3 - Blue
    % 4 - Black

    % Cars = [A, B, C, D],
    length(Cars, 4),        % <-- alternativa para não ter de criar a lista
    domain(Cars, 1, 4),
    all_distinct(Cars),

    % Size = [S1, S2, S3, S4],
    length(Size, 4),        % <-- alternativa para não ter de criar a lista
    domain(Size, 1, 4),
    all_distinct(Size),

    element(Verde, Size, 1), % verde é o menor
    element(Verde, Cars, 2), % cor verde

    element(Azul, Cars, 3), % cor azul
    Verde #> Azul,          % verde depois do azul

    element(Amarelo, Cars, 1), % cor amarela
    element(Preto, Cars, 4),   % cor amarela
    Amarelo #> Preto,          % amarelo depois do preto

    PreAzul #= Azul - 1,
    PosAzul #= Azul + 1,

    element(PreAzul, Size, PreAzulSize),
    element(PosAzul, Size, PosAzulSize),

    PreAzulSize #< PosAzulSize, % o antes do azul é menor que o depois

    labeling([], Cars).

% Output:
% Cars = [4,3,1,2]
% ou seja, é o Preto (4) que está em primeiro