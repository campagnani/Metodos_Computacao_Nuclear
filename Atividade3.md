# Atividade Avaliativa 03 - Técnicas da Computação Aplicadas a Energia Nuclear

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

### Resposta

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


### Resposta

## Questão 3

Um meio infinito é constituído de um material uniforme não multiplicador que possui uma fonte linear isotrópica situada em geometria cilíndrica localizada em r = 0. Desenvolva uma EDF que poderá ser empregada para uma solução numérica, verifique a ordem, convergência e consistência desta equação.

### Resposta

## Questão 4

A Equação de Helmholtz para o núcleo de um reator de placa infinita com espessura finita é expressa por:
```
φ(x)''  +  B_g^2*φ(x)  =  0
```
onde φ(x) é o fluxo de nêutrons para um grupo de energia e B_g é o buckling geométrico.

(a) Desenvolva uma EDF que poderá ser empregada para uma solução numérica.

(b) Utilize a EDF expressa em (a) para calcular a distribuição do fluxo e verifique a ordem, convergência e consistência desta equação.

### Resposta
