:-use_module(library(clpfd)).

autocarros(Grupos, Autocarros, IDsAutocarros, NAutocarrosUsados) :-

    length(Grupos, GruposLength),
    length(IDsAutocarros, GruposLength),
    length(Autocarros, AutocarrosLength),

    domain(IDsAutocarros, 1, AutocarrosLength),

    getTasks(Grupos, IDsAutocarros, Tasks),
    getMachines(1, Autocarros, Machines),

    cumulatives(Tasks, Machines, [bound(upper)]),

    labeling([], IDsAutocarros).

getTasks([], [], []).
getTasks([GruposH | GruposT], [IDsAutocarrosH | IDsAutocarrosT], [TasksH | TasksT]) :-
    TasksH = task(0,1,1,GruposH,IDsAutocarrosH),
    getTasks(GruposT,IDsAutocarrosT,TasksT).


getMachines(_, [], []).
getMachines(N, [AutocarroH | AutocarroT], [MachinesH | MachinesT]) :-
    MachinesH = machine(N, AutocarroH),
    N1 is N + 1,
    getMachines(N1, AutocarroT, MachinesT).

