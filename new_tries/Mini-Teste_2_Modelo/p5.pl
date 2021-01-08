:- use_module(library(clpfd)).

% embrulha(+Rolos,+Presentes,-RolosSelecionados)
embrulha(Rolos, Presentes, RolosSelecionados) :-

    length(Rolos, RolosLength),
    length(Presentes, PresentesLength),
    length(RolosSelecionados, PresentesLength),

    domain(RolosSelecionados, 1, RolosLength),

    getTasks(RolosSelecionados, Presentes, Tasks),
    getMachines(1, Rolos, Machines),

    cumulatives(Tasks, Machines, [bound(upper)]),
    labeling([], RolosSelecionados).

getTasks([], [], []).
getTasks([RoloSelecionado | RolosSelecionadosT], [Presente | PresenteT], [Task | TasksT]) :-
    Task = task(0, 1, 1, Presente, RoloSelecionado),
    getTasks(RolosSelecionadosT, PresenteT, TasksT).

getMachines(_N, [], []).
getMachines(N, [Rolo | RolosT], [Machine | MachinesT]) :-
    Machine = machine(N, Rolo),
    N1 is N + 1,
    getMachines(N1, RolosT, MachinesT).

% embrulha([100,45,70], [12,50,14,8,10,90,24], S).