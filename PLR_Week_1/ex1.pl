:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- use_module(library(between)).

% a)
ex1(Vars) :-

    %   1   2   3
    %   4   5   6
    %   7   8   9

    Vars = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
    domain(Vars, 1, 9),
    all_distinct(Vars),

    % Lines
    A1 + A2 + A3 #= Soma,
    A4 + A5 + A6 #= Soma,
    A7 + A8 + A9 #= Soma,

    % Columns
    A1 + A4 + A7 #= Soma,
    A2 + A5 + A8 #= Soma,
    A3 + A6 + A9 #= Soma,

    %   1   5   9   -> 15
    %   6   7   2   -> 15
    %   8   3   4   -> 15
    %   |   |   |
    %   v   v   v
    %  15  15   15

    % Diagonals
    A1 + A5 + A9 #= Soma,
    A3 + A5 + A7 #= Soma,

    A1 #< A2,
    % A1 #< A3,
    A1 #< A4,
    A2 #< A4,

    labeling([], Vars).

    % Output Without the (last 4) simetry constraints
    % Vars = [2,7,6,9,5,1,4,3,8] ? ;
    % Vars = [2,9,4,7,5,3,6,1,8] ? ;
    % Vars = [4,3,8,9,5,1,2,7,6] ? ;
    % Vars = [4,9,2,3,5,7,8,1,6] ? ;
    % Vars = [6,1,8,7,5,3,2,9,4] ? ;
    % Vars = [6,7,2,1,5,9,8,3,4] ? ;
    % Vars = [8,1,6,3,5,7,4,9,2] ? ;
    % Vars = [8,3,4,1,5,9,6,7,2] ? ;

    % Output With the (last 4) simetry constraints
    % Vars = [2,7,6,9,5,1,4,3,8] ? ;


ex1_b(N, Vars) :-
    N2 is N * N,

    % Variables
    length(Vars, N2),

    % Domain
    domain(Vars, 1, N2),
    make_rows(N, Vars, Rows),

    % Constraints
    Soma is (N2+1)*N//2,
    all_distinct(Vars),
    write(Rows),
    sumsLine(Rows, Soma),

    transpose(Rows, Cols),
    write(Cols),
    sumsLine(Cols, Soma),

    diagonals(Rows, Diagonals),
    sumsLine(Diagonals, Soma),

    % Labeling
    labeling([], Vars).


sumsLine([], _).
sumsLine([Row | RowT], Soma) :-
    sum(Row, #=, Soma),
    sumsLine(RowT, Soma).

    
diagonals(Rows, [Diag1, Diag2]) :-
    length(Rows, N),
    findall(B, (between(1, N, I), nth1(I, Rows, Row), nth1(I, Row, B)), Diag1),
    findall(B, (between(1, N, I), nth1(I, Rows, Row), J is N + 1 - I, nth1(J, Row, B)), Diag2).


% make_rows(+N, +Vars, -Rows)
make_rows(N, Vars, Rows) :-
    length(Rows, N),
    make_rows(Vars, [], 1, N, Rows).

% make_rows(Vars, CurRow, Counter, +N, -Rows)
make_rows([], _, _, _, []).

make_rows([VarsH | VarsT], CurRow, N, N, [NewCurrRow | RowsT]) :-
    append(CurRow, [VarsH], NewCurrRow),
    make_rows(VarsT, [], 1, N, RowsT).

make_rows([VarsH | VarsT], CurRow, Counter, N, Rows) :-
    append(CurRow, [VarsH], NewCurrRow),
    Counter2 is Counter + 1,
    make_rows(VarsT, NewCurrRow, Counter2, N, Rows).
