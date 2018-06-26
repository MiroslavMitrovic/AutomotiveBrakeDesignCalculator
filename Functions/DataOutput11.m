function [ ZavProrSR] = DataOutput11
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
%KORISTITI SAMO ZA NEOPTERECENO STANJE
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
s_pkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_zkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_shgkc=2;  % od 1-2[mm]
eta_h=FTK.eta_h;
C_p=FTK.C_p;
C_z=FTK.C_z;
d_kcp=FTK.d_kcp;    %[mm]
d_kcz=FTK.d_kcz;    %[mm]    
r_srp=FTK.r_srp;    %[mm]    
r_srz=FTK.r_srz;    %[mm]
r_d=FTK.r_d.*1000;  %[mm]
r_dd=r_d./1000;     %[m]
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
s_gkc=ceil(s_gkc);
%Hod pedale [mm]
f_p=s_gkc.*i_p;
f_p=ceil(f_p);

%Inkrementalno podeljena vrednost F_p 
%==========================================================================
F_pmin=0;
N=20;
F_pmax=F_p;
F_inc=F_pmax./N;
F_pinc=F_pmin:F_inc:F_pmax;

%Pritisak u prenosnom mehanizmu [MPa]
%==========================================================================
    %Faktor pritiska 
    kp=(4.*i_p.*C_sp.*eta_mk.*eta_h./(((d_gkc.^(2)).*pi)));
    
L1=4;%vrednost do koje  ARSK ima linearnu karakteristiku 
p_h=kp.*F_pinc;
N_ul=(max(p_h)./N);
p_hp=(0:N_ul:max(p_h));
Pul1=[min(p_h):0.1:L1];
Pizl1=Pul1;
L2=max(ceil(p_hp));%maksimalna vrednost ulaznog pritiska
L3=7.262;%maksimalna vrednost izlaznog pritiska ARSK
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2=[L1:1:L2];
Pizl2=[L1:L5:L3 ];
pul=[Pul1,Pul2];
pizl=[Pizl1,Pizl2];
L5=(L3./L2)*L1
figure(25)
hold on
plot(pul,pizl);

reply = input('Da li je regulacija pozadi (da/ne): ', 's');
                    if strcmp(reply,'da')
                        p_hz=pizl;
                        p_hp=pul;
                    else
                        p_hp=pizl;
                        p_hz=pul;
                    end

F_pinc=p_hp./kp;

K=(L3-L1)./(L2-L1); % Karakteristika korektora kocenja
K_1=1./K;           % Reciprocna vrednost karakteristike korektora kocenja
% N_izl=(max(pizl)./N);
% p_hz=(0:N_izl:max(pizl))
% figure(26)
% plot(p_hp,p_hz);




%Sile kocenja po osovinama vozila 
%==========================================================================
            %faktor prednje sile kocenja 
            kfp=2.*C_p.*C_sp.*((d_kcp.^(2)).*r_srp)./((d_gkc).^(2).*r_d)...
                .*i_p.*eta_h.*eta_mk;
            %faktor zadnje sile kocenja 
            kfz=2.*C_z.*C_sp.*((d_kcz.^(2).*r_srz)./((d_gkc).^(2).*r_d))...
                *i_p.*eta_h.*eta_mk;
            
            
F_kp=p_hp.*(((d_kcp.^2).*pi)/2).*C_p.*eta_h.*(r_srp./r_d);
F_kz=p_hz.*(((d_kcz.^2).*pi)/2).*C_p.*eta_h.*(r_srp./r_d);
            
            
%Ukupna sila kocenja 
%==========================================================================
            %faktor ukupne sile kocenja
            
F_k=F_kp+F_kz;

k=(F_k)./(F_pinc);


%Momenti kocenja 
%==========================================================================
    %Po osovinama
    %----------------------------------------------------------------------
    Mp=F_kp./r_dd; %napred
    Mz=F_kz./r_dd; %pozadi
    %Po tocku
    %----------------------------------------------------------------------
    Mpt=Mp./2;   %napred
    Mzt=Mz./2;   %pozadi
    
%Kocni koeficient za optereceno vozilo 
%==========================================================================
            %faktor kocnog koeficienta 
            kq_o=k./(m_o.*g);

q_o=kq_o.*F_pinc;
% q_t=q_o(1,49)
% F_kt=F_k(1,49)
a_o=q_o.*10;


%Kocni koeficient za neoptereceno vozilo
%==========================================================================
   %faktor kocnog koeficienta 
            kq_no=k./(m_no.*g);

q_no=kq_no.*F_pinc;

a_no=q_no.*10;
%Dinamicke reakcije na prednjoj i zadnjoj osovini u opterecenom stanju
%==========================================================================

Z_pdo=((m_o.*g)./l).*(l_zo+q_o.*h_cno);
Z_zdo=((m_o.*g)./l).*(l_po-q_o.*h_cno);

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

phi_po=F_kp./Z_pdo;

phi_zo=F_kz./Z_zdo;

%Iskorisceno prijanjanje na prednjoj i zadnjoj osovini u neopt. stanju
%==========================================================================
phi_pno=F_kp./Z_pdno;

phi_zno=F_kz./Z_zdno;

%%
%Crtanje dijagrama
%==========================================================================


figure(26)
hold on
axis([0 1.2 0 1.2]);








q1=0.1:0.1:1.2;
phi1=0.1:0.1:1.2;
q2=[0.15,0.3];




phi2=(q1+0.07)./0.85;
phi3=(q2+0.05)
% plot(q_oinc,phi_ukoinc,'LineWidth',2);

plot(q1,phi1,'LineWidth',2);
plot(q2,phi3,'-m');
plot(q_o,phi_po,'-c');
plot(q_o,phi_zo,'-k');
plot(q_no,phi_pno,'--');
plot(q_no,phi_zno,'--');

% plot(q1,phi11); 
plot(q1,phi2); 
% plot(q_no,phi_pno,'--rs','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','g',...
%                 'MarkerSize',5);
% plot(q_no,phi_zno,'--ks','LineWidth',2,...
%                 'MarkerEdgeColor','k',...
%                 'MarkerFaceColor','c',...
%                 'MarkerSize',5);
xlabel('q[/]');
ylabel('\phi[/]');
hleg1 = legend('q=\phi','\phi_{po}','\phi_{zo}','phi=(q+0.07)/0.85');



%q_no inkrementalno

q_noinc=kq_no.*F_pinc;
% plot(q_noinc,F_pinc,'LineWidth',2);


%Crtanje dijagrama krivih iskoriscenog prijanjanja u funkciji od pritiska
%aktiviranja
%==========================================================================
figure(27)
hold on
grid on
xlabel('p[Pa]');
ylabel('phi[/]');
plot(p_hp,phi_po);
plot(p_hz,phi_zo);
%Crtanje dijagrama blokiranja kretaca
%==========================================================================
figure(28)
% axis([0.2 1.2 0 15000]);
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
figure(29)

hold on
grid on
xlabel('p[Pa]');
ylabel('F[N]');
plot(pul,F_kp,'-c');
plot(pizl,F_kz,'-m');
% plot(p_h,F_k,'-k');
plot(pul,F_pofi,'-r');
plot(pizl,F_zofi,'-b');
hleg2 = legend('F_kp','F_kz','F_pophi',...
'F_zophi');
%nacrtati ovaj dijagram u funkciji sile na pedali

%Crtanje dijagrama usporenja u funkciji od sile na pedali 
%==========================================================================
figure(30)
hold on
grid on
plot(F_pinc,a_o);
xlabel('F_p[N]');
ylabel('a[m/s^{2}]');




%%
%Izlazi iz funkcije 
%==========================================================================
ZavProrSR.F_gkc=F_gkc2;
ZavProrSR.V_kc=V_kc;
ZavProrSR.V_r=V_r;
ZavProrSR.V_gkc=V_gkc;
ZavProrSR.A_gkc=A_gkc;
ZavProrSR.d_gkc=d_gkc;
ZavProrSR.kp=kp;
ZavProrSR.p_h=p_h;
ZavProrSR.p_hp=p_hp;
ZavProrSR.p_hz=p_hz;
ZavProrSR.kfp=kfp;
ZavProrSR.kfz=kfz;
ZavProrSR.F_kp=F_kp;
ZavProrSR.F_kz=F_kz;
ZavProrSR.k=k;
ZavProrSR.F_k=F_k;
ZavProrSR.kq_no=kq_no;
ZavProrSR.kq_o=kq_o;
ZavProrSR.q_no=q_no;
ZavProrSR.q_o=q_o;
ZavProrSR.Z_pdo=Z_pdo;
ZavProrSR.Z_zdo=Z_zdo;
ZavProrSR.Z_pdno=Z_pdno;
ZavProrSR.Z_zdno=Z_zdno;
ZavProrSR.phi_po=phi_po;
ZavProrSR.phi_zo=phi_zo;
ZavProrSR.phi_pno=phi_pno;
ZavProrSR.phi_zno=phi_zno;
ZavProrSR.F_pinc=F_pinc;
ZavProrSR.s_gkc=s_gkc;
ZavProrSR.F_pul=F_p;
ZavProrSR.a_o=a_o;
ZavProrSR.a_no=a_no;
ZavProrSR.f_p=f_p;
ZavProrSR.pizl=pizl;
ZavProrSR.pul=pul;
ZavProrSR.Mp=Mp;
ZavProrSR.Mz=Mz;
ZavProrSR.Mpt=Mpt;
ZavProrSR.Mzt=Mzt;
%Zapisivanje podataka u .xls datoteku 
%==========================================================================
DataMatlab2XLS = {'F_gkc[N]', 'V_kc[mm^3]','V_r[mm^3]','V_gkc[mm^3]', 'A_gkc[mm^2]',...
    'd_gkc[mm]','k_p[/]','kfp[/]','kfz[/]','k[/]','kq_no[/]','kq_o[/]','s_gkc[mm]'...
    ,'f_p[mm]';F_gkc2 V_kc V_r V_gkc  A_gkc d_gkc kp kfp kfz k kq_no kq_o s_gkc, f_p};
DataMatlab2XLSt=DataMatlab2XLS';
xlswrite('ProracunKocenja.xls', DataMatlab2XLSt,'ZavProrSaReg','A1');


A={'F_pinc[N]','p_hp[MPa]','p_hz[MPa]', 'F_kp[N]' ,'F_kz[N]' ,'F_k[N]',...
    'Mp[Nm]','Mz[Nm]','Mpt[Nm]','Mzt[Nm]', 'q_o[/]','q_no[/]',...
    'Z_pdo[N]','Z_zdo[N]','Z_pdno[N]','Z_zdno[N]','phi_po[/]',...
    'phi_zo[/]','phi_pno[/]','phi_zno[/]','a_o[m/s^2]','a_no[m/s^2]'};
At=A';
DataMatlab2XLS = [F_pinc;p_hp ;p_hz; F_kz; F_kp; F_k ; Mp; Mz; Mpt; Mzt;...
    q_o ;q_no ;Z_pdo ;Z_zdo;Z_pdno ;Z_zdno;phi_po; phi_zo; phi_pno;...
    phi_zno;  a_o; a_no];
% 
xlswrite('ProracunKocenja.xls', At,'ZavProrSaReg','D1');
% 
xlswrite('ProracunKocenja.xls', DataMatlab2XLS, 'ZavProrSaReg','E1');




end

