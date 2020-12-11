function output = resize_signal_filt(sinal, order, type)

output = sinal;

upper = ceil(order/2);
lower = floor(order/2);
med = round(order/2);

switch (type)
    case 'c'
        if (upper == lower) 
            output = sinal(1+upper:end-upper);    
        elseif (med == upper)
            output = sinal(upper:end-upper);  
        else
            output = sinal(lower:end-lower);  
        end
    otherwise
        output = sinal(1:end-order);
end
