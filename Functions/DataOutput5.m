function [ OTKP ] =DataOutput5

global IK FTK UlPod ZavProrBR
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
F_p=IK.F_pul;
i_p=IK.i_p;
C_sp=IK.C_sp;
eta_mk=FTK.eta_m;
A_pkc=FTK.A_kp;
A_zkc=FTK.A_kz;
s_pkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_zkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_shgkc=2;  % od 1-2[mm]
eta_h=FTK.eta_h;
C_p=FTK.C_p;
C_z=FTK.C_z;
d_kcp=FTK.d_kcp;    %[m]
d_kcz=FTK.d_kcz;    %[m]    
r_srp=FTK.r_srp;    %[m]    
r_srz=FTK.r_srz;    %[m]
r_d=FTK.r_d;        %[m]
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
f_ped=IK.f_pedale;  %[mm]
kfp=ZavProrBR.kfp;  %[/]
kfz=ZavProrBR.kfz;  %[/]
k=ZavProrBR.k;      %[/]
F_pinc=ZavProrBR.F_pinc; %[N]
p_h=ZavProrBR.p_h;  
eta_m=0.8;
%Otkaz prednjih kocnica 
%==========================================================================
%Kocni koeficient za optereceno vozilo 
%==========================================================================
            %faktor kocnog koeficienta 
            kq_o=((A_zkc.*C_z.*r_srz)./r_d)./eta_m;
            
            

q_o=(p_h.*kq_o).*4000./(m_o.*g);
Z_zdo=((m_o.*g)./l).*(l_po-q_o.*h_co);
phi_zo=(kfz./Z_zdo).*F_pinc;


%Kocni koeficient za neoptereceno vozilo
%==========================================================================
               %faktor kocnog koeficienta 
            kq_no=((A_zkc.*C_z.*r_srz)./r_d)./eta_m;
            
            

q_no=(p_h.*kq_no).*4000./(m_no.*g);
Z_zdno=((m_o.*g)./l).*(l_pno-q_no.*h_cno);
phi_zno=1.1.*(kfz./Z_zdno).*F_pinc;


%Crtanje dijagrama otkaza prednjih kocnica
%==========================================================================

q1=0.1:0.1:0.8;
phi1=0.1:0.1:0.8;

figure(5)
hold on
xlabel('q[/]');
ylabel('phi[/]');
plot(q1,phi1,'LineWidth',2);
plot(q_o,phi_zo,'--');





%Izlaz iz funckcije
%==========================================================================
OTKP.kfp=kfp;
OTKP.kfz=kfz;
OTKP.q_o=q_o;
OTKP.q_no=q_no;
OTKP.Z_zdo=Z_zdo;
OTKP.Z_zdo=Z_zdo;
OTKP.phi_zo=phi_zo;
OTKP.phi_zno=phi_zno;

end

