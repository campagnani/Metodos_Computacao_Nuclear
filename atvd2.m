clear
clc

% Dados do Problema

r  = 0.458;     %Raio
Tc = 1900;      %Temperatura Centro
Te = 500;       %Temperatura Externa
k  = 0.024;     %Condutividade Térmica
Q  = 430;       %Potencia

% Refinamento da malha

pontos = 5;         %Pontos internos de refinamento da malha
dr = r/(pontos+1);  %Calculo de Δr
tm = pontos + 2;    %Tamanho da matriz

% Matriz

A = zeros(tm,tm);
A(1,1)   = Tc;
A(tm,tm) = Te;


%( T[i+1] - 2T[i] + T[i-1] ) / dr^2   +   ( T[i+1] - T[i-1] ) / (dr * r)   +   Q/k    =    0

%T[i+1]/dr^2 - 2T[i]/dr^2 + T[i-1]/dr^2   +   T[i+1]/(dr*r) - T[i-1]/(dr*r)   +   Q/k    =    0

%T[i+1]/dr^2 + T[i+1]/(dr*r) - 2T[i]/dr^2 + T[i-1]/dr^2 - T[i-1]/(dr*r)   +   Q/k    =    0

A(1  ,1+1) =  1/dr^2 + 1/(dr*r);
A(tm,tm-1) =  1/dr^2 - 1/(dr*r);

for i = 2:tm-1
    A(i,i+1) =  1/dr^2 + 1/(dr*r);
    A(i,i)   = -2/dr^2;
    A(i,i-1) =  1/dr^2 - 1/(dr*r);
end

A










