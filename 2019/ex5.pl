:- use_module(library(clpfd)).

constroi_binarias(I, K, Vars, [LBin|LBins]) :-
    I =< K, !,
    constroi_bins(I, Vars, LBin),
    I1 is I + 1,
    constroi_binarias(I1, K, Vars, LBins).
constroi_binarias(_, _, _, []).

constroi_bins(_, [], []).
constroi_bins(I, [Var | VarT], [LBin | LBinT]) :-
    I #= Var #<=> LBin,
    constroi_bins(I, VarT, LBinT).