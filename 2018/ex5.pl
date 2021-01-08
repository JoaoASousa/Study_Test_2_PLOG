:- use_module(library(clpfd)).
:- use_module(library(lists)).

% optimal_skating_pairs(+MenHeights,+WomenHeights,+Delta,-Pairs)
optimal_skating_pairs(MenHeights, WomenHeights, Delta, Pairs) :-

    length(MenHeights, MLength),
    length(WomenHeights, HLength),
    minimum(MinLength, [MLength, HLength]), % find the minimum length between the 2 groups

    getPairs(MenHeights, WomenHeights, Delta, Pairs, 0, Length, MinLength),
    sortPairs(Pairs),

    maplist(man_value, Pairs, MenPairs),
    all_distinct(MenPairs),


    maplist(woman_value, Pairs, WomenPairs),
    all_distinct(WomenPairs),

    append(MenPairs, WomenPairs, All),
    labeling([maximize(Length)], All).

getPairs(_, _, _, [], Length, Length, Length).
getPairs(MenHeights, WomenHeights, Delta, [Pair | PairsT], N, Length, MaxLength) :-
    MaxLength #> N,

    element(MIndex, MenHeights, MHeight),
    element(HIndex, WomenHeights, WHeight),

    MHeight #>= WHeight,
    MHeight #=< WHeight + 10,

    Pair = MIndex-HIndex,
    N1 is N + 1,

    getPairs(MenHeights, WomenHeights, Delta, PairsT, N1, Length, MaxLength).

getPairs(_, _, _, [], Length, Length, MaxLength) :- MaxLength #> Length.

sortPairs([_]).
sortPairs([M1-_W1, M2-W2 | T]) :-
    M1 #< M2,
    sortPairs([M2-W2 | T]).

man_value(M-_W, M).
woman_value(_M-W, W).

% | ?- optimal_skating_pairs([95,78,67,84],[65,83,75,80],10,Pairs).
% Pairs = [2-3,3-1,4-2]
% | ?- optimal_skating_pairs([95,78,67,84,65,90,77],[65,83,75,80],10,Pairs).
% Pairs = [4-4,5-1,6-2,7-3]
% | ?- optimal_skating_pairs([65,83,75,80],[95,78,67,84,65,90,77],10,Pairs).
% Pairs = [1-5,2-2,3-3,4-7]
% | ?- optimal_skating_pairs([95,78,67,84,65,90,77],[55,83,75,80],10,Pairs).
% Pairs = [4-4,6-2,7-3]
% | ?- optimal_skating_pairs([55,83,75,80],[95,78,67,84,65,90,77],10,Pairs).
% Pairs = [2-2,3-3,4-7]