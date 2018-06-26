%Funkcija koja posmatra da li je prilikom regulacije pritisak manji nego
%maksimalni pritisak za kocni cilindar, i ako jeste, preko interpolacije
%nalazi vrednost sile za ulazni(regulisani) pritisak.
%==========================================================================
p_1=getappdata(0,'p_1');
p_1max=max(p_1);
p_2poc=getappdata(0,'p_2');
I_kc=getappdata(0,'I_kc');

if I_kc==1
    
    p_2kor=getappdata(0,'p_2');
    
else 

p_2kor=getappdata(0,'p_izlkorneopt');

end

F_pkcno=[];
F_zkcno=[];
F_pkco=[];
F_zkco=[];
setappdata(0,'p_2kor',p_2kor)
if isempty(p_2kor)
    p_2=getappdata(0,'p_2');
else
    p_2=p_2kor;
end
%Neoptereceno stanje
p_2max=max(p_2);
p_1maxkc=getappdata(0,'p_max1kc');
p_2maxkc=getappdata(0,'p_max2kc');
p_inc=getappdata(0,'p_inc');
p_inc2=getappdata(0,'p_inc2');
F_pkc=getappdata(0,'F_pkc');
F_zkc=getappdata(0,'F_zkc');



p_I=[p_1max, p_2max];
p_II=[p_1maxkc, p_2maxkc];


if p_II<p_I
    
    
else
    
    if p_1max<p_1maxkc
        
    A=interp1(p_inc,F_pkc,p_1max);
    p_1=p_1(p_1<p_1max+0.00000001);
    p_1max=max(p_1);
    F_pkc=F_pkc(F_pkc<A+0.0000001);
    F_pkcno=F_pkc;
    setappdata(0,'F_pkcno',F_pkc)
    setappdata(0,'I_regulator',1)
    end
    
    if p_2max<p_2maxkc
        
    B=interp1(p_inc2,F_zkc,p_2max);
    p_2=p_2(p_2<p_2max+0.00000001);
    p_2max=max(p_2);
    F_zkc=F_zkc(F_zkc<B+0.00000001);
    F_zkcno=F_zkc;
    setappdata(0,'F_zkcno',F_zkc)
    setappdata(0,'I_regulator',1) 
    end
    
        
end

%Optereceno stanje
p_2=getappdata(0,'p_2');
p_2max=max(p_2);
p_1maxkc=getappdata(0,'p_max1kc');
p_2maxkc=getappdata(0,'p_max2kc');
p_inc=getappdata(0,'p_inc');
p_inc2=getappdata(0,'p_inc2');
F_pkc=getappdata(0,'F_pkc');
F_zkc=getappdata(0,'F_zkc');



p_I=[p_1max, p_2max];
p_II=[p_1maxkc, p_2maxkc];


if p_II<p_I
    
   
else
    
    if p_1max<p_2maxkc
        
    A=interp1(p_inc,F_pkc,p_1max);
    p_1=p_1(p_1<p_1max+0.00000001);
    p_1max=max(p_1);
    F_pkc=F_pkc(F_pkc<A+0.0000001);
    setappdata(0,'F_pkco',F_pkc)
    setappdata(0,'I_regulator',1)
    end
    
    if p_2max<p_2maxkc
        
    B=interp1(p_inc2,F_zkc,p_2max);
    p_2=p_2(p_2<p_2max+0.00000001);
    p_2max=max(p_2);
    F_zkc=F_zkc(F_zkc<B+0.00000001);
    setappdata(0,'F_zkco',F_zkc)
    setappdata(0,'I_regulator',1) 
    end
    
   
end  
    


%--------------------------------------------------------------------------
%Izlazni podaci kontrola-Kocne sile napred/pozadi/optereceno neoptereceno
%stanje..............

%Neoptereceno stanje
%--------------------------------------------------------------------------
if isempty(F_pkcno)
    
    F_pkcno=F_pkc;
    setappdata(0,'F_pkcno',F_pkcno)
    
else
    
    setappdata(0,'F_pkcno',F_pkcno')
    
end

if isempty(F_zkcno)
    
    F_zkcno=F_zkc;
    setappdata(0,'F_zkcno',F_zkcno)
    
else
    
    setappdata(0,'F_zkcno',F_zkcno')
    
end

%Optereceno stanje
%--------------------------------------------------------------------------
if isempty(F_pkco)
    
    F_pkco=F_pkc;
    setappdata(0,'F_pkco',F_pkco)
    
else
    
    setappdata(0,'F_pkco',F_pkco')
    
end

if isempty(F_zkco)
    
    F_zkco=F_zkc;
    setappdata(0,'F_zkco',F_zkco)
    
else
    
    setappdata(0,'F_zkco',F_zkco')
    
end

 close()
%NASTAVITI SA PRORACUNOM....
GUI_ZavProrSRN2