# Atividade Avaliativa 03 - Técnicas da Computação Aplicadas a Energia Nuclear


<div id='indice'/>

*******
Indice das respostas:
 1. [Questão 1](#q1)
 2. [Questão 2](#q2)
 3. [Questão 3](#q3)
 4. [Questão 4](#q4)

*******

## Questão 1

Sabe-se que o fluxo monoenergético em um meio homogêneo, unidimensional pode ser aproximado através da seguinte Equação de Diferença Finita (EDF):
```
φ[i-1] + a*φ[i] + φ[i+1] = φ[i]*b/k
```
onde:
```
a = - (2 + Σ_a*d_x^2/D)

b = - d_x^2/D*ν*Σ_f
```
Considerando
```
D   =  1,0 cm

Σ_a  =  1,0 cm–1

ν*Σ_f = 10,8 cm–1
```
como constantes em todo intervalo [0,1], assumindo fluxo nulo em x=0 e x=1 e fazendo ∆x =1/4, determine a distribuição do fluxo e o fator de multiplicação (k).


<div id='q1'/>

### Resposta [(Voltar ao indice)](#indice)

Conforme apostila da disciplina, tem que ser desenvolvido um algoritimo para solucionar esse problema conforme essa estrutura:

![Print apostila](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-1.1.png)

O código desenvolvido se encontra abaixo.

[Código](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/atvd3-1.m)

O resultado convergiu após 4 interações.

Interação 1 (chute inicial)

```
k = 1

φ =
1
1	
1	

S =
-0.675000000000000
-0.675000000000000
-0.675000000000000
```

Interação 2

```
S =
-0.675000000000000
-0.675000000000000
-0.675000000000000

k = 1

φ = 
0.917157712305026
1.21663778162912
0.917157712305026
```

Interação 3
```
S = 
-0.619081455805893
-0.821230502599653
-0.619081455805893

k = 1.01698440207972

φ =
0.917157712305026
1.21663778162912
0.917157712305026
```

Interação 4
```
S =
-0.619081455805893
-0.821230502599653
-0.619081455805893
            
k =
1.01698440207972

φ =
0.915320411266228
1.27910601694825
0.915320411266228
```


#### Resposta final

Distribuição de fluxo:
```
φ(1) = 0.915320411266228
φ(2) = 1.27910601694825
φ(3) = 0.915320411266228
```

Fator de mutiplicação k:
```
k = 1.01698440207972
```

## Questão 2

Um meio infinito é constituído de um material uniforme não multiplicador e possui uma fonte pontual de nêutrons. Como é de conhecimento, o fluxo de nêutrons ϕ em função da distância (r) neste meio pode ser calculado através da seguinte equação:
```
φ(r) = S_0/(4*π*r*D) * e^(-r/L)
```
onde, S_0 é a taxa do fluxo em r = 0, D é o coeficiente de difusão do meio e L é o comprimento de difusão. Conforme estudado, a distribuição do fluxo de nêutrons neste meio também pode ser calculada através de EDF, utilizando, por exemplo:
```
a*φ[i+1] + b*φ[i] + c*φ[i-1] = 0
```
onde
```
a =  1 + 1/N

b = -2 - d_r^2/L^2

c =  1 - 1/N

N =  r/d_r
```

Então, considerando a simetria do fluxo em relação à fonte, 
```
D   = 1,0 cm 

Σ_a = 2,5 x 10–4 cm–1

S_0 = 1,0 x 10–3 nêutrons * cm–2 * s–1
```
(a) Calcule a distribuição do fluxo usando método numérico através da EDF.

(b) Calcule a distribuição do fluxo usando a solução analítica expressa pela equação analítica.

(c) Plote a distribuição obtida em (a) e (b) e compare com a solução analítica.


<div id='q2'/>

### Resposta [(Voltar ao indice)](#indice)

[Código](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/atvd3-2.m)

As respostas abaixo são dadas a partir da distribuição do fluxo (φ) em função da distância (r).

(a) Cálculo pelo método EDF:
```
            φ_edf          |          r         
    -----------------------|--------------------     
    0.000628486036364513   |   0.063245553203367
    0.000626278088036362   |   0.126491106406735
    0.000619655495608086   |   0.189736659610103
    0.000606411240234777   |   0.252982212813470
    0.000584338289827583   |   0.316227766016838
    0.000551229594639654   |   0.379473319220206
    0.000504878082852066   |   0.442718872423573
    0.000443076656159714   |   0.505964425626941
    0.000363618185357153   |   0.569209978830308
    0.000264295505924411   |   0.632455532033676
```

(b) Cálculo pelo método analítico.
```
         φ_analítico       |          r         
    -----------------------|--------------------     
    0.001256972701215060   |   0.063245553203367
    0.000627858178395378   |   0.126491106406735
    0.000418153756027636   |   0.189736659610103
    0.000313301858459109   |   0.252982212813470
    0.000250390970559500   |   0.316227766016838
    0.000208450587285587   |   0.379473319220206
    0.000178493349333310   |   0.442718872423573
    0.000156025577050796   |   0.505964425626941
    0.000138550781742699   |   0.569209978830308
    0.000124571070191935   |   0.632455532033676
```

(c) Gráfico comparando o método EDF com anaítico:

![Gráfico](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-2.png)


## Questão 3

Um meio infinito é constituído de um material uniforme não multiplicador que possui uma fonte linear isotrópica situada em geometria cilíndrica localizada em r = 0. Desenvolva uma EDF que poderá ser empregada para uma solução numérica, verifique a ordem, convergência e consistência desta equação.


<div id='q3'/>

### Resposta [(Voltar ao indice)](#indice)

As respostas dessa questão foram escritas no formato LaTeX, e podem ser acessadas neste [link](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/atvd3-3.tex), ou também pode ser vistas através das imagens abaixo.

Desenvolvimento da EDF: 

![Equações em imagem](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-3.png)

Ordem, convergência e consistência desta equação:

![Equações em imagem](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-3.2.png)

Conforme descrito na apostila "Pode-se assumir que, se uma aproximação de diferença finita de uma equação diferencial elíptica é uma aproximação consistente, então o método de diferenças finitas é convergente". Portanto, como a EDF é consistente, ela também será convergente.

E também conforme descrito na apostila "A ordem de uma aproximação diferença finita de uma equação diferencial parcial é a taxa na qual o erro da solução da diferença finita tende a zero à medida que os espaçamentos se aproximam de zero". Pela Eq. (13) é possível verificar-se que a EDF é de segunda ordem.

## Questão 4

A Equação de Helmholtz para o núcleo de um reator de placa infinita com espessura finita é expressa por:
```
φ(x)''  +  B_g^2*φ(x)  =  0
```
onde φ(x) é o fluxo de nêutrons para um grupo de energia e B_g é o buckling geométrico.

(a) Desenvolva uma EDF que poderá ser empregada para uma solução numérica.

(b) Verifique a ordem, convergência e consistência desta equação.


<div id='q4'/>

### Resposta [(Voltar ao indice)](#indice)

As respostas dessa questão foram escritas no formato LaTeX, e podem ser acessadas neste [link](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/atvd3-4.tex), ou também pode ser vistas através das imagens abaixo.

(a) Desenvolvimento da EDF

![Desenvolvimento](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-4.png)

(b) Demostração da consistência, convergencia e da ordem.

![Demonstração](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd3-4.2.png)

Conforme descrito na apostila "Pode-se assumir que, se uma aproximação de diferença finita de uma equação diferencial elíptica é uma aproximação consistente, então o método de diferenças finitas é convergente". Portanto, como a EDF é consistente, ela também será convergente.

E também conforme descrito na apostila "A ordem de uma aproximação diferença finita de uma equação diferencial parcial é a taxa na qual o erro da solução da diferença finita tende a zero à medida que os espaçamentos se aproximam de zero". Pela Eq. (13) é possível verificar-se que a EDF é de segunda ordem.
