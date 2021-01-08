:- use_module(library(clpfd)).

% build(+Budget,+NPacks,+ObjectCosts,+ObjectPacks,-Objects,-UsedPacks)
build(Budget, NPacks, ObjectCosts, ObjectPacks, Objects, UsedPacks) :-

    length(Objects, 3),

    length(ObjectPacks, ObjectPacksLength),

    domain(Objects, 1, ObjectPacksLength),

    all_distinct(Objects),

    idSum(Objects, ObjectCosts, TotalCost),
    idSum(Objects, ObjectPacks, UsedPacks),

    Budget #>= TotalCost,
    NPacks #>= UsedPacks,


    labeling([maximize(UsedPacks)], Objects).

idSum([], _, 0).
idSum([Object | ObjectT], ObjectCosts, TotalCost) :-
    idSum(ObjectT, ObjectCosts, Temp),
    element(Object, ObjectCosts, Cost),
    TotalCost #= Temp + Cost.
