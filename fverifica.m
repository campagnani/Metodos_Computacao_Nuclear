function erro = fverifica(A,X,B) %Ax=b
    
    erro = 0;
    
    [mA, nA] = size(A);
    [mX, nX] = size(X);
    [mB, nB] = size(B);
    
    if (mA ~= nA)
        disp("Erro! Matriz A precisa ser quadrada.")
        disp(["mA: ", mA])
        disp(["nA: ", nA])
        erro = 1;
    end
    
    if (nX ~= 1)
        disp("Erro! Matriz X precisa ser vetor coluna.")
        disp(["nX: ", nX])
        erro = 1;
    end
    
    if (nB ~= 1)
        disp("Erro! Matriz S precisa ser vetor coluna.")
        disp(["nS: ", nB])
        erro = 1;
    end
    
    if (mA ~= mX)
        disp("Erro! A quantidade de colunas de X precisa ser a mesma de A.")
        disp(["mA: ", mA])
        disp(["mX: ", mX])
        erro = 1;
    end
    
    if (mA ~= mB)
        disp("Erro! A quantidade de colunas de S precisa ser a mesma de A.")
        disp(["mA: ", mA])
        disp(["mS: ", mB])
        erro = 1;
    end
end

