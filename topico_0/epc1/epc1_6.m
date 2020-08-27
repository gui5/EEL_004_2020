%function resp= myfun(N)
%resp = 2*N^2 - 4*N + 6;
%endfunction

%error: for x^y, only square matrix arguments are permitted and one argument must be scalar.  Use .^ for elementwise power.
%error: called from
%    myfun at line 2 column 6


function resp= epc1_6(N)
resp = 2*N .^ 2 - 4 .*N + 6;
endfunction
