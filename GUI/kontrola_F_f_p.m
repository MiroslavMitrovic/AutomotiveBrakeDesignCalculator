%Funkcija koja posmatra da li je prilikom regulacije pritisak manji nego
%maksimalni pritisak za kocni cilindar, i ako jeste, preko interpolacije
%nalazi vrednost sile za ulazni(regulisani) pritisak.
%==========================================================================
p_1=getappdata(0,'p_1');
p_1max=max(p_1);
p_2kor=getappdata(0,'p_izlogr');
p_2=getappdata(0,'p_2');
I_kc=getappdata(0,'I_kc');

if I_kc==1
    
    p_2kor=getappdata(0,'p_2');
    
else
    
    p_2kor=getappdata(0,'p_izlogr');
    
end

setappdata(0,'p_2kor',p_2kor)
if isempty(p_2kor)
    p_2kor=getappdata(0,'p_2');
end
p_2max=max(p_2);
p_2maxkor=max(p_2kor);
p_1maxkc=getappdata(0,'p_max1kc');
p_2maxkc=getappdata(0,'p_max2kc');
p_inc=getappdata(0,'p_inc');
p_inc2=getappdata(0,'p_inc2');
F_pkc=getappdata(0,'F_pkc');
F_zkc=getappdata(0,'F_zkc');
I_regulator=[];


p_I=[p_1max, p_2maxkor];
p_II=[p_1maxkc, p_2maxkc];

if isempty(p_2kor)
    close()
    GUI_ZavPror_N2
    
else
    if max(p_2)==max(p_2kor)
    
    close()
    GUI_ZavPror_N2
    
    else

        if p_II<p_I

            close()
            %NASTAVITI SA PRORACUNOM....
            GUI_ZavPror_N2
        else

            if p_1max<p_2maxkc

            A=interp1(p_inc,F_pkc,p_1max);
            p_1=p_1(p_1<p_1max+0.00000001);
            p_1max=max(p_1);
            F_pkc=F_pkc(F_pkc<A+0.0000001);
            setappdata(0,'F_pkcogr',F_pkc)
            F_zkcogr=getappdata(0,'F_pkcogr');
            setappdata(0,'I_regulator',1)
            end

            if p_2maxkor<p_2maxkc

            B=interp1(p_inc2,F_zkc,p_2maxkor);
            p_2kor=p_2kor(p_2kor<p_2maxkor+0.00000001);
            p_2max=max(p_2);
            F_zkc=F_zkc(F_zkc<B+0.00000001);
            setappdata(0,'F_zkcogr',F_zkc)
            F_zkcogr=getappdata(0,'F_zkcogr');
            setappdata(0,'I_regulator',1) 
            end

            close()
        %NASTAVITI SA PRORACUNOM....
        GUI_ZavPror_N2



        end
    end
end
