:- use_module(library(clpfd)).

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
    TasksH = task(0, 1, 1, PresentesH, RolosSelecionadosH),
    getTasks(PresentesT, RolosSelecionadosT, TasksT).

getMachines(_, [], []).
getMachines(N, [RolosH | RolosT], [MachinesH | MachinesT]) :-
    MachinesH = machine(N, RolosH),
    N1 is N + 1,
    getMachines(N1, RolosT, MachinesT).


% embrulha([100,45,70], [12,50,14,8,10,90,24], S).

% Output:
% S = [2,3,3,2,1,1,2] ? ; 
% S = [3,3,2,3,1,1,2] ? ;
% no