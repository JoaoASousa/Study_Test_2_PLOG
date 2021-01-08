:- use_module(library(clpfd)).

% constroi(+NEmb, +Orcamento, +EmbPorObjeto, +CustoPorObjeto, -EmbUsadas, -Objetos)

constroi(NEmb, Orcamento, EmbPorObjeto, CustoPorObjeto, EmbUsadas, Objetos) :-

    % Variables
    length(Objetos, 4),

    % Domain
    length(EmbPorObjeto, N), % get length of avaliable objects to be done
    domain(Objetos, 1, N), % set it as the max value of the list of used packets

    % Constraints
    all_distinct(Objetos),
    idSum(Objetos, EmbPorObjeto, EmbUsadas),
    idSum(Objetos, CustoPorObjeto, CustoTotal),

    EmbUsadas #=< NEmb,
    CustoTotal #=< Orcamento,

    % Labeling
    labeling([maximize(EmbUsadas)], Objetos).

% element(?X, +List, ?Y) -> X-ésimo elemento de List é Y

idSum([], _, 0).
idSum([ObjH | ObjT], CustoPorObjeto, CustoTotal) :-
    idSum(ObjT, CustoPorObjeto, CustoTotal1),
    element(ObjH, CustoPorObjeto, Custo),
    CustoTotal #= CustoTotal1 + Custo.



% constroi(30, 100, [6,4,12,20,6], [20,50,10,20,15], EmbUsadas, Objetos).
% constroi(50, 100, [6,4,12,20,6], [20,50,10,20,15], EmbUsadas, Objetos).