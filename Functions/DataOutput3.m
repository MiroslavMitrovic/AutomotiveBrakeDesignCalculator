function [ IK ] = DataOutput3
global  FTK
%Funkcija za izbor komande 

%Ulazne velicine
%==========================================================================
%F_p             [N]     Sila na pedali(ne sme da predje vrednost od 500N)
%i_p             [/]     Prenosni odnos prenosnog mehanizma komande(4.5-7) 
%p_h             [MPa]   Maksimalni pritisak u sistemu (6-10MPa)
%d_gkc           [m]     Precnik glavnog kocnog cilindra
%K_sp            [/]     Pojacanje servo pojacala
%eta_mk          [/]     Stepen korisnosti komande 
%F_gkc           [N]     Sila na klipnjaci glavnog kocnog cilindra
%p_hmax          [MPa]   Najveci neregulisani pritisak u HPM-u (6-10(12)[MPa])
%f_pedale        [mm]    Hod pedale(vrednosti za mehanicki prenosni 
%sistem-ne treba da predje 150[mm], dok za servo pojacani sistem vrednosti
%bi trebalo da su u opsegu od 75 do 90[mm] da bi se ostvarilo usporenje od
%priblizno 1g)
%==========================================================================
%%
%Funkcija za unos podataka----
% koristi se naredba 'input' za unos preko komandne linije
% opcija 's' se odnosi na to da izlazni parametar bude string
% zatim se koristi komanda 'str2num' za pretvaranje stringa u numericki
% zapis 
%Primer---- InputStr_N=input('Unesi broj stepeni prenosa N:  ','s');
% N = str2num(InputStr_N);
%==========================================================================
F_pul=500; %(max 500[N])

i_p=5;
p_hmax=FTK.p_hmax;
C_sp=1;
eta_h=FTK.eta_h;
eta_m=FTK.eta_m;
eta_p=0.9;
%Moze i da se usvoji i da se prema njemu dimenzionise prenosni odnos pedale

%Izracunavanje precnika glavnog kocnog cilindra[m]!
%==========================================================================

%Potrebna sila na klipnjaci glavnog kocnog cilindra [N]

F_gkc=F_pul.*i_p.*C_sp.*eta_h;



%Izracunavanje precnika gkc [m]

A=4.*F_gkc;
B=p_hmax.*pi;
d_gkc=(A./B).^(1./2);




F_p=F_pul;

%Izracunavanje precnika glavnog kocnog cilindra[mm]!
d_gkc=d_gkc.*1000;

formatspecn='Precnik glavnog kocnog cilindra je %4.3f mm\n';
fprintf(formatspecn,d_gkc);
InputStr_d_gkc=input('Unesite vrednost precnika cilindra iz kataloga proizvodjaca:  ','s');
d_gkc = str2num(InputStr_d_gkc);


%Izracunavanje povrsine gkc[mm]

A_gkc=((d_gkc.^2).*pi)./4;

%Izlaz iz programa
%==========================================================================
IK.d_gkc=d_gkc;
IK.F_gkc=F_gkc;
IK.F_p=F_p;
IK.i_p=i_p;
IK.C_sp=C_sp;
IK.F_pul=F_pul;
IK.A_gkc=A_gkc;

%Zapisivanje podataka u .xls datoteku 
%==========================================================================
DataMatlab2XLS = {'d_gkc[mm]', 'F_gkc[N]','i_p[/]', 'C_sp[/]',...
   'F_pmax[N]';d_gkc F_gkc i_p C_sp  F_pul};
DataMatlab2XLSt=DataMatlab2XLS';
xlswrite('ProracunKocenja.xls', DataMatlab2XLSt,'Izbor_komande','A1');


end

