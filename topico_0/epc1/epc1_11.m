function [a,b] = epc1_11(list1,list2)

  if length(list1) >= length(list2),
    %list2 eh a menor
    b = resize(list2, length(list1))(1:1,:);
    a = list1;
  else
   b = list2;
   a = resize(list1,length(list2))(1:1,:);
  endif
endfunction
