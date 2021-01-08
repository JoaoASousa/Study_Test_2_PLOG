%
% Variáveis de decisão: lista cujo elemento com índice i indica o compartimento em que o respetivo objeto vai ficar. 
% Domínios: 1 a N, ou seja, o número de compartimentos.
% Ou seja, usando a 1ª solução do exemplo imediatamente anterior, no compartimento 1 vão ficar os objetos de índice 2 e 5, no compartimento 3 vão ficar os objetos de índice 1 e 3 e no compartimento 4 os objetos de índice 4 e 6.
%
% Usando a soma dos volumes dos objetos cujas variáveis são iguais é possível impôr a restrição relativa à capacidade do compartimento, não permitindo que esta soma a exceda.
% Por último, existe a restrição relativa ao peso, que implica que uma prateleira não poderá ter objetos cujo peso conjunto exceda o dos do compartimento imediatamente abaixo, recorrendo para isso a uma lista com os pesos totais de cada compartimento, restringindo esse valor a ser inferior ao que está N indices anteriormente, assumindo N como o número de compartimentos por linha no armário.