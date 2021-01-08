:- use_module(library(clpfd)).

gym_pairs(MenHeights, WomenHeights, Delta, Pairs) :-

    length(MenHeights, Length),
    length(WomenHeights, Length),
    length(Pairs, Length),

    append(MenIndex, WomenIndex, Vars),

    length(MenIndex, Length),
    length(WomenIndex, Length),

    all_distinct(MenIndex),
    all_distinct(WomenIndex),

    add_restrictions(MenHeights, WomenHeights, Delta, MenIndex, WomenIndex),

    labeling([], Vars),

    createPairs(MenIndex, WomenIndex, Pairs).

add_restrictions(_, _, _, [], []).
add_restrictions(MenHeights, WomenHeights, Delta, [MenIndex | MenIndexT], [WomenIndex | WomenIndexT]) :-
    element(MenIndex, MenHeights, ManHeight),
    element(WomenIndex, WomenHeights, WomanHeight),
    (ManHeight #>= WomanHeight) #/\ (WomanHeight + Delta #>= ManHeight),

    add_restrictions(MenHeights, WomenHeights, Delta, MenIndexT, WomenIndexT).

createPairs([], [], []).
createPairs([M | MT], [W | WT], [M-W | T]) :-
    createPairs(MT, WT, T).