:- use_module(library(clpfd)).
:- use_module(library(lists)).

ex1(Maquinista) :-
    Nome = [Ferreita, Rocha, Silva, SrFerreira, SrRocha, SrSilva],
    Cidade = [Detroit, DetChi, Chicago],
    Profissao = [Revisor, Foguista, Maquinista, Pass1, Pass2, Pass3],
    Ordenado = [DezMil],


    append([Nome, Cidade, Profissao, Ordenado], List),
    domain(List, 1, 6),
    all_distinct(Nome),
    all_distinct(Cidade),
    all_distinct(Profissao),
    all_distinct(Ordenado),

    Pass1 #= SrFerreira,
    Pass2 #= SrRocha,
    Pass3 #= SrSilva,
    SrRocha #= Detroit,
    Revisor #= DetChi,
    SrFerreira #= DezMil,
    Silva #\= Foguista,
    
    ( (Pass1 #= Chicago) #/\ (Pass1 #= ) ) #\/ (Pass2 #= Chicago)


    % últimas 2 frases : /
    % // TODO :(((((

    labeling([], List),
    write(List), nl.
