pres(N, K, Vars) :-
    length(Vars, N),    % N -> nºpresentes
    domain(Vars, 1, K), % K -> nºpessoas
    %
    indices(1, Vars),
    %
    labeling([], Vars).

indices(I, [V|Vs]) :-
    V mod 2 #\= I mod 2, % paridade dos índices dos presentes é diferente da dos índices das pessoas
    I1 is I + 1, % elementos da lista são alternadamente ímpares e pares
    indices(I1, Vs).
indices(_, []).

% o programa obtém soluções em que a paridade dos índices dos presentes e pessoas é diferente.