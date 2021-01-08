:- use_module(library(clpfd)).

% test1(_Val, [], 0).
% test1(Val, [H|T], C) :-
%     (Val #= H) #<=> B,
%     C1 #= C - B,
%     test1(Val, T, C1).

% alternativa 

test1(_Val, [], 0).
test1(Val, [H|T], C) :-
    test1(Val, T, C1),
    (Val #= H) #<=> B,
    C #= C1 + B.
    