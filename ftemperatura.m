function [T,R] = ftemperatura(r,Tc,Te,k,Q,pontos)

    %r      Raio
    %Tc 	Temperatura Centro
    %Te 	Temperatura Externa
    %k  	Condutividade Térmica
    %Q      Potencia
    %pontos Pontos de refinamento da malha

    % Refinamento da malha
    dr = r/(pontos-1);  %Calculo de Δr
    tm = pontos-2;    %Tamanho da matriz

    %Coeficientes
    %( T[i+1] - 2T[i] + T[i-1] ) / dr^2   +   ( T[i+1] - T[i-1] ) / (dr * r)   +   Q/k    =    0
    %T[i+1]/dr^2 - 2T[i]/dr^2 + T[i-1]/dr^2   +   T[i+1]/(dr*r) - T[i-1]/(dr*r)   +   Q/k    =    0
    %T[i+1]/dr^2 + T[i+1]/(dr*r) - 2T[i]/dr^2 + T[i-1]/dr^2 - T[i-1]/(dr*r)   +   Q/k    =    0

    a =  1/dr^2 - 1/(dr*r);
    b = -2/dr^2;
    c =  1/dr^2 + 1/(dr*r);
    d =  Q/k;

    % Matriz
    A = zeros(tm,tm);
    A(1,1) = b;
    A(1,2) = c;

    for i = 2:tm-1
        A(i,i-1) =  a;
        A(i,i)   =  b;
        A(i,i+1) =  c;
    end

    A(i+1,i) = a;
    A(i+1,i+1) = b;

    B    = zeros(tm,1);
    B(1) = -Tc*a -d;

    for i = 2:tm-1
        B(i) =  -d;
    end

    B(i+1) = -Te*c -d;

    T = inv(A)*B;
    T = [Tc;T;Te];
    
    R = zeros(tm,1);
    for i = 2:tm+2
        R(i) =  dr*(i-1);
    end

end
