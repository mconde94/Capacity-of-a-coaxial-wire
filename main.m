clc;
clear all;
a=1;
b=1;
c=2;
d=2;
n=[10 50 100 500 1000];
H = 0.5*c./n;
rel=2-pi./n;
tol=1.0e-9;
Capacidades=[];
PotencialEletrico=[];
x=[];
y=[];
for i=1:length(n);
    N=n(i);
    Rel=rel(i);
    [cap,PotencialEletrico]=capacidade( a,b,c,d,N,tol,Rel);
    Capacidades=[Capacidades cap];
    x=linspace(0,a/2,n(i)+1);
    y=linspace(0,b/2,n(i)+1);
    x1=linspace(0,a/2,n(i));
    y1=linspace(0,b/2,n(i));
end
figure;
subplot(2,1,1);
h=surf(x,y,PotencialEletrico);
set(h,'LineStyle','none');
title('Potencial elétrico num quarto do fio');
xlabel('X (m)')
ylabel('Y(m)')
zlabel('Potencial eléctrico (V)')
subplot(2,1,2);
delta=H(length(H));
[Ex,Ey]=gradient(PotencialEletrico,delta,delta);
Ex=-Ex;
Ey=-Ey;
CampoEletrico=sqrt(Ex.^2+Ey.^2);
g=surf(x,y,CampoEletrico);
set(g,'LineStyle','none');
title('Campo elétrico num quarto do fio');
xlabel('X (m)')
ylabel('Y(m)')
zlabel('Campo eléctrico (Vm⁻¹)')
grau=1:10;
CapacidadeAssintotica=[];
for j=1:length(grau);
    p= polyfit(H,Capacidades,grau(j));
    CapacidadeAssintotica=[CapacidadeAssintotica p(grau(j)+1)];
end
CapacidadeAssintotica;
valorCapacidade=CapacidadeAssintotica(length(CapacidadeAssintotica));
disp('Capacidade de (pFm⁻¹)');
disp(valorCapacidade)