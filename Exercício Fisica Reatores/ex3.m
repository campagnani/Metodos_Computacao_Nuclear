clear
clc

%Dados
dens     = 14.4*6.022*10^23/239.05;  %densidade
D        = 1/(3*dens*6.8*10^-24);    %cm
Sigma_a  = dens*(0.26+1.85)*10^-24;  %cm–1
vSigma_f = 2.98*dens*1.85*10^-24;    %cm–1
r = 7.5159;%cm
N = 5;

%Formulas
dr = r/N;
a1 =  -D/dr^2 * (1 - 1/(2*N));
a2 =  -D/dr^2 * (1 + 1/(2*N));
b  = 2*D/dr^2 + Sigma_a;

%Matriz
M = [
      b  (a1+a2)    0   0   0;
     a1   b  a2   0   0;
      0  a1   b  a2   0;
      0   0  a1   b  a2;
      0   0   0  a1   b;
      ];
%Inversa da matriz
inv_M = inv(M);


% Chute inicial
k=1;
S = [
    1;
    1;
    1;
    1;
    1;
    ];


%Calculo de Phi a partir do chute inicial
phi = inv_M * S / k;

%Dados para loop
i   = 1;     %Variavel auxiliar 1
e   = 2;     %Variavel auxiliar 2
err = 0.005; %Erro máximo (criterio de parada)

%loop
while 1
    i = i + 1; %Primeiro phi já foi calculado, loop começa na segunda interação

    S(:,i) = vSigma_f * phi(:,i-1); %Calcule S
    
    k(i) = k(i-1) * ( S(1,i) + S(2,i) + S(3,i) + S(4,i) + S(5,i) ) / ( S(1,i-1) + S(2,i-1) + S(3,i-1) + S(4,i-1) + S(5,i-1) ); %Calcule K
    
    phi(:,i) = inv_M * S(:,i-1) / k(i-1); %Calcule phi
    
    %Condição de parada
    if (i>2 &&  (  abs(k(i) - k(i-e)) < err  )  &&  (  abs(S(1,i) - S(1,i-e)) < err  )  &&  (  abs(S(2,i) - S(2,i-e)) < err  )  &&  (  abs(S(3,i) - S(3,i-e)) < err  ))
        break;
    end
end

phi

k














