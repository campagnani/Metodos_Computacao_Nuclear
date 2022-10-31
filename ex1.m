clear
clc

%A é a matriz coeficientes
A = [
   4 -1  0  1  0;
  -1  4 -1  0  1;
   0 -1  4 -1  0;
   1  0 -1  4 -1;
   0  1  0 -1  4;
  ];

%S é a matriz vetor fonte
S = [
    100;
    100;
    100;
    100;
    100;
    ];

%X é o vetor do fluxo inicial (chute)
X = [
    0;
    0;
    0;
    0;
    0;
    ];

%Jacobi
jacobi = fjacobi(A,X,S,0.000001,'ex1 Jacobi.txt')

%Gauss-Seidel
gseidel = fgseidel(A,X,S,0.000001,'ex1 Gauss.txt')

%Sobre relaxações
relaxacoes = fsrelaxacoes(A,X,S,1.1,0.000001,'ex1 relaxacoes.txt')
