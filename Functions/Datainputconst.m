function [ UlPod ] = Datainputconst
%Ulazni podaci 
%--------------------------------------------------------------------------
%m_o                [kg]    ukupna masa opterecenog vozila
%l                  [m]     osovinsko rastojanje 
%rd                 [m]     dinamicki poluprecnik tocka 
%m_no               [kg]    masa vozila u neopterecenom stanju
%l_pno              [m]     rastojanje tezista do prednje osovine(neopt) 
%l_zno              [m]     rastojanje tezista do zadnje osovine(neopt)
%h_cno              [m]     visina tezista u neopterecenom stanju 
%l_po               [m]     rastojanje tezista do prednje osovine(opt)
%l_zo               [m]     rastojanje tezista do zadnje osovine(opt)
%h_co               [m]     visina tezista u opterecenom stanju 
%a_max              [m/s^2] najvece racunsko usporenje vozila pri kocenju 
%F_pmax             [N]     najveca dozvoljena sila na komandi rad. kocnice
%q_max              [/]     najveca moguca vrednost kocnog koeficienta 
%F_ku               [N]     najveca vrednost ukupne sile kocenja 
%R                  [/]     raspodela ukupne sile kocenja po osovinama 
%delta              [/]     koeficient translatornih i obrtnih masa
%g                  [m/s^2] gravitaciona konstanta    
%i_uk               [/]     ukupni prenosni odnos mehanizma za radno
%kocenje
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
F_pmax=500;
m_o=1575;
l=2.422;
rd=0.308;
m_no=1205;
l_pno=1.201;
l_zno=1.221;
h_cno=0.45;
l_po=1.351;
l_zo=1.071;
h_co=0.5;
a_max=8;
g=10;
q_max=a_max./g;
delta=1;
F_ku=delta.*m_o.*g.*q_max;
%%
%Izlazi iz funkcije 
%==========================================================================
UlPod.m_o=m_o;
UlPod.l=l;
UlPod.rd=rd;
UlPod.m_no=m_no;
UlPod.l_pno=l_pno;
UlPod.l_zno=l_zno;
UlPod.h_cno=h_cno;
UlPod.l_po=l_po;
UlPod.l_zo=l_zo;
UlPod.h_co=h_co;
UlPod.a_max=a_max;
UlPod.g=g;
UlPod.q_max=q_max;
UlPod.delta=delta;
UlPod.F_ku=F_ku;
UlPod.F_pmax=F_pmax;
%Zapisivanje podataka u .xls datoteku
%==========================================================================
DataMatlab2XLS = {'Fpmax[N]', 'm_o[kg]','l[m]','rd[m]', 'm_no[kg]', 'l_pno[m]'...
    ,'l_zno[m]','h_cno[m]','l_po[m]','l_zo[m]','h_co[m]','a_max[m/s^2]','delta[/]'...
    ,'F_ku[N]','F_pmax[N]'; F_pmax m_o l rd m_no l_pno l_zno h_cno l_po l_zo h_co...
    a_max delta F_ku F_pmax};
DataMatlab2XLSt=DataMatlab2XLS';
xlswrite('ProracunKocenja.xls', DataMatlab2XLSt, 'Ulazni_podaci', 'A1');


end

