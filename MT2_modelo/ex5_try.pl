:-use_module(library(clpfd)).

% embrulha(+Rolos,+Presentes,-RolosSelecionados)
embrulha(Rolos, Presentes, RolosSelecionados) :-

    length(Rolos, NRolos),
    length(Presentes, NPresentes),
    length(RolosSelecionados, NPresentes),

    domain(RolosSelecionados, 1, NRolos),

    getTasks(Presentes, RolosSelecionados, Tasks),
    getMachines(1, Rolos, Machines),

    cumulatives(Tasks, Machines, [bound(upper)]),
    labeling([], RolosSelecionados).

getTasks([], [], []).
getTasks([PresentesH | PresentesT], [RolosSelecionadosH | RolosSelecionadosT], [TasksH | TasksT]) :-
    TaskH = task(0, 1, 1, PresentesH, RolosSelecionadosH),
    getTasks(PresentesT, RolosSelecionadosT, TasksT).

getMachines(_, [], []).
getMachines(N, [RolosH | RolosT], [MachinesH | MachinesT]) :-
    MachinesH = machine(N, RolosH),
    N1 is N + 1,
    getMachines(N1, RolosT, MachinesT).