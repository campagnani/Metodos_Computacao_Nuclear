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
