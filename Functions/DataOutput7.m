function [PPK2] = DataOutput7
%Funkcija koja odredjuje krive iskoriscenog prijanjanja u funkciji od
%raspodele sile kocenja i transfera opterecenja
%=========================================================================

global UlPod PPK 
%Ulazni podaci 
%==========================================================================
R=PPK.R;
m_no=UlPod.m_no;
m_o=UlPod.m_o;
l=UlPod.l;
l_pno=UlPod.l_pno;
l_zno=UlPod.l_zno;
l_po=UlPod.l_po;
l_zo=UlPod.l_zo;
h_co=UlPod.h_co;
h_cno=UlPod.h_cno;
g=10;
phi=[0:0.1:0.8];
q=[ 0:0.1:0.8 ];
%==========================================================================
%Dinamicke reakcije napred i pozadi neoptereceno vozilo

Z_pdno=((m_no.*g)./l).*(l_zno+q.*h_cno);
Z_zdno=((m_no.*g)./l).*(l_pno-q.*h_cno);


%Dinamicke reakcije napred i pozadi optereceno vozilo

Z_pdo=((m_o.*g)./l).*(l_zo+q.*h_co);
Z_zdo=((m_o.*g)./l).*(l_po-q.*h_co);

%==========================================================================
%Sile kocenja napred i pozadi u neopterecenom i opterecenom stanju

%Neoptereceno
Fk_pno=(R./(1+R)).*m_no.*q*10;
Fk_zno=(1./(1+R)).*m_no.*q*10;

%Optereceno
Fk_po=(R./(1+R)).*m_o.*q*10;
Fk_zo=(1./(1+R)).*m_o.*q*10;

%==========================================================================
%Iskorisceno prijanjanje napred i pozadi u slucaju opterecenog i
%neopterecenog stanja 

%Iskorisceno prijanje u opterecenom stanju
phipo=Fk_po./Z_pdo;
phizo=Fk_zo./Z_zdo;

%Iskorisceno prijanje u neopterecenom stanju
phipno=Fk_pno./Z_pdno;
phizno=Fk_zno./Z_zdno;
%==========================================================================
%Crtanje dijagrama krivih iskoriscenog prijanjanja 
q_02=[0.2:0.1:0.8];
phi_02=(q_02+0.07)./(0.85);
q_03=[0.3:0.05:0.45];
phi_03=q_03+0.05;
%Optereceno stanje 
figure(2)
plot(q, phi);
hold on
plot(q, phipo,'-m');
plot(q, phizo,'-k');
gr1=plot(q_02,phi_02);
set(gr1,'color','red','LineWidth',2);
gr2=plot(q_03,phi_03);
set(gr2,'color','yellow','LineWidth',2);
xlabel('q[/]');
ylabel('phi[/]');
hleg1 = legend('\phi =q','\phi_{po}','\phi_{zo}','\phi_{gr1}','\phi_{gr2}');
%Izlaz iz funkcije
%+=========================================================================
PPK2.Z_pdo=Z_pdo;
PPK2.Z_zdo=Z_zdo;
PPK2.Z_pdno=Z_pdno;
PPK2.Z_zdno=Z_zdno;
PPK2.phipo=phipo;
PPK2.phizo=phizo;




