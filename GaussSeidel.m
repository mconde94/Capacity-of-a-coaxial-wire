function [ f] = GaussSeidel(f, mascara, n, m)
%f matriz com a solucao
%mascara matriz com o relaxamento
%n pontos na direcao x
%m pontos na direcao y
%iteracao GaussSeidel
for i = 2:n
    for j = 2:m
        f(i,j) = f(i,j) + mascara(i,j)* (0.25*( f(i-1,j) + f(i+1,j)+ f(i,j-1) + f(i,j+1)) - f(i,j));
    end
end
% simetria em i-1 i+1
i = 1;
for j = 2:m;
    f(i,j) = f(i,j) + mascara(i,j)* (0.25*( f(i+1,j) + f(i+1,j)+ f(i,j-1) + f(i,j+1)) - f(i,j));
end
% simetria em j-1 j+1
j = 1;
for i = 2:n
    f(i,j) = f(i,j) + mascara(i,j)* (0.25*( f(i-1,j) + f(i+1,j)+ f(i,j+1) + f(i,j+1)) - f(i,j));
end
end

