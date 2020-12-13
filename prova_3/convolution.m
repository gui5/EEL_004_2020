function Y = convolution(x,h)

m=length(x);
n=length(h);
X=[x,zeros(1,n)];%zero padding 
H=[h,zeros(1,m)]; %zero padding 

for i=1:n+m-1
  Y(i)=0;
  for j=1:m
    if(i-j+1>0)
      Y(i)=Y(i)+X(j)*H(i-j+1);
    endif
  end
end

endfunction
