# Atividade Avaliativa 02 - Técnicas da Computação Aplicadas a Energia Nuclear

## Questão 1

A equação geral que descreve o problema de transmissão de calor transiente por condução é dada por:

    ρc * ∂T/∂t + ∇ ∙ (−k(T) ∇T) = Q

onde:

ρ é a densidade do material;

c é a capacidade térmica;

T a temperatura;

k é a condutividade térmica e

Q é o termo de geração de calor.

Para uma vareta de combustível de um reator nuclear, com propriedades térmicas constantes, sem dependência na variável espacial ao longo do seu eixo z, a equação acima escrita em coordenadas cilíndricas torna-se:

    ∂²T/∂r² + 1/r * ∂T/∂r + 1/r² * ∂²T/∂φ² + 1/k * Q(r, φ, t) = 1/α * ∂T(r, φ, t)/∂t

onde α = k⁄(ρc) é a difusividade térmica.

Nesta vareta de combustível, adota-se Q = 0 para a região do gap e do revestimento.

Escreva a equação que representa a difusão do calor na direção radial em estado estacionário nas seguintes regiões:

(a) pastilha de combustível;

(b) gap e

(c) revestimento da vareta.

### Respostas

Em estádo estacionário, a variação da temperatura em relação ao tempo é nula, logo:

    ∂T(r, φ, t)/∂t = 0
    
Considerando que o calor se distribui uniformemente de forma cicular na pastilha, a variação de temperatura em relação a φ é nula, logo:

    ∂²T/∂φ² = 0
    
(a) considerando Q uma constante, temos que a equação da difusão de calor na direção radial para a pastilha é:
 
    ∂²T/∂r² + 1/r * ∂T/∂r + Q/k = 0

(b) e (c) considerando Q = 0 para o gap e o revestimento, temos que a equação da difusão de calor na direção radial para ambas regiões é:

    ∂²T/∂r² + 1/r * ∂T/∂r = 0

## Questão 2

Usando as equações descritas na segunda questão:

a) Desenvolva as EDFs que represente numericamente o problema descrito para cada região.

b) Verifique a ordem, consistência e convergência destas equações.

### Respostas

a) EDF da difusão de calor na direção radial para a pastilha:

    ( T[i+1] - 2T[i] + T[i-1] ) / Δr²   +   ( T[i+1] - T[i-1] ) / (Δr * r)   +   Q/k    =    0


EDF da difusão de calor na direção radial para para o gap e o revestimento:

    ( T[i+1] - 2T[i] + T[i-1] ) / Δr²   +   ( T[i+1] - T[i-1] ) / (Δr * r)    =    0
    

b)


## Questão 3

As características de uma vareta combustível de um típico PWR estão apresentadas na tabela abaixo.

Sabendo-se que a densidade de potência linear Q = 430 W/cm, calcule através de métodos numéricos a distribuição do centro do combustível até o raio externo do revestimento.

![Tabela](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd2_tabela.png)

### Respostas

Foi criada uma função na linguagem MATLAB para calcular a temperatura em cada região da vareta, de acordo com os parametros passados. A mesma pode ser encontrada neste [link](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/ftemperatura.m).

Um script também em MATLAB que chama essa função, exibe os valores, e plota o gráfico, pode ser encontrado nesse [link](https://github.com/campagnani/Tecnicas_Computacao_Nuclear/blob/main/atvd2.m).

Para os resultados abaixo, cada região da vareta foi discretizada em 10 pontos.


Região da Pastilha:

Temperatura (°)  | Distância (cm)
---------- | ------
  1900.0   |   0
  1801.9   |   0.0509
  1681.6   |   0.1018
  1543.7   |   0.1527
  1391.6   |   0.2036
  1228.1   |   0.2544
  1055.6   |   0.3035
   875.8   |   0.3562
   690.2   |   0.4071
   500.0   |   0.4580
   

Região do GAP:

Temperatura (°)  | Distância (cm)
----------- | ------
  500.0000  |  0.4580
  467.6593  |  0.4590
  441.7867  |  0.4600
  421.0887  | 0.4610
  404.5303  |  0.4620
  391.2835  |  0.4630
  380.6861  |  0.4640
  372.2082  |  0.4650
  365.4259  |  0.4660
  360.0000  |  0.4670
  

Região do revestimento:

Temperatura (°)  | Distância (cm)
----------- | ------
  360.0000  |  0.4670
  346.1397  |  0.4750
  335.0515  |  0.4830
  326.1809  |  0.4910
  319.0844  |  0.4990
  313.4072  |  0.5070
  308.8655  |  0.5150
  305.2321  |  0.5230
  302.3254  |  0.5310
  300.0000  |  0.5390
  
É possível ver os resultados concatenados no gráfico abaixo:
![Gráfico Temp](https://raw.githubusercontent.com/campagnani/Tecnicas_Computacao_Nuclear/main/imagens/atvd2_grafico_temp.png)
