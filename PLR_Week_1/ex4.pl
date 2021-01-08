:- use_module(library(clpfd)).

%   C4  C3  C2  C1
%       S   E   N   D
%   +   M   O   R   E
%   M   O   N   E   Y

ex4_a(Vars) :-
    Vars = [S,E,N,D,M,O,R,Y],
    domain(Vars, 0, 9),
    all_distinct(Vars),

    domain([C1, C2, C3, C4], 0, 1),

    S #\= 0,
    M #\= 0,
    D + E #= Y + 10 * C1,
    N + R + C1 #= E + 10 * C2,
    E + O + C2 #= N + 10 * C3,
    S + M + C3 #= O + 10 * C4,
    C4 #= M,

    labeling([], Vars).

% Output:
% Vars = [9,5,6,7,1,0,8,2]



%   C5  C4  C3  C2  C1
%   D   O   N   A   L   D
% + G   E   R   A   L   D
%   R   O   B   E   R   T
ex4_b(Vars) :-
    Vars = [D,O,N,A,L,G,E,R,B,T],
    domain(Vars, 0, 9),
    all_distinct(Vars),

    domain([C1, C2, C3, C4, C5], 0, 1),

    D + D       #= T + 10 * C1,
    L + L + C1  #= R + 10 * C2,
    A + A + C2  #= E + 10 * C3,
    N + R + C3  #= B + 10 * C4,
    O + E + C4  #= O + 10 * C5,
    D + G + C5  #= R,    

    labeling([], Vars).

% Output:
% Vars = [5,2,6,4,8,1,9,7,3,0]



%   C5  C4  C3  C2  C1
%       C   R   O   S   S
% +     R   O   A   D   S
%   D   A   N   G   E   R
ex4_c(Vars) :-
    Vars = [C,R,O,S,A,D,N,G,E],
    domain(Vars, 0, 8),
    all_distinct(Vars),

    domain([C1, C2, C3, C4, C5], 0, 1),

    D #\= 0,
    S + S       #= R + 10 * C1,
    S + D + C1  #= E + 10 * C2,
    O + A + C2  #= G + 10 * C3,
    R + O + C3  #= N + 10 * C4,
    C + R + C4  #= A + 10 * C5,
    D + C5      #= R,   

    labeling([], Vars).

% Output:
% no
% // TODO is this correct?