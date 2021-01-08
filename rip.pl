:- use_module(library(clpfd)).

% cut(+Shelves,+Boards,-SelectedBoards)
cut(Shelves, Boards, SelectedBoards) :-

    % length of result constraint
    length(Shelves, N_shelves),
    length(SelectedBoards, N_shelves),

    % possible values
    length(Boards, N_boards),
    domain(SelectedBoards, 1, N_boards),

