function [ cap,PotencialEletrico] = capacidade( a,b,c,d,n,tol,rel )
%construcao da grelha
h = 0.5*c/n; %tamanho duma celula
na = round(0.5*a/h); %numero de segmentos em a
x = linspace(0,0.5*c,n+1); %pontos ao longo do eixo dos x's
m = round(0.5*d/h); %numero de segmentos em d
mb = round(0.5*b/h); %numero de segmentos em b
y = linspace(0,0.5*d,m+1); %pontos ao longo do eixo dos y's
%incializar o potencial e máscara de relaxamento
PotencialEletrico = zeros(n+1,m+1); %matriz da solucao
mascara = ones(n+1,m+1)*rel; %matriz da relaxacao
for i = 1:na+1
    for j = 1:mb+1
        mascara(i,j) = 0;
        PotencialEletrico(i,j)= 1;
    end
end
%iteracoes de Gauss Seidel
oldcap = 0;
iter=0;
for iter = 1:20000
    PotencialEletrico = GaussSeidel(PotencialEletrico,mascara,n,m);
    cap = valor(n,m,h,PotencialEletrico);
    if (abs(cap-oldcap)/cap<tol)
        break
    else
        oldcap = cap;
            end
end
disp(iter);
end