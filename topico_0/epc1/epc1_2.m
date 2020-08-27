
function ret = ecp1_2(x)
 if nargin != 1,
    error("no arguments passed!")
  end;
  
  if isvector(x),
    ret = [];
   for i= 1:length(x),
     if any(ret==x(i)) == 0,
       ret = [ret x(i)];
     end;
   end;
  else
    error("epc1_2(vector)")
  end;
endfunction

