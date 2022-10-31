clear
clc

%A é a matriz coeficientes
A = [
  7 -3  0  0  0;
 -3  7 -3  0  0;
  0 -3  7 -3  0;
  0  0 -3  7 -3;
  0  0  0 -3  7;
  ];

%S matriz vetor fonte
S = [
    10;
    45;
    100;
    45;
    10;
    ];

%Vetor do fluxo inicial (chute)
X = [
    0;
    0;
    0;
    0;
    0;
    ];

%Jacobi
jacobi = fjacobi(A,X,S,0.000001,'atvd1 Jacobi.txt')

%Gauss-Seidel
gseidel = fgseidel(A,X,S,0.000001,'atvd1 Gauss.txt')

%Sobre relaxações
relaxacoes = fsrelaxacoes(A,X,S,1.1,0.000001,'atvd1 relaxacoes.txt')