function Y = convolution(kernel,data)

m=length(kernel);
n=length(data);

%zero padding, deixar ambos os vetores do mesmo tamanho
X=[kernel,zeros(1,m)]
H=[data,zeros(1,n)]

    for i=1:n+m-1 % tamanho final do vetor de saida n+m-1 ou 2*length(X)-1
        Y(i)=0; % inicia com zero o elemento i do vetor de saida.
        for j=1:length(H)
            if(i-j+1>0) % posiao nao pode ser menor ou igual a zero
                Y(i)=Y(i)+X(j)*H(i-j+1); %computa a convolucao
            else
            end
        end
    end
    
endfunction
