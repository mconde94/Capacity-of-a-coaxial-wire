function [ cap ] = valor(n, m, h, matrizPotencial)
%n numero de pontos em x
%m numero de pontos em y
%h tamanho da celula
%f grelha com o potencial
q = 0;
%integracao sobre as duas fronteiras
for i = 1:n
    q = q + (matrizPotencial(i,m)+matrizPotencial(i+1,m))/(2);
end
for j = 1:m
    q = q + (matrizPotencial(n,j)+matrizPotencial(n,j+1))/(2);
end
cap=4*q*8.8541878176;
end