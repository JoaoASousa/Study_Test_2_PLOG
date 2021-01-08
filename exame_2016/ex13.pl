:- use_module(library(clpfd)).

concelho('x', 120, 410).
concelho('y', 10, 800).
concelho('z', 543, 2387).
concelho('w', 3, 38).
concelho('k', 234, 376).

% concelhos(+NDias,+MaxDist,-ConcelhosVisitados,-DistTotal,-TotalEleitores)
concelhos(NDias, MaxDist, ConcelhosVisitados, DistTotal, TotalEleitores) :-

    length(ConcelhosVisitados, NDias),

    domain(ConcelhosVisitados, 1, NDias),

    getConcelhos(NDias, MaxDist, ConcelhosVisitados, DistTotal, TotalEleitores),
    MaxDist #>= DistTotal,

    labeling([], ConcelhosVisitados).


getConcelhos(_, _, [], 0, 0).
getConcelhos(NDias, MaxDist, [ConcelhoH | ConcelhosT], DistTotal, TotalEleitores) :-
    getConcelhos(NDias1, MaxDist, ConcelhosT, DistTemp, TotalEleitoresTemp),
    NDias1 #=> 0,
    NDias #= NDias1 + 1,

    concelho(ConcelhoH, ConcDist, ConcEleit),
    DistTotal #= DistTemp + ConcDist,
    TotalEleitores #= TotalEleitoresTemp + ConcEleit.


% Dont know how to do it :p but I think my try was decent I guess... I hope...



