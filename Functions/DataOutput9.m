function [ARSK] = DataOutput9
%Funkcija koja koja služi za odreðivanje karakteristike izabranog
%regulatora sile koèenja
%==========================================================================
InputStr_N=input('Unesi broj tacaka unosa(racunajuci i koordinatni pocetak):  ','s');
N = str2num(InputStr_N);
N2=N+1;
for i=1:1:N
    
    %Pritisak u prednjem kocnom krugu(Ulazni)
    InputStr_X=input('Unesi vrednosti tacaka pritiska u prednjem kocnom krugu (racunajuci i koordinatni pocetak):  ','s');
    X(1,i) = str2num(InputStr_X)
    %Pritisak u zadnjem kocnom krugu(Izlazni)
    InputStr_Y=input('Unesi vrednosti tacaka pritiska u zadnjem kocnom krugu (racunajuci i koordinatni pocetak):  ','s');
    Y(1,i) = str2num(InputStr_Y)
end

    
    %Karakteristika K i n
    for i=1:1:N
        j=i+1;
        for j=j:1:N
    K(i,1)=(Y(1,(i+1))-Y(1,i))./(X(1,(i+1))-X(1,i));
    n(i,1)=((X(1,i)).*(Y(1,(i+1))-Y(1,i))+(Y(1,i)).*...
        (X(1,(i+1))-X(1,i)))./(X(1,(i+1))-X(1,i));
        end
        
    end
%     y0=0
%     y1=K(1,1).*X(1,2)+n(1,1)
%     y2=K(2,1).*X(1,3)+n(2,1)
%     y=[y0 y1 y2];
  
    
    ARSK.K=K
    ARSK.n=n
    x1=(0:1:40);
    x2=(40:1:100);
    
    y1=x1.*1;
    y2=x2.*0.333+53.333;
     ARSK.y1=y1
    ARSK.y2=y2
  
    figure
    plot(x1,y1)
    hold on
    plot(x2,y2)
end




