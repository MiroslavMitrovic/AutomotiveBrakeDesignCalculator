function [ ZavProrBR] = DataOutput4
global IK FTK UlPod
%%
%Velicine 
%==========================================================================
%F_p                [N]     Najveca dozvoljena sila na komandi 
%i_p                [/]     Prenosni odnos pedale 
%C_sp               [/]     Karakteristika servo pojacala
%eta_mk             [/]     Mehanicki stepen korisnosti komande 
%F_gkc              [N]     Sila na klipnjaci glavnog kocnog cilindra 
%A_gkc              [m^2]   Povrsina poprecnog preseka klipa gl.koc.cil.
%d_gkc              [m]     Precnik klipa glavnog kocnog cilindra 
%p_h                [N/m^2] Pritisak u prenosnom mehanizmu  
%F_kp               [N]     Sila kocenja na prednjoj osovini 
%F_kz               [N]     Sila kocenja na zadnjoj osovini 
%F_k                [N]     Ukupna sila kocenja 
%q_op               [/]     Kocni koeficient za optereceno vozilo 
%q_no               [/]     Kocni koeficient za neoptereceno vozilo 
%Z_pd               [N]     Dinamicke reakcije na prednjoj osovini 
%Z_zd               [N]     Dinamicke reakcije na zadnjoj osovini 
%phi_p              [/]     Iskorisceno prijanjanje na prednjoj osovini
%phi_z              [/]     Iskorisceno prijanjanje na zadnjoj osovini
%s_pkc              [mm]    Hod klipa prednjih kocnih cilindara 
%s_zkc              [mm]    Hod klipa zadnjih kocnih cilindara 
%s_gkc              [mm]    Hod klipa glavnog kocnog cilindra 
%s_shgkc            [mm]    Slobodni hod klipa glavnog kocnog cilindra 
%A_pkc              [m^2]   Povrsina P.P klipa prednjeg kocnog cilindra
%A_zkc              [m^2]   Povrsina P.P klipa zadnjeg kocnog cilindra
%A_gkc              [mm^2]  Povrsina P.P klipa glavnog kocnog cilindra 
%V_gkc              [mm^3]  Ukupna zapremina kocnog sistema 
%d_gkc              [mm]    Precnik klipa glavnog kocnog cilindra
%r_srp              [m]     Srednji poluprecnik trenja prednje kocnice
%r_srz              [m]     Srednji poluprecnik trenja zadnje kocnice
%C_p                [/]     Karakteristika prednje kocnice 
%C_z                [/]     Karakteristika zadnje kocnice 
%d_kcp              [m]     Precnik P.P prednjeg kocnog cilindra 
%d_zcp              [m]     Precnik P.P zadnjeg kocnog cilindra 
%r_d                [m]     Dinamicki poluprecnik tocka 
%m_no               [kg]    Masa neopterecenog vozila 
%m_o                [kg]    Masa opterecenog vozila 
%l                  [m]     Medjuosovinsko rastojanje vozila 
%l_po               [m]     Rastojanje prednje osovine od tezista u
%opterecenom stanju
%l_zo               [m]     Rastojanje zadnje osovine od tezista u
%opterecenom stanju
%l_pno               [m]     Rastojanje prednje osovine od tezista u
%neopterecenom stanju
%l_zno               [m]     Rastojanje zadnje osovine od tezista u
%neopterecenom stanju
%h_co                [m]     Visina tezista vozila u opterecenom stanju
%h_cno               [m]     Visina tezista vozila u neopterecenom stanju
%phi_po              [/]     Iskorisceno prijanjanje prednje osovine u
%opterecenom stanju
%phi_zo              [/]     Iskorisceno prijanjanje zadnje osovine u
%opterecenom stanju
%phi_pno              [/]     Iskorisceno prijanjanje prednje osovine u
%neopterecenom stanju
%phi_zno              [/]     Iskorisceno prijanjanje zadnje osovine u
%neopterecenom stanju

%==========================================================================
%%
%Ulazni podaci 
%==========================================================================
F_p=IK.F_p;
i_p=IK.i_p;
C_sp=IK.C_sp;
A_gkc=IK.A_gkc;
d_gkc=IK.d_gkc;
eta_mk=FTK.eta_m;
A_pkc=FTK.A_kp;
A_zkc=FTK.A_kz;
s_pkc=0.7;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_zkc=0.7;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_shgkc=2;  % od 1-2[mm]
eta_h=FTK.eta_h;
C_p=FTK.C_p;
C_z=FTK.C_z;
d_kcp=FTK.d_kcp;    %[mm]
d_kcz=FTK.d_kcz;    %[mm]    
r_srp=FTK.r_srp;    %[mm]    
r_srz=FTK.r_srz;    %[mm]
r_d=FTK.r_d.*1000;  %[mm]
m_o=UlPod.m_o;      %[kg]
g=UlPod.g;          %[m^s^2]
m_no=UlPod.m_no;    %[kg]
l=UlPod.l;          %[m]
l_pno=UlPod.l_pno;  %[m]
l_zno=UlPod.l_zno;  %[m]
l_po=UlPod.l_po;    %[m]
l_zo=UlPod.l_zo;    %[m]
h_co=UlPod.h_co;    %[m]
h_cno=UlPod.h_cno;  %[m]
% f_ped=IK.f_pedale;  %[mm]
phi=0.8;            %[/]

%==========================================================================
%%
%%
%Funkcija za unos podataka----
% koristi se naredba 'input' za unos preko komandne linije
% opcija 's' se odnosi na to da izlazni parametar bude string
% zatim se koristi komanda 'str2num' za pretvaranje stringa u numericki
% zapis 
%Primer---- InputStr_N=input('Unesi broj stepeni prenosa N:  ','s');
% N = str2num(InputStr_N);
%==========================================================================

%Sila na klipnjaci glavnog kocnog cilindra druga formula(Dobija se isto)
%==========================================================================
F_gkc2=F_p.*i_p.*C_sp.*eta_mk;

%Povrsina poprecnog preseka glavnog kocnog cilindra [mm^2]
%==========================================================================
V_kc=(2.*(A_pkc).*(10.^(6)).*(s_pkc))+(2.*(A_zkc).*(10.^(6)).*(s_zkc));

V_r =2000;         %zapremina koja uzima u obzir elasticnost creva(1.5-2[cm^3])

V_gkc=V_kc+V_r ;    %Ukupna radna zapremina kocnog sistema

%Hod glavnog kocnog cilindra[mm]
s_uk=V_gkc./A_gkc;

%Hod klipa u glavnom kocnom cilindru[mm]
s_gkc=s_uk+s_pkc+s_zkc;

%Hod pedale [mm]
f_p=s_gkc.*i_p;


%Inkrementalno podeljena vrednost F_p 
%==========================================================================
F_pmin=50;
F_pink=25;
F_pmax=F_p;
F_pinc=F_pmin:F_pink:F_pmax;

%Pritisak u prenosnom mehanizmu [MPa]
%==========================================================================
    %Faktor pritiska 
    kp=(4.*i_p.*C_sp.*eta_mk.*eta_h./(((d_gkc.^(2)).*pi)));

p_h=kp.*F_pinc;

%Sile kocenja po osovinama vozila 
%==========================================================================
            %faktor prednje sile kocenja 
            kfp=2.*C_p.*C_sp.*((d_kcp.^(2)).*r_srp)./((d_gkc).^(2).*r_d)...
                .*i_p.*eta_h.*eta_mk;
            %faktor zadnje sile kocenja 
            kfz=2.*C_z.*C_sp.*((d_kcz.^(2).*r_srz)./((d_gkc).^(2).*r_d))...
                *i_p.*eta_h.*eta_mk;
            
            
F_kp=kfp.*F_pinc;
F_kz=kfz.*F_pinc;

            
            
%Ukupna sila kocenja 
%==========================================================================
            %faktor ukupne sile kocenja
            k=kfp+kfz;
F_k=k.*F_pinc;

%Kocni koeficient za optereceno vozilo 
%==========================================================================
            %faktor kocnog koeficienta 
            kq_o=k./(m_o.*g);

q_o=kq_o.*F_pinc;

a_o=q_o.*10;


%Kocni koeficient za neoptereceno vozilo
%==========================================================================
   %faktor kocnog koeficienta 
            kq_no=k./(m_no.*g);

q_no=kq_no.*F_pinc;

a_no=q_no.*10;
%Dinamicke reakcije na prednjoj i zadnjoj osovini u opterecenom stanju
%==========================================================================

Z_pdo=((m_o.*g)./l).*(l_zo+q_o.*h_co);
Z_zdo=((m_o.*g)./l).*(l_po-q_o.*h_co);

    %Maksimalna sila kocenja napred i pozadi u opterecenom stanju
    F_pofi=Z_pdo.*phi;
    F_zofi=Z_zdo.*phi;

%Dinamicke reakcije na prednjoj i zadnjoj osovini u neopterecenom stanju
%==========================================================================

Z_pdno=((m_no.*g)./l).*(l_zno+q_no.*h_cno);
Z_zdno=((m_no.*g)./l).*(l_pno-q_no.*h_cno);
%Maksimalna sila kocenja napred i pozadi u neopterecenom stanju
    F_pnofi=Z_pdno.*phi;
    F_znofi=Z_zdno.*phi;

%Iskorisceno prijanjanje na prednjoj i zadnjoj osovini u opterecenom stanju
%==========================================================================

phi_po=(kfp./Z_pdo).*F_pinc;

phi_zo=(kfz./Z_zdo).*F_pinc;

%Iskorisceno prijanjanje na prednjoj i zadnjoj osovini u neopt. stanju
%==========================================================================
phi_pno=(kfp./Z_pdno).*F_pinc;

phi_zno=(kfz./Z_zdno).*F_pinc;



%Presecne tacke
%==========================================================================
%Optereceno

[qoppr,Fppr]=curveintersect(q_o,F_kp,q_o,F_pofi);  

[qozpr,Fzpr]=curveintersect(q_o,F_kz,q_o,F_zofi);  

    if (qoppr<qozpr)
        qopr=qoppr;
    else
        qopr=qozpr;
    end
        
      
        


%Neoptereceno
[qnoppr,Fppr]=curveintersect(q_no,F_kp,q_no,F_pnofi);  

[qnozpr,Fzpr]=curveintersect(q_no,F_kz,q_no,F_znofi);



    if (qnoppr<qnozpr)
        qnopr=qnoppr;
    else
        qnopr=qnozpr;
    end

%Maksimalno realno usporenje koje se moze ostvariti
%==========================================================================

%Optereceno
a_omax=qopr*10;
a_ostv=a_o(a_o<a_omax);
no=size(a_ostv);
no=no(1,2);
no1=no+1;
a_ostv(1,no1)=a_omax;
F_pincoInt=interp1(a_o,F_pinc,a_omax);
F_pinco=F_pinc(F_pinc<F_pincoInt);
fno=size(F_pinco);
fno=fno(1,2);
fno1=fno+1;
F_pinco(1,fno1)=F_pincoInt;



%Neoptereceno
a_nomax=qnopr*10;
a_nostv=a_no(a_no<a_nomax);
nno=size(a_nostv);
nno=nno(1,2);
nno1=nno+1;
a_nostv(1,nno1)=a_nomax;
F_pincnoInt=interp1(a_no,F_pinc,a_nomax);
F_pincno=F_pinc(F_pinc<F_pincnoInt);
fnno=size(F_pincno);
fnno=fnno(1,2);
fnno1=fnno+1;
F_pincno(1,fnno1)=F_pincnoInt;







%%
%Crtanje dijagrama
%==========================================================================


figure(3)
hold on
axis([0 1.2 0 1.2]);








q1=0.1:0.1:1.2;
phi1=0.1:0.1:1.2;





phi2=(q1+0.07)./0.85;

% plot(q_oinc,phi_ukoinc,'LineWidth',2);

plot(q1,phi1,'LineWidth',2);
plot(q_o,phi_po,'-rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',5);
plot(q_o,phi_zo,'-ks','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','c',...
                'MarkerSize',5);

% plot(q1,phi11); 
plot(q1,phi2); 
plot(q_no,phi_pno,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',5);
plot(q_no,phi_zno,'--ks','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','c',...
                'MarkerSize',5);
xlabel('q[/]');
ylabel('\phi[/]');
hleg1 = legend('q=\phi','\phi_{po}','\phi_{zo}','phi=(q+0.07)/0.85',...
'\phi_{pno}','\phi_{zno}');




%q_no inkrementalno

q_noinc=kq_no.*F_pinc;
% plot(q_noinc,F_pinc,'LineWidth',2);


%Crtanje dijagrama krivih iskoriscenog prijanjanja u funkciji od pritiska
%aktiviranja
%==========================================================================
figure(4)
hold on
grid on
xlabel('p[Pa]');
ylabel('phi[/]');
plot(p_h,phi_po);
plot(p_h,phi_zo);
%Crtanje dijagrama blokiranja kretaca
%==========================================================================
figure(5)
axis([0 0.8 0 12000]);
hold on
grid on
xlabel('q[/]');
ylabel('F[N]');
plot(q_o,F_kp,'-c');
plot(q_o,F_kz,'-m');
plot(q_o,F_k,'-k');
plot(q_o,F_pofi,'-r');
plot(q_o,F_zofi,'-b');
hleg2 = legend('F_kp','F_kz','F_k','F_pophi',...
'F_zophi');
%Crtanje dijagrama blokiranja kretaca u funkciji od pritiska
%==========================================================================
figure(6)

hold on
grid on
xlabel('p[Pa]');
ylabel('F[N]');
plot(p_h,F_kp,'-c');
plot(p_h,F_kz,'-m');
plot(p_h,F_k,'-k');
plot(p_h,F_pofi,'-r');
plot(p_h,F_zofi,'-b');
hleg2 = legend('F_kp','F_kz','F_k','F_pophi',...
'F_zophi');

%Crtanje dijagrama usporenja u funkciji od sile na pedali 
%==========================================================================
figure(7)
hold on
grid on
plot(F_pinco,a_ostv);
plot(F_pincno,a_nostv,'--');
xlabel('F_p[N]');
ylabel('a[m/s^{2}]');




%%
%Izlazi iz funkcije 
%==========================================================================
ZavProrBR.F_gkc=F_gkc2;
ZavProrBR.V_kc=V_kc;
ZavProrBR.V_r=V_r;
ZavProrBR.V_gkc=V_gkc;
ZavProrBR.A_gkc=A_gkc;
ZavProrBR.d_gkc=d_gkc;
ZavProrBR.kp=kp;
ZavProrBR.p_h=p_h;
ZavProrBR.kfp=kfp;
ZavProrBR.kfz=kfz;
ZavProrBR.F_kp=F_kp;
ZavProrBR.F_kz=F_kz;
ZavProrBR.k=k;
ZavProrBR.F_k=F_k;
ZavProrBR.kq_no=kq_no;
ZavProrBR.kq_o=kq_o;
ZavProrBR.q_no=q_no;
ZavProrBR.q_o=q_o;
ZavProrBR.Z_pdo=Z_pdo;
ZavProrBR.Z_zdo=Z_zdo;
ZavProrBR.Z_pdno=Z_pdno;
ZavProrBR.Z_zdno=Z_zdno;
ZavProrBR.phi_po=phi_po;
ZavProrBR.phi_zo=phi_zo;
ZavProrBR.phi_pno=phi_pno;
ZavProrBR.phi_zno=phi_zno;
ZavProrBR.F_pinc=F_pinc;
ZavProrBR.s_gkc=s_gkc;
ZavProrBR.F_pul=F_p;
ZavProrBR.a_o=a_o;
ZavProrBR.a_no=a_no;
ZavProrBR.f_p=f_p;

%Zapisivanje podataka u .xls datoteku 
%==========================================================================

DataMatlab2XLS = {'F_gkc[N]', 'V_kc[mm^3]','V_r[mm^3]','V_gkc[mm^3]', 'A_gkc[mm^2]',...
    'd_gkc[mm]','k_p[/]','kfp[/]','kfz[/]','k[/]','kq_no[/]','kq_o[/]','s_gkc[mm]'...
    ,'f_p[mm]';F_gkc2 V_kc V_r V_gkc  A_gkc d_gkc kp kfp kfz k kq_no kq_o s_gkc, f_p};
DataMatlab2XLSt=DataMatlab2XLS';
xlswrite('ProracunKocenja.xls', DataMatlab2XLSt,'ZavProrBezReg','A1');


A={'p_h[MPa]','F_kp[N]', 'F_kz[N]' ,'F_k[N]','q_no[/]','q_o[/]','Z_pdo[N]','Z_zdo[N]',...
    'Z_pdno[N]','Z_zdno[N]','phi_po[/]','phi_zo[/]','phi_pno[/]','phi_zno[/]'...
    ,'F_pinc[N]','a_o[m/s^2]','a_no[m/s^2]'};
At=A';
DataMatlab2XLS = [p_h ;F_kp; F_kz; F_k ;q_no ;q_o ;Z_pdo ;Z_zdo... 
    ;Z_pdno ;Z_zdno;phi_po; phi_zo; phi_pno; phi_zno; F_pinc; a_o; a_no];
% 
xlswrite('ProracunKocenja.xls', At,'ZavProrBezReg','D1');
% 
xlswrite('ProracunKocenja.xls', DataMatlab2XLS, 'ZavProrBezReg','E1');





end

