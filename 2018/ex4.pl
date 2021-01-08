:- use_module(library(clpfd)).


% gym_pairs(+MenHeights,+WomenHeights,+Delta,-Pairs)
gym_pairs(MenHeights, WomenHeights, Delta, Pairs) :-

    length(MenHeights, Length),
    length(WomenHeights, Length),
    length(Pairs, Length),
    
    getPairs(MenHeights, WomenHeights, Delta, Pairs),
    sortPairs(Pairs),

    maplist(man_value, Pairs, MenPairs),
    all_distinct(MenPairs),

    write(MenPairs),

    maplist(woman_value, Pairs, WomenPairs),
    all_distinct(WomenPairs),

    write(WomenPairs),

    append(MenPairs, WomenPairs, All),
    labeling([], All).


man_value(M-_W, M).
woman_value(_M-W, W).

getPairs(_, _, _, []).
getPairs(MenHeights, WomenHeights, Delta, [Pair | PairT]) :-
    element(Man, MenHeights, MHeight),
    element(Woman, WomenHeights, WHeight),

    MHeight #>= WHeight,
    MHeight #=< Delta + WHeight,

    Pair = Man-Woman,
    write(Pair), nl,

    getPairs(MenHeights, WomenHeights, Delta, PairT).

sortPairs([_]).
sortPairs([M1-_, M2-W2 | T]) :-
    M1 #< M2,
    sortPairs([M2-W2 | T]).


% | ?- gym_pairs([95,78,67,84],[65,83,75,80],10,Pairs).
% no

% | ?- gym_pairs([95,78,67,84],[65,83,75,86],10,Pairs).
% Pairs = [1-4,2-3,3-1,4-2] ? ;
% no

% | ?- gym_pairs([95,78,67,84],[65,77,75,86],10,Pairs).
% Pairs = [1-4,2-2,3-1,4-3] ? ;
% Pairs = [1-4,2-3,3-1,4-2] ? ;
% no