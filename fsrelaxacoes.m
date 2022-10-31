function solucao = fsrelaxacoes(A,Xinicial,B,omega,epslon,arquivo) %Ax=b
    
    %Verifica propriedades basicas da entrada
    if fverifica(A,Xinicial,B)==1
        return
    end
    
    %Arquivo com histórico de iterações
    fid=fopen(arquivo,'w');
    fprintf(fid, "Variavéis de entrada\n");
    fprintf(fid, "\n\nA:\n");
    fprintf(fid, [repmat('\t%d',1,length(A)),'\n'] ,A);
    fprintf(fid, "\n\nX (inicial):\n");
    fprintf(fid, [repmat('\t%d',1,length(Xinicial)),'\n'] ,Xinicial);
    fprintf(fid, "\n\nB:\n");
    fprintf(fid, [repmat('\t%d',1,length(B)),'\n'] ,B);
    
    %Variaveis auxiliares
    sizeA = size(A);
    X = Xinicial';
    R=zeros(1,5);
    k=0;
    fim=0;
    
    %Inicia iteração até o critério de parada
    fprintf(fid, "\n\n--------------------Iterações-------------------------\n");
    while fim==0
        
        %Iteração k
        k=k+1;
        
        for i = 1:sizeA(1)
            
            fprintf(fid, "\nSomatório 1\n");
            
            %Cálculo da somatoria A*x
            za=0;
            for j = i:sizeA(1)
                
                za = za + A(i,j) * X(k,j);
                
                exib = [k,i,j,A(i,j), X(k,j),za];
                fprintf(fid, [repmat('\t%d',1,length(exib)),'\n'] ,exib);
            end
            
            fprintf(fid, "\nSomatório 2\n");
            %Cálculo da somatoria A*x
            za2=0;
            for j = 1:(i-1)
                
                za2 = za2 + A(i,j) * X(k+1,j);
                
                exib = [k,i,j,A(i,j), X(k+1,j),za2];
                fprintf(fid, [repmat('\t%d',1,length(exib)),'\n'] ,exib);
            end
            
            %Cálculo do resto
            R(k,i) = B(i) - za - za2;
            
            %Cálculo da próxima candidata a solução
            X(k+1,i) = X(k,i) + omega*R(k,i)/A(i,i);
            
            %Exibir iteração
            fprintf(fid, "\nIteração\n" );
            exib = [k,i,R(k,i),X(k,i),X(k+1,i)];
            fprintf(fid, [repmat('\t%d',1,length(exib)),'\n'] ,exib);
        end
        
        %Critério de parada
        delta=zeros(1,5);
        for i=1:sizeA(1)
            delta(i) = abs(X(k+1,i)- X(k,i));
        end
        
        if delta<epslon
            fim=1;
        end
    end
    kRelaxacoes=k
    fprintf(fid, "\n\n--------------------Histórico de X(i)-------------------------\n");
    fprintf(fid, [repmat('\t%d',1,length(X)),'\n'] ,X);
    
    
    fprintf(fid, "\n\n--------------------Solução-------------------------\n");
    [mX,nX] = size(X);
    solucao = X(mX,:);
    fprintf(fid, [repmat('\t%d',1,length(solucao)),'\n'] ,solucao);
end

