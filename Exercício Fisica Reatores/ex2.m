clear
clc

%Dados
D        =  1.0;   %cm
Sigma_a  =  1.0;   %cm–1
vSigma_f =  10.8;  %cm–1
x        =  1;     %cm
dx       =  1/6;   %cm

%Formulas
N        =  x/dx;
a1       = -D/dx^2;
a2       = a1;
b        = 2*D/dx^2 + Sigma_a;

%Matriz
M = [
      b  a2   0   0   0;
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
err = 0.001; %Erro máximo (criterio de parada)

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














