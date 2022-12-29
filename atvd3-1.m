clear
clc

%Dados
D        = 1.0; %cm
Sigma_a  = 1.0; % cm–1
vSigma_f = 10.8; % cm–1
dx = 1/4;

a = - ( 2 + (Sigma_a * dx^2) / D);

b = - ( dx^2 / D) * vSigma_f;


M = [
    a 1 0;
    1 a 1;
    0 1 a;
    ];

F = [
    b 0 0;
    0 b 0;
    0 0 b;
    ];

% Chute inicial
k=1;

phi = [
    1;
    1;
    1;
    ];

S = F*phi;

i=1;

err=0.00001; %Erro máximo (criterio de parada)

while 1
    i = i + 1;
    
    S(:,i) = F * phi(:,i-1);
    
    k(i) = ( S(:,i)' ) / ( (S(:,i-1)') / k(i-1) );
    
    phi(:,i) = inv(M) * S(:,i-1) / k(i-1);
    
    %Condição de parada
    if i>2 &&  (  abs(k(i) - k(i-1)) < err  )  &&  (  abs(S(1,i) - S(1,i-1)) < err  )  &&  (  abs(S(2,i) - S(2,i-1)) < err  )  &&  (  abs(S(3,i) - S(3,i-1)) < err  )
        break;
    end
end
