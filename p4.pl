:-use_module(library(clpfd)).

build(Budget, NPacks, ObjectCosts, ObjectPacks, Objects, UsedPacks) :-

    length(Objects, 3),

    length(ObjectCosts, ObjectCostsLength),

    domain(Objects, 1, ObjectCostsLength),

    all_distinct(Objects),

    idSum(Objects, ObjectCosts, TotalCost),
    idSum(Objects, ObjectPacks, UsedPacks),

    TotalCost #=< Budget,
    UsedPacks #=< NPacks,

    labeling([maximize(UsedPacks)], Objects).

idSum([], _, 0).
idSum([ObjectsH | ObjectsT], ObjectCosts, TotalCost) :-
    idSum(ObjectsT, ObjectCosts, TotalCost1),
    element(ObjectsH, ObjectCosts, Cost),
    TotalCost #= TotalCost1 + Cost.