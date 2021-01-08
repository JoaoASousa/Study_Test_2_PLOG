:- use_module(library(clpfd)).

% receitas(+NOvos,+TempoMax,+OvosPorReceita,+TempoPorReceita,-OvosUsados,-Receitas)
receitas(NOvos, TempoMax, OvosPorReceita, TempoPorReceita, OvosUsados, Receitas) :-

    length(Receitas, 4),

    length(OvosPorReceita, OvosPorReceitaLength),
    
    domain(Receitas, 1, OvosPorReceitaLength),


    all_distinct(Receitas),

    % getRecipes(OvosPorReceita, TempoPorReceita, 1, OvosUsados, Receitas, TempoTotal),
    idSum(Receitas, OvosPorReceita, OvosUsados),
    idSum(Receitas, TempoPorReceita, TempoTotal),

    OvosUsados #=< NOvos,
    TempoTotal #=< TempoMax,

    labeling([maximize(OvosUsados)], Receitas).

% getRecipes([], [], _, _, [], _).
% getRecipes(OvosPorReceitaList, [TempoPorReceita | TempoPorReceitaT], Counter, OvosUsados, [Counter | ReceitasT], TempoTotal) :-
%     OvosUsados #= OvosUsados2 + OvosPorReceita,
%     TempoTotal #= TempoTotal2 + TempoPorReceita,
%     Counter2 is Counter + 1,
%     element(Counter, OvosPorReceitaList, OvosPorReceita),

%     getRecipes(OvosPorReceitaList, TempoPorReceitaT, Counter2, OvosUsados2, ReceitasT, TempoTotal2).

idSum([], _, 0).
idSum([Receita | ReceitasT], OvosPorReceita, OvosUsados) :-
    idSum(ReceitasT, OvosPorReceita, OvosUsados1),
    element(Receita, OvosPorReceita, Ovos),
    OvosUsados #= OvosUsados1 + Ovos.




% receitas(30, 100, [6,4,12,20,6],[20,50,10,20,15], OvosUsados, Receitas).