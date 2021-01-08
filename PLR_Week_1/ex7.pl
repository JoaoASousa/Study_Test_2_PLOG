:- use_module(library(clpfd)).

ex7(Peru) :-

    Peru = [A, B, P],

    A in 1..9, B in 1..9,

    P * 72 #= A * 1000 + 670 + B,

    labeling([], Peru),
    write(P).

% Output:
% 51
% Peru = [3,2,51]