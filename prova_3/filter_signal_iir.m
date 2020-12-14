function Y = filter_signal_iir(x)
  kernelA = [1,-2,1.1716,-0.34315,0.17157];
  kernelB = [0.29289,0,-0.58579,0,0.29289];	
  
  Y = filter(kernelB,kernelA,x);
  
  endfunction