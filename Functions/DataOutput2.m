function [ FTK ] = DataOutput2
global UlPod PPK
%Odredjivanje ukupnih sila i momenata
%==========================================================================
%%Velicine 
%==========================================================================
%F_uk         [N]     Ukupna sila kocenja 
%rd           [m]     Dinamicki poluprecnik trenja
%F_kpo        [N]     Sila kocenja na prednjoj osovini u opterecenom stanju
%F_kzo        [N]     Sila kocenja na zadnjoj osovini u opterecenom stanju
%F_kpto       [N]     Sila po tocku na predjoj osovini u opterecenom stanju
%F_zpto       [N]     Sila po tocku na zadnjoj osovini u opterecenom stanju
%M_kpto       [Nm]    Moment kocenja po tocku na prednjoj osovini u 
%                     opterecenom stanju
%M_zpto       [Nm]    Moment kocenja po tocku na zadnjoj osovini u
%                     opterecenom stanju.
%r_srp        [m]     Srednji poluprecnik trenja prednje
%                     kocnice(0.25-0.4rd)
%C_p          [/]     Karakteristika prednje kocnice 
%r_srz        [m]     Srednji poluprecnik trenja zadnje kocnice(0.25-0.4rd) 
%C_z          [/]     Karakteristika zadnje kocnice 
%F_mip        [N]     Potrebna sila trenja na prednjoj osovini 
%F_miz        [N]     Potrebna sila trenja na zadnjoj osovini 
%eta_m        [/]     Mehanicki stepen korisnosti (0.5-0.9)
%p_hmax       [MPa]   Najveci neregulisani pritisak u HPM-u (6-10(12)[MPa])
%A_kp         [m^2]   Potrebna povrsina poprecnog preseka klipa kocnog cil.
%A_kz         [m^2]   Potrebna povrsina poprecnog preseka klipa kocnog cil.
%eta_h        [/]     Hidraulicki stepen korisnosti (0.9)
%d_kcp        [m]     Precnik klipa kocnog cilindra prednjih kocnica 
%d_kcz        [m]     Precnik klipa kocnog cilindra zadnjih kocnica 
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
%%
%Ulazne Velicine 
%==========================================================================
F_ku=UlPod.F_ku;
R=PPK.R;
rd=UlPod.rd;
eta_m=0.85;
eta_h=0.9;
p_hmax=10.*(10.^6);  %[Pa]
%==========================================================================
%%
%Sile kocenja po osovinama u opterecenom stanju

F_kpo=F_ku.*(R./(1+R));
F_kzo=F_ku.*(1./(1+R));

%Sile kocenja po tocku u opterecenom stanju 
F_kpto=F_kpo./2;
F_kzto=F_kzo./2;

%Momenti kocenja po tockovima u opterecenom stanju
M_kpto=F_kpto.*rd;
M_kzto=F_kzto.*rd;

%Izbor srednjeg poluprecnika trenja (0.25-0.4)*rd [m]
%Treba se uraditi proracun isto kao za spojnicu ??? 


r_srp=0.4.*rd;
r_srz=0.25.*rd;

%Izbor karakteristika kocnice C(Simpleks[1.7-2.2] Dupleks[2.4-3.2]
%Duoservo[2.8-5.5] Disk sa stegom[0.7] Lamelasta[3.2-6.5])

C_p=0.7;
C_z=0.7;

formatspecn='Karakteristika prednje kocnice je %4.3f mm\n';
fprintf(formatspecn,C_p);
formatspecz='Karakteristika zadnje kocnice je %4.3f mm\n';
fprintf(formatspecz,C_z);

%Potrebne sile trenja po kocnicama 

F_mip=M_kpto./r_srp;
F_miz=M_kzto./r_srz;

%Potrebne sile aktiviranja kocnica 

F_ap=(F_mip./C_p)./eta_m;
F_az=(F_miz./C_z)./eta_m;

%Odredjivanje potrebne povrsine poprecnog preseka klipa kocnog cilindra[m^2]!
A_kp=((F_ap./p_hmax)./eta_h);
A_kz=((F_az./p_hmax)./eta_h);

%Odredjivanje potrebnog precnika klipa kocnog cilindra[m]!

d_kcp=(((4.*A_kp)./pi).^(1/2));
d_kcz=(((4.*A_kz)./pi).^(1/2));

%Odredjivanje potrebnog precnika klipa kocnog cilindra[mm]!
d_kcp=ceil(d_kcp.*1000);
d_kcz=ceil(d_kcz.*1000);

formatspecn='Precnik kocnog cilindra prednje kocnice je %4.2f mm\n';
fprintf(formatspecn,d_kcp);
formatspecz='Precnik kocnog cilindra zadnje kocnice je %4.2f mm\n';
fprintf(formatspecz,d_kcz);

%Izbor srednjeg poluprecnika trenja (0.25-0.4)*rd [mm]
r_srp=r_srp.*1000;
r_srz=r_srz.*1000;

formatspecn='Precnik prednjeg diska je %4.3f mm\n';
fprintf(formatspecn,r_srp);
formatspecz='Precnik zadnjeg diska je %4.3f mm\n';
fprintf(formatspecz,r_srz);



%Izlazi iz funkcije 
%==========================================================================
FTK.F_kpo=F_kpo;
FTK.F_kzo=F_kzo;
FTK.F_kpto=F_kpto;
FTK.F_kzto=F_kzto;
FTK.M_kpto=M_kpto;
FTK.M_kzto=M_kzto;
FTK.r_srp=r_srp;
FTK.r_srz=r_srz;
FTK.C_p=C_p;
FTK.C_z=C_z;
FTK.F_mip=F_mip;
FTK.F_miz=F_miz;
FTK.F_ap=F_ap;
FTK.F_az=F_az;
FTK.A_kp=A_kp;
FTK.A_kz=A_kz;
FTK.d_kcp=d_kcp;
FTK.d_kcz=d_kcz;
FTK.p_hmax=p_hmax;
FTK.eta_h=eta_h;
FTK.eta_m=eta_m;
FTK.r_d=rd;
%Zapisivanje podataka u .xls datoteku 
%==========================================================================
DataMatlab2XLS = {'F_kpo[N]', 'F_kzo[N]','F_kpto[N]','F_kzto[N]', 'M_kpto[Nm]',...
    'M_kzto[Nm]','r_srpd[mm]','r_srzd[mm]','C_p[/]','C_z[/]','F_mip[N]',...
  'F_miz[N]','F_ap[N]','F_az[N]','A_kp[m^2]','A_kz[m^2]','d_kcp[mm]','d_kcz[mm]',... 
  'p_hmax[Pa]','eta_h[/]','eta_m[/]';F_kpo F_kzo F_kpto F_kzto M_kpto M_kzto r_srp...
  r_srz C_p C_z F_mip F_miz F_ap F_az A_kp A_kz d_kcp d_kcz p_hmax eta_h...
  eta_m};
DataMatlab2XLSt=DataMatlab2XLS';
xlswrite('ProracunKocenja.xls', DataMatlab2XLSt,...
    'OdrPotrMomentaiSila','A1');



end

