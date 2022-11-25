clear
clc


          %ftemperatura(r,Tc,Te,k,Q,pontos)
          
[T1,R1] = ftemperatura(0.458,1900,500,0.024,430,20);
plot(R1,T1)
hold on

[T2,R2] = ftemperatura(0.467-0.458,500,360,0.020,0,20);
plot(R2+0.458,T2)

[T3,R3] = ftemperatura(0.539-0.467,360,300,0.1070,0,20);
plot(R3+0.467,T3)
