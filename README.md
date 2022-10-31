# Atividade 1 - Métodos de Computação Aplicados a Engenharia Nuclear

## Enunciado
1. Qual é a condição para que os métodos de iteração possam ser empregados em sistemas de equações lineares. Explique e dê exemplos.

2. Desenvolva algoritmos para solução de sistema de equações lineares os quais empregam métodos iterativos de Jacobi, Gauss-Seidel e Sobre relaxações sucessivas.

3. O fluxo de nêutrons para cinco pontos em um meio homogêneo, unidimensional e monoenergético é calculado através da seguinte equação matricial A*Ф=S onde A é a matriz coeficientes, Ф é a matriz vetor do fluxo a ser determinado e S matriz vetor fonte.
Suponha que um determinado sistema nuclear:

    A = [
  
    7 -3  0  0  0;
  
    -3  7 -3  0  0;
 
    0 -3  7 -3  0;
  
    0  0 -3  7 -3;
  
    0  0  0 -3  7;
  
    ];


    S = [

    10;
    
    45;
    
    100;
    
    45;
    
    10;
    
    ];

Considerando tais valores, e usando os algoritmos desenvolvidos na segunda questão, determine os valores das componentes da matriz S através do Método:
(a) Jacobi;
(b) Gauss-Seidel; e
(c) Sobre relaxações sucessivas.

## Respostas

1) A condição é a matriz de coeficientes ter a diagonal dominante, ou seja, o módulo dos termos pertencentes a diagonal ser maior que o módulo dos outros termos da matriz.

2a) [Código Jacobi](https://github.com/campagnani/Metodos_Computacao_Nuclear/blob/main/fjacobi.m)

2b) [Código Gauss-Seidel](https://github.com/campagnani/Metodos_Computacao_Nuclear/blob/main/fgseidel.m)

2c) [Código Sobre relaxações sucessivas](https://github.com/campagnani/Metodos_Computacao_Nuclear/blob/main/fsrelaxacoes.m)

3) [Código Principal](https://github.com/campagnani/Metodos_Computacao_Nuclear/blob/main/atvd1.m)

Tabelas de iterações:

3a) [Jacobi](https://raw.githubusercontent.com/campagnani/Metodos_Computacao_Nuclear/main/atvd1-jacobi.txt)

3b) [Gauss-Seidel](https://raw.githubusercontent.com/campagnani/Metodos_Computacao_Nuclear/main/atvd1-gauss.txt)

3c) [Sobre relaxações sucessivas](https://raw.githubusercontent.com/campagnani/Metodos_Computacao_Nuclear/main/atvd1-relaxacoes.txt)
