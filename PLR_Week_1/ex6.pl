:- use_module(library(clpfd)).

ex6(Nums) :-
    Nums = [A, B, C],
    domain(Nums, 1, 1000),

    A + B + C #= A * B * C,

    B #>= A,
    C #>= B,

    labeling([], Nums).

% Output:
% Nums = [1,2,3]