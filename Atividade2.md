# Técnicas da Computação Aplicadas a Energia Nuclear

## Atividade Avaliativa 02

### Questão 1

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


### Questão 2

Usando as equações descritas na segunda questão:

a) Desenvolva as EDFs que represente numericamente o problema descrito para cada região.

b) Verifique a ordem, consistência e convergência destas equações.



### Questão 3

As características de uma vareta combustível de um típico PWR estão apresentadas na tabela abaixo.

Sabendo-se que a densidade de potência linear Q = 430 W/cm, calcule através de métodos numéricos a distribuição do centro do combustível até o raio externo do revestimento.
