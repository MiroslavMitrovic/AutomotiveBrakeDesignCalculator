function [PPK ] = DataOutput1
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
Rgr1=max(R_dnoext);
Rgr2=min(R_goext);


%Dijagram
figure(1)
hold on
plot(q,R_gno,'--');
plot(q,R_dno);
plot(q,R_do,'-m');
plot(q,R_go,'-c');
axis([0.2 0.8 0 8]);

xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_gno','R_dno','R_do','R_go');
grid on


%Izbor raspodele
%==========================================================================
MaxDozVred = 'Maksimalna dozvoljena vrednost raspodele je  %4.2f \n';
fprintf(MaxDozVred,Rgr2);
MinDozVred = 'Minimalna dozvoljena vrednost raspodele je  %3.4f \n';
fprintf(MinDozVred,Rgr1);
InputStr_R=input('Unesi zeljenu vrednost konstantne raspodele R:  ','s');
R = str2num(InputStr_R);
%izlaz iz programa
%==========================================================================
PPK.R_gno=R_gno;
PPK.R_dno=R_dno;
PPK.R_go=R_go;
PPK.R_do=R_do;
PPK.Rgr1=Rgr1;
PPK.Rgr2=Rgr2;
PPK.R=R;


%Zapisivanje podataka u .xls datoteku
%==========================================================================

A={'R_gno[/]','R_dno[/]', 'R_go[/]' ,'R_do[/]','R_usvojeno[/]'};
At=A';
DataMatlab2XLS = [ R_gno; R_dno; R_go; R_do ];

xlswrite('ProracunKocenja.xls', At, 'Predhodni_proracun_Kocenja'...
, 'A1');

xlswrite('ProracunKocenja.xls', DataMatlab2XLS, 'Predhodni_proracun_Kocenja'...
, 'B1');
xlswrite('ProracunKocenja.xls', R, 'Predhodni_proracun_Kocenja'...
, 'B5');

end

