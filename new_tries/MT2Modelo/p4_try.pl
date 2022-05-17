:-use_module(library(clpfd)).

% receitas(+NOvos,+TempoMax,+OvosPorReceita,+TempoPorReceita,-OvosUsados,-Receitas)
receitas(NOvos, TempoMax, OvosPorReceita, TempoPorReceita, OvosUsados, Receitas) :-

    length(Receitas, 4),

    length(OvosPorReceita, OvosPorReceitaLength),

    domain(Receitas, 1, OvosPorReceitaLength),

    all_distinct(Receitas),

    idSum(Receitas, OvosPorReceita, OvosUsados),
    idSum(Receitas, TempoPorReceita, TempoTotal),

    OvosUsados #=< NOvos,
    TempoTotal #=< TempoMax,

    labeling([maximize(OvosUsados)], Receitas).

idSum([], _, 0).
idSum([Receita | ReceitasT], OvosPorReceita, OvosUsados) :-
    idSum(ReceitasT, OvosPorReceita, OvosUsados1),
    element(Receita, OvosPorReceita, Ovos),
    OvosUsados #= OvosUsados1 + Ovos.