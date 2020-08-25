clc
clear


a = 1;
n = 0;
while (a != 0)
    a = 1/2^++n;
end;

printf("n = %d\n",n);

for i = 0:n+10
    c = 2^i;
    if(c == Inf)
        printf("i = %d\n",i)
        break
    end;
end;


q = 1;

while((1+(1/2^q))!= 1)
    q++;
end;

printf("q = %d\n",q)
