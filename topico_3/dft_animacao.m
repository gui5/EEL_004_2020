% Funcao DFT - esta funcao nao eh computacionalmente eficiente, e so deve
% ser utilizada para fins didaticos
function [X] = dft_animacao(x,debug)

Xsize = length(x);

if (debug.idx_fig ~= 0)
    x_debug = zeros(Xsize^2,1);
    y_debug = zeros(Xsize^2,1);
    
    r_debug = zeros(Xsize^2,1);
    theta_debug = zeros(Xsize^2,1);
    
    cont_aux = 0; 
end


for m = 0:Xsize-1
    mysumm = 0;
    
    if (debug.idx_fig ~= 0)
       escala = 0; 
    end
    
    for n = 0:Xsize-1
        mysumm = mysumm + x(n+1) * (cos(2*pi*n*m/Xsize)  ...
            - i*sin(2*pi*n*m/Xsize));
        
        if (debug.idx_fig ~= 0)
            complex_number = x(n+1) * (cos(2*pi*n*m/Xsize) ...
                - i*sin(2*pi*n*m/Xsize));
            
            cont_aux = cont_aux + 1;
            x_debug(cont_aux) = real(complex_number);
            y_debug(cont_aux) = imag(complex_number);
            
            r_debug(cont_aux) = abs(complex_number);
            theta_debug(cont_aux) = angle(complex_number);
                  
            escala = max(escala,r_debug(cont_aux));
        end        
    end   
    X(m+1) = mysumm;
    
    if (~debug.full_spectrum)
        if (m > Xsize/2)
            debug.idx_fig = 0;
        end
    end
    
    if (debug.idx_fig ~= 0)
        if (abs(mysumm) > 0.01)
            myVideo = VideoWriter(sprintf('myVideoFile%d_Hz',m*debug.fan)); %open video file
            myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
            open(myVideo)                 

            figure(debug.idx_fig);
            debug.idx_fig = debug.idx_fig + 1;
            for k = cont_aux-Xsize+1:cont_aux
                cla;title(sprintf('Componente de %d Hz',debug.fan*m));
                %plot(x_debug(cont_aux-Xsize+1:k-1),y_debug(cont_aux-Xsize+1:k-1),'b'); hold on;               
                polar(theta_debug(cont_aux-Xsize+1:k-1),r_debug(cont_aux-Xsize+1:k-1)/escala,'b'); hold on;               
                %plot(x_debug(k),y_debug(k),'.r');                
                polar(theta_debug(k),r_debug(k)/escala,'.r');                
                drawnow;
                pause(0.01) %Pause and grab frame

                frame = getframe(gcf); %get frame
                writeVideo(myVideo, frame);   
            end

            polar(angle(mysumm),1,'or');
            frame = getframe(gcf); %get frame
            writeVideo(myVideo, frame);   

            close(myVideo);      
            savefig(gcf,sprintf('myFigFile%d_Hz.fig',m*debug.fan))

        end
    end
end

