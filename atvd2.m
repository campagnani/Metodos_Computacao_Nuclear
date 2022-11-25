clear
clc

figure()
hold on

          %ftemperatura(r,Tc,Te,k,Q,pontos)
          
[T1,R1] = ftemperatura(0.458,1900,500,0.024,430,10);
plot(R1,T1)
[T1,R1]

[T2,R2] = ftemperatura(0.467-0.458,500,360,0.020,0,10);
plot(R2+0.458,T2)
[T2,R2+0.458]

[T3,R3] = ftemperatura(0.539-0.467,360,300,0.1070,0,10);
plot(R3+0.467,T3)
[T3,R3+0.467]
