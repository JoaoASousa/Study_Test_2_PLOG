:- use_module(library(clpfd)).
:- use_module(library(lists)).


objeto(piano, 3, 30).
objeto(cadeira, 1, 10).
objeto(cama, 3, 15).
objeto(mesa, 2, 15).
homens(4).
tempo_max(60).

furniture :-
    tempo_max(TempoMax),
    homens(NHomens),

    findall(Object, objeto(Object,_,_), Objects),
    findall(NecessaryPeople, objeto(_,NecessaryPeople,_), NecessaryPeoples),
    findall(Duration, objeto(_,_,Duration), Durations),

    write(Durations),

    length(Objects, ObjectsLength),
    length(StartingTimes, ObjectsLength),
    length(EndingTimes, ObjectsLength),

    domain(StartingTimes, 1, TempoMax),
    domain(EndingTimes, 1, TempoMax),
    
    getTasks(Durations, StartingTimes, EndingTimes, NecessaryPeoples, 1, [], Tasks),

    maximum(LastEnding, EndingTimes),
    LastEnding #< TempoMax,

    cumulative(Tasks, [limit(NHomens)]),
    append(StartingTimes, EndingTimes, Vars),
    labeling([minimize(LastEnding)], Vars),
    write(LastEnding), nl,
    write(StartingTimes).

getTasks([], [], [], [], _, Tasks, Tasks).
getTasks([DH | DT], [SH | ST], [EH | ET], [People | PeopleT], TaskCounter, [Task | TasksT]) :-
    Task = task(SH, DH, EH, People, TaskCounter),
    Counter1 is TaskCounter + 1,
    getTasks(DT, ST, ET, PeopleT, Counter1, TasksT).