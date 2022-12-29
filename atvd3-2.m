close all
clear
clc

% Dados

D   = 1.0; 

Sigma_a = 2.5 * 10^-4;

L = sqrt(D/Sigma_a);

S_0 = 1.0 * 10^-3;

r_f = L/100;

i_total = 10;

d_r = r_f/i_total;

r_i = d_r;


%% Solução analitica

for i = 1:i_total
    
    r(i) = i*d_r;
    phi_r(i,1) = S_0/(4*pi*r(i)*D) * exp(-r(i)/L);
    
end

phi_r

%% Equação a diferença finita


% Matriz A

A = zeros(i_total,i_total);

r = d_r;

N =  r/d_r;

b = -2 - d_r^2/L^2;

c =  1 - 1/N;

A(1,1) = b;
A(1,2) = c;

for i = 2:i_total-1
    
    r(i) = i * d_r;
    
    N(i) =  r(i)/d_r;

    a(i) =  1 + 1/N(i);

    b(i) = -2 - d_r^2/L^2;

    c(i) =  1 - 1/N(i);
    
    A(i,i-1) =  a(i);
    A(i,i)   =  b(i);
    A(i,i+1) =  c(i);
end

r(i+1) = (i+1) * d_r;
N(i+1) =  r(i)/d_r;
a(i+1) =  1 + 1/N(i+1);
b(i+1) = -2 - d_r^2/L^2;
A(i+1,i) = a(i+1);
A(i+1,i+1) = b(i+1);

nulo = zeros(i_total,1);
phi_r2 = inv(A)*nulo
%phi_r2 = fjacobi(A,nulo,nulo,0.00001,'atvd3-2.txt')


%% Grafico

hold on
plot(r ,phi_r )
plot(r, phi_r2)
