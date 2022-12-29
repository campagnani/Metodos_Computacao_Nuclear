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
k=1

phi = [
    1;
    1;
    1;
    ];

S_a = F*phi %S anterior


for i=1:100 %Correto é usar while
    S = F*phi
    
    k = S/S_a/k
    
    phi = inv(M)*S_a/k
    
    S_a = S
end
