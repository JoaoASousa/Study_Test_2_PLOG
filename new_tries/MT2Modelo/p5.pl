:- use_module(library(clpfd)).

% corta(+Pranchas,+Prateleiras,-PranchasSelecionadas)
corta(Pranchas, Prateleiras, PranchasSelecionadas) :-

    length(Pranchas, PranchasLength),
    length(Prateleiras, PrateleirasLength),
    length(PranchasSelecionadas, PrateleirasLength),

    domain(PranchasSelecionadas, 1, PranchasLength),

    getTasks(PranchasSelecionadas, Prateleiras, Tasks),
    getMachines(1, Pranchas, Machines),

    cumulatives(Tasks, Machines, [bound(upper)]),
    labeling([], PranchasSelecionadas).


getTasks([], [], []).
getTasks([PranchasSelecionada | PranchasSelecionadasT], [Prateleira | PrateleirasT], [Task | TasksT]) :-
    Task = task(0, 1, 1, Prateleira, PranchasSelecionada),
    getTasks(PranchasSelecionadasT, PrateleirasT, TasksT).

getMachines(_, [], []).
getMachines(N, [Prancha | PranchasT], [Machine | MachinesT]) :-
    Machine = machine(N, Prancha),
    N1 is N + 1,
    getMachines(N1, PranchasT, MachinesT).

% corta([100, 45, 70], [12,50,14,8,10,90,24], S).