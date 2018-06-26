function [PPK3 ] = DataOutput8
%%Funkcija koja racuna prethodni proracun 
%Odredjivanje raspodele sile kocenja R pomocu inverzije uslova za
%iskorisceno prijanjanje iz dijagrama 1a UNECE pravilnika broj 13, prilog 10
%R_g    [/] Gornja vrednost raspodele 
%R_d    [/] Donja vrednost raspodele 
%Raspodela se racuna i za optereceno i neoptereceno stanje
global UlPod
%%Ulazni Podaci 
l=UlPod.l;
rd=UlPod.rd;
m_o=UlPod.m_o;
m_no=UlPod.m_no;
l_pno=UlPod.l_pno;
l_zno=UlPod.l_zno;
h_cno=UlPod.h_cno;
l_po=UlPod.l_po;
l_zo=UlPod.l_zo;
h_co=UlPod.h_co;
a_max=UlPod.a_max;
g=UlPod.g;
q_max=UlPod.q_max;
F_ku=UlPod.F_ku;

q=[0:0.1:0.8];

%Proracun i dijagram raspodele za neoptereceno vozilo 

R_gno=((q+0.07).*(l_zno+q.*h_cno))./((0.85.*l.*q)-(q+0.07).*(l_zno+q.*h_cno));
    R_gno>0;
    R_gnoext=R_gno(R_gno>0);

R_dno=(l_zno+(q.*h_cno))./(l_pno-(q.*h_cno));
    R_dno>0;
    R_dnoext=R_dno(R_dno>0);

%Poracun i dijagram raspodele za optereceno vozilo 

R_go=((q+0.07).*(l_zo+q.*h_co))./((0.85.*l.*q)-(q+0.07).*(l_zo+q.*h_co));
    R_go>0;
    R_goext=R_go(R_go>0);
R_do=(l_zo+(q.*h_co))./(l_po-(q.*h_co));
    R_do>0;
    R_doext=R_do(R_do>0);
%Odredjivanje ekstremnih vrednosti
Rgrno1=max(R_dnoext);
Rgrno2=min(R_gnoext);

Rgro1=max(R_doext);
Rgro2=min(R_goext);

%Dijagram
figure(1)
hold on
plot(q,R_gno,'--');
plot(q,R_dno);
xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_gno','R_dno');
grid on
axis([0.2 0.8 0 8]);
%==========================================================================
figure(2)
hold on
plot(q,R_do,'-m');
plot(q,R_go,'-c');
axis([0.2 0.8 0 8]);

xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_do','R_go');
grid on
%Izbor konacno usvojenih raspodela 
%%==========================================================================
MaxDozVred = 'Maksimalna dozvoljena vrednost raspodele neopterecenog vozila je  %4.2f \n';
fprintf(MaxDozVred,Rgrno2);
MinDozVred = 'Minimalna dozvoljena vrednost raspodele neopterecenog vozila  je  %3.4f \n';
fprintf(MinDozVred,Rgrno1);
InputStr_Rno=input('Unesi zeljenu vrednost konstantne raspodele Rno:  ','s');
Rno = str2num(InputStr_Rno);
%---------------------------------------------------------------------------
MaxDozVred = 'Maksimalna dozvoljena vrednost raspodele opterecenog vozila je  %4.2f \n';
fprintf(MaxDozVred,Rgro2);
MinDozVred = 'Minimalna dozvoljena vrednost raspodele opterecenog vozila  je  %3.4f \n';
fprintf(MinDozVred,Rgro1);
InputStr_Ro=input('Unesi zeljenu vrednost konstantne raspodele Ro:  ','s');
Ro = str2num(InputStr_Ro);

%Konstanta korektora kocenja
%==========================================================================
K=Ro./Rno;

%Izlaz iz funkcije
%==========================================================================
PPK3.R_gno=R_gno;
PPK3.R_dno=R_dno;
PPK3.R_go=R_go;
PPK3.R_do=R_do;

PPK3.Ro=Ro;
PPK3.Rno=Rno;
PPK3.K=K;


