:- use_module(library(clpfd)).
:- use_module(library(lists)).

ex2(Zebra, Water) :-

    Color = [Yellow, Red, Blue, Green, White],
    Drink = [Milk, Coffee, Tea, OranJuice, Water],
    Nacio = [Por, Nor, Spa, Eng, Ucr],
    Smoke = [Che, Win, LS, SG, Mar],
    Animal = [Fox, Dog, Iguan, Horse, Zebra],

    append([Nacio, Animal, Drink, Color, Smoke], List),

    domain(List, 1, 5),
    all_distinct(Color),
    all_distinct(Drink),
    all_distinct(Nacio),
    all_distinct(Smoke),
    all_distinct(Animal),

    Eng #= Red,
    Spa #= Dog,
    Nor #= 1,
    Yellow #= Mar,
    abs(Che - Fox) #= 1,
    abs(Nor - Blue) #= 1,
    Win #= Iguan,
    LS #= OranJuice,
    Ucr #= Tea,
    Por #= SG,
    abs(Mar - Horse) #= 1,
    Green #= Coffee,
    Green #= White + 1,
    Milk #= 3,

    labeling([], List),
    write(List), nl.

    % Output:
    % Zebra = 5, Water = 1