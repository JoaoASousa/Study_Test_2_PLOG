:- use_module(library(clpfd)).

% cut(+Shelves,+Boards,-SelectedBoards)
cut(Shelves, Boards, SelectedBoards) :-

    length(Shelves, NShelves),
    length(Boards, NBoards),
    length(SelectedBoards, NShelves),

    domain(SelectedBoards, 1, NBoards),

    getTasks(Shelves, SelectedBoards, Tasks),
    getMachines(1, Boards, Machines),

    cumulatives(Tasks, Machines, [bound(upper)]),
    labeling([], SelectedBoards).

getTasks([], [], []).
getTasks([ShelvesH | ShelvesT], [SelectedBoardsH | SelectedBoardsT], [Task | TasksT]) :-
    Task = task(0, 1, 1, ShelvesH, SelectedBoardsH),
    getTasks(ShelvesT, SelectedBoardsT, TasksT).

getMachines(_N, [], []).
getMachines(N, [BoardH | BoardT], [Machine | MachinesT]) :-
    Machine = machine(N, BoardH),
    N1 is N + 1,
    getMachines(N1, BoardT, MachinesT).

% cut([12,50,14,8,10,90,24], [100,45,70], S).

% Output:
% S = [2,3,3,2,1,1,2] ? ;
% S = [3,3,2,3,1,1,2] ? ;
% no