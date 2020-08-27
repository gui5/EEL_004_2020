
clear
clc
x = [121 145 167 192 206]
y = (3 .* x) - 4

s1 = sum(y)

s2 = (3*sum(x)) - 4

if s1 == s2,
  printf("sum(y) is equals to 3sum(x)-4\n")
else
  printf("sum(y) is not equals to 3sum(x)-4\n")
 endif
