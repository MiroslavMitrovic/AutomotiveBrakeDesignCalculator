function varargout = GUI_ZavProrBR(varargin)
% GUI_ZAVPRORBR MATLAB code for GUI_ZavProrBR.fig
%      GUI_ZAVPRORBR, by itself, creates a new GUI_ZAVPRORBR or raises the existing
%      singleton*.
%
%      H = GUI_ZAVPRORBR returns the handle to a new GUI_ZAVPRORBR or the handle to
%      the existing singleton*.
%
%      GUI_ZAVPRORBR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ZAVPRORBR.M with the given input arguments.
%
%      GUI_ZAVPRORBR('Property','Value',...) creates a new GUI_ZAVPRORBR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ZavProrBR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ZavProrBR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ZavProrBR

% Last Modified by GUIDE v2.5 22-Feb-2016 18:18:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ZavProrBR_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ZavProrBR_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

%feature('DefaultCharacterSet', 'UTF8')
% --- Executes just before GUI_ZavProrBR is made visible.
function GUI_ZavProrBR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ZavProrBR (see VARARGIN)

% Choose default command line output for GUI_ZavProrBR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%set(handles.Gui_ZAVPRBR, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])

ZavProrBR_Rac               %Racunanje
pres_tacke                  %Presecne tacke fi(q)
PresTackeOgr                %Presecne tacke Fki(q)
axes(handles.slika1)
DiagramBR1                  %Plotovanje prvog dijagrama
axes(handles.slika2)
DijagramBR2                 %Plotovanje drugog dijagrama
axes(handles.slika3)
DijagramBR3                 %Plotovanje treceg dijagrama
axes(handles.slika4)
DijagramBR4                 %Plotovanje cetvrtiog dijagrama

h = waitbar(0,'Molimo da sacekate...');
warn_dialog                 %Prozor upozorenja da li vozilo ispunjava uslove
steps = 1;

for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_ZavProrBR
end



close(h) 


% UIWAIT makes GUI_ZavProrBR wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ZavProrBR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function ZavProrBR_Rac
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
F_p=getappdata(0,'F_pmax');
i_p=getappdata(0,'i_p');
C_sp=getappdata(0,'C_sp');
d_gkc=getappdata(0,'d_gkc');
A_gkc=(d_gkc^2).*(pi./4);
eta_mk=getappdata(0,'eta_m');
A_pkc=getappdata(0,'A_kp');
A_zkc=getappdata(0,'A_kz');
eta_h=getappdata(0,'eta_h');
C_p=getappdata(0,'C_p');
C_z=getappdata(0,'C_z');
d_kcp=getappdata(0,'d_cp');    %[mm]
d_kcz=getappdata(0,'d_cz');    %[mm]    
r_srp=getappdata(0,'r_srp');    %[mm]    
r_srz=getappdata(0,'r_srz');    %[mm]
r_d=getappdata(0,'r_d').*1000;  %[mm]
m_o=getappdata(0,'m_o');        %[kg]
g=10;                           %[m^s^2]
m_no=getappdata(0,'m_no');      %[kg]
l=getappdata(0,'L');            %[m]
l_pno=getappdata(0,'l_pno');    %[m]
l_zno=getappdata(0,'l_zno');    %[m]
l_po=getappdata(0,'l_po');      %[m]
l_zo=getappdata(0,'l_zo');      %[m]
h_co=getappdata(0,'h_co');      %[m]
h_cno=getappdata(0,'h_cno');    %[m]
% f_ped=IK.f_pedale;            %[mm]
phi=0.8;%[/]
    if C_p==0.7
        s_pkc=0.7;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
    else
        s_pkc=2;
    end
    if C_z==0.7
        s_zkc=0.7;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
    else
        s_zkc=2;
    end
s_shgkc=2;  % od 1-2[mm]
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
setappdata(0,'V_kc',V_kc)

V_r =1500;         %zapremina koja uzima u obzir elasticnost creva(1.5-2[cm^3])
setappdata(0,'V_r',V_r)

V_gkc=V_kc+V_r;     %Ukupna radna zapremina kocnog sistema
setappdata(0,'V_gkc',V_gkc)


%Hod glavnog kocnog cilindra[mm]
s_uk=V_gkc./A_gkc;
setappdata(0,'s_uk',s_uk)

%Hod klipa u glavnom kocnom cilindru[mm]
s_gkc=s_uk+s_pkc+s_zkc+s_shgkc;
setappdata(0,'s_gkc',s_gkc)

%Hod pedale [mm]
f_p=s_gkc.*i_p;
setappdata(0,'f_p',f_p)

%Inkrementalno podeljena vrednost F_p 
%==========================================================================
F_pmin=50;
F_pink=25;
F_pmax=F_p;
F_pinc=F_pmin:F_pink:F_pmax;
setappdata(0,'F_pinc',F_pinc)

%Pritisak u prenosnom mehanizmu [MPa]
%==========================================================================
    %Faktor pritiska 
    kp=(4.*i_p.*C_sp.*eta_mk.*eta_h./(((d_gkc.^(2)).*pi)));
    setappdata(0,'kp',kp)
    
    
p_h=kp.*F_pinc;
setappdata(0,'p_h',p_h)

%Sile kocenja po osovinama vozila 
%==========================================================================
            %faktor prednje sile kocenja 
            kfp=2.*C_p.*C_sp.*((d_kcp.^(2)).*r_srp)./((d_gkc).^(2).*r_d)...
                .*i_p.*eta_h.*eta_mk;
            setappdata(0,'kfp',kfp)
            %faktor zadnje sile kocenja 
            kfz=2.*C_z.*C_sp.*((d_kcz.^(2).*r_srz)./((d_gkc).^(2).*r_d))...
                *i_p.*eta_h.*eta_mk;
            setappdata(0,'kfz',kfz)
            
            
F_kp=kfp.*F_pinc;
setappdata(0,'F_kp',F_kp)
F_kz=kfz.*F_pinc;
setappdata(0,'F_kz',F_kz)

            
            
%Ukupna sila kocenja 
%==========================================================================
            %faktor ukupne sile kocenja
            k=kfp+kfz;
            setappdata(0,'k',k)
F_k=k.*F_pinc;
setappdata(0,'F_k',F_k)

%Kocni koeficient za optereceno vozilo 
%==========================================================================
            %faktor kocnog koeficienta 
            kq_o=k./(m_o.*g);
            setappdata(0,'kq_o',kq_o)
q_o=kq_o.*F_pinc;
setappdata(0,'q_o',q_o)


a_o=q_o.*g;
setappdata(0,'a_o',a_o)


%Kocni koeficient za neoptereceno vozilo
%==========================================================================
   %faktor kocnog koeficienta 
            kq_no=k./(m_no.*g);
            setappdata(0,'kq_no',kq_no)
q_no=kq_no.*F_pinc;
setappdata(0,'q_no',q_no)


a_no=q_no.*g;
setappdata(0,'a_no',a_no)

%Dinamicke reakcije na prednjoj i zadnjoj osovini u opterecenom stanju
%==========================================================================

Z_pdo=((m_o.*g)./l).*(l_zo+q_o.*h_co);
setappdata(0,'Z_pdo',Z_pdo)

Z_zdo=((m_o.*g)./l).*(l_po-q_o.*h_co);
setappdata(0,'Z_zdo',Z_zdo)

    %Maksimalna sila kocenja napred i pozadi u opterecenom stanju
    F_pofi=Z_pdo.*phi;
    setappdata(0,'F_pofi',F_pofi)
    F_zofi=Z_zdo.*phi;
    setappdata(0,'F_zofi',F_zofi)
%Dinamicke reakcije na prednjoj i zadnjoj osovini u neopterecenom stanju
%==========================================================================

Z_pdno=((m_no.*g)./l).*(l_zno+q_no.*h_cno);
setappdata(0,'Z_pdno',Z_pdno)
Z_zdno=((m_no.*g)./l).*(l_pno-q_no.*h_cno);
setappdata(0,'Z_zdno',Z_zdno)
%Maksimalna sila kocenja napred i pozadi u neopterecenom stanju
    F_pnofi=Z_pdno.*phi;
    setappdata(0,'F_pnofi',F_pnofi)
    F_znofi=Z_zdno.*phi;
    setappdata(0,'F_znofi',F_znofi)
%Iskorisceno prijanjanje na prednjoj i zadnjoj osovini u opterecenom stanju
%==========================================================================

phi_po=(kfp./Z_pdo).*F_pinc;
setappdata(0,'phi_po',phi_po)
phi_zo=(kfz./Z_zdo).*F_pinc;
setappdata(0,'phi_zo',phi_zo)

%Iskorisceno prijanjanje na prednjoj i zadnjoj osovini u neopt. stanju
%==========================================================================
phi_pno=(kfp./Z_pdno).*F_pinc;
setappdata(0,'phi_pno',phi_pno)
phi_zno=(kfz./Z_zdno).*F_pinc;
setappdata(0,'phi_zno',phi_zno)

% 
% %Dodatak zbog uslova iz GUI_otkaz...

 setappdata(0,'q_okor',0)
 setappdata(0,'q_oogr',0)




function pres_tacke

%Ulazni podaci
q_o=getappdata(0,'q_o');
q_no=getappdata(0,'q_no');
phi_po=getappdata(0,'phi_po');    
phi_zo=getappdata(0,'phi_zo');
phi_pno=getappdata(0,'phi_pno');    
phi_zno=getappdata(0,'phi_zno');



 
%Presecne tacke optereceno stanje
%--------------------------------------------------------------------------
size_qo=size(q_o);
size_qo=size_qo(1,2);
size_phi_po=size(phi_po);
size_phi_po=size_phi_po(1,2);
size_phi_zo=size(phi_zo);
size_phi_zo=size_phi_zo(1,2);

size_q_o=[size_phi_po,size_phi_zo,size_qo];

size_q_o_max=max(size_q_o);
size_q_o_min=min(size_q_o);




[M_o,I_o] = min(size_q_o(:));

[I_row_o, I_col_o] = ind2sub(size(size_q_o),I_o);


%Napraviti poredjenje sa minimalnom vrednosti, i za tu vrednost da se ne
%izbacuju vrednosti iz niza...

size_q_o_min1=size_q_o_min+1;

%Vadjenje podataka iz niza radi nalazenja normalnih presecnih tacaka....
%--------------------------------------------------------------------------
if size_q_o_min~=size_q_o_max
    
    if  I_col_o~=3

        a1=q_o(size_q_o_min1:size_q_o_max);
        q_o(ismember(q_o,a1))=[];

    end

    if  I_col_o~=1

        a2=phi_po(size_q_o_min1:size_q_o_max);
        phi_po(ismember(phi_po,a2))=[];

    end

    if  I_col_o~=2

        a3=phi_zo(size_q_o_min1:size_q_o_max);
        phi_zo(ismember(phi_zo,a3))=[];

    end

    
end

%Vadjenje vrednosti za krivu phi=q...
%--------------------------------------------------------------------------
qvel1=size(q_o);
dimo=qvel1(1,2);
qo_dij_inc=1.2./dimo;
qo_dij=qo_dij_inc:qo_dij_inc:1.2;
phi_oq=qo_dij;



%Provera gde se kriva prednje osovine na athezionom dijagramu sece sa
%linijom q=phi
[qoppr_phi,phi_pogrpr]=curveintersect(q_o,phi_po,qo_dij,phi_oq);

%--------------------------------------------------------------------------

%Provera gde se kriva zadnje osovine na athezionom dijagramu sece sa
%linijom q=phi
[qozpr_phi,phi_zogr]=curveintersect(q_o,phi_zo,qo_dij,phi_oq);  
%--------------------------------------------------------------------------    
%Neoptereceno
%--------------------------------------------------------------------------
size_qno=size(q_no);
size_qno=size_qno(1,2);
size_phi_pno=size(phi_pno);
size_phi_pno=size_phi_pno(1,2);
size_phi_zno=size(phi_zno);
size_phi_zno=size_phi_zno(1,2);

size_q_no=[size_phi_pno,size_phi_zno,size_qno];

size_q_no_max=max(size_q_no);
size_q_no_min=min(size_q_no);


%Vadjenje vrednosti za krivu phi=q...
%--------------------------------------------------------------------------
qvel1_no=size(q_no);
dim_no=qvel1_no(1,2);
qno_dij_inc=1.2./dim_no;
qno_dij=qno_dij_inc:qno_dij_inc:1.2;
phi_noq=qno_dij;



[M_no,I_no] = min(size_q_no(:));

[I_row_no, I_col_no] = ind2sub(size(size_q_no),I_no);


%Napraviti poredjenje sa minimalnom vrednosti, i za tu vrednost da se ne
%izbacuju vrednosti iz niza...

size_q_no_min1=size_q_no_min+1;

%Vadjenje podataka iz niza radi nalazenja normalnih presecnih tacaka....
%--------------------------------------------------------------------------
if size_q_no_min~=size_q_no_max
    
    if  I_col_no~=3

        b1=q_no(size_q_no_min1:size_q_no_max);
        q_no(ismember(q_no,b1))=[];

    end

    if  I_col_no~=1

        b2=phi_pno(size_q_no_min1:size_q_no_max);
        phi_pno(ismember(phi_pno,b2))=[];

    end

    if  I_col_no~=2

        b3=phi_zno(size_q_no_min1:size_q_no_max);
        phi_zno(ismember(phi_zno,b3))=[];

    end

    
end  

%Provera gde se kriva prednje osovine na athezionom dijagramu sece sa
%linijom q=phi

[qnoppr_phi,phi_pnogrprno]=curveintersect(q_no,phi_pno,qno_dij,phi_noq);  


%Provera gde se kriva zadnje osovine na athezionom dijagramu sece sa
%linijom q=phi
[qnozpr_phi,phi_znogr]=curveintersect(q_no,phi_zno,qno_dij,phi_noq);


%Presecne tacke sa krivom    fi=(q1+0.07)./0.85.
%==========================================================================         
%Optereceno

   %Kriva fi=(q1+0.07)./0.85.
    qo1_dij_inc=1.2./dimo;
    qo1_dij=qo1_dij_inc:qo1_dij_inc:1.2;
    phi_oq1=(qo1_dij+0.07)./0.85;

%Presecna tacka
    [qoppr_phi1,phi_pogrpr1]=curveintersect(q_o,phi_po,qo1_dij,phi_oq1);

%Neoptereceno
     %Kriva fi=(q1+0.07)./0.85.
    qno1_dij_inc=1.2./dim_no;
    qno1_dij=qno1_dij_inc:qno1_dij_inc:1.2;
    phi_noq1=(qno1_dij+0.07)./0.85;

%Presecna tacka
[qnoppr_phi1,phi_pnogrpr1]=curveintersect(q_no,phi_pno,qno1_dij,phi_noq1);




%--------------------------------------------------------------------------

   
    %Presecne tacke sa krivom q=phi
    %----------------------------------------------------------------------
   %OVDE JE NASTAO PROBLEM SA PODACIMA JEDAN JE BIO FORMATA 1X2 DOK SU
   %OSTALI BILI 1X1...
    qpprusl=[qoppr_phi, qozpr_phi, qnoppr_phi,qnozpr_phi];
    %Optereceno
    qprus1o=[qoppr_phi, qozpr_phi];
    %Neoptereceno
    qprus1no=[qnoppr_phi,qnozpr_phi];
    
    %Napred ili pozadi, svejedno.
    qpprusl_p=[qoppr_phi, qnoppr_phi];
    
     %Presecne tacke sa krivom fi=(q1+0.07)./0.85
    %----------------------------------------------------------------------
    qpprusl_1=[qoppr_phi1,qnoppr_phi1];
    
    
    if isempty(qpprusl_1)
        %Skalarno
        qpprusl_1_bool=[1,1];  
        %Logicki
        qpprusl_1_bool=(qpprusl_1_bool>0);
    end
    
    
    if qpprusl_1>0
      qpprusl_1_bool=(qpprusl_1<=0);  
    
    end
    
    if  qpprusl>0
        qpr1_bool= (qpprusl_p>=0.8);
    end

  
%Petlja za odredjivanje pocetnih uslova if petlje
%------------------------------------------------------------------------
%Prvo ispitujemo da li se krive uopste seku sa krivom q=fi, ako se ne seku
%onda gledamo maksimalne vrednosti q u opterecenom i neopterecenom stanju i
%odatle posmatramo da li vozilo zadovoljava uslove iz pravilnika

    %Uslov ako se krive ne seku sa krivom q=phi
%--------------------------------------------------------------------------    
    if isempty(qpprusl)
        %Presecna tacka krivih u opterecenom i neopterecenom stanju 
             %Optereceno
            [qoppr_phi,phi_preso]=curveintersect(q_o,phi_po,q_o,phi_zo);
            %Neoptereceno
            [qnoppr_phi,phi_presno]=curveintersect(q_no,phi_pno,q_no,phi_zno);
           
            qpr1=[qoppr_phi,qnoppr_phi];  
    end
    
    if isempty(qprus1o)
       %Presecna tacka krivih u opterecenom i neopterecenom stanju 
             %Optereceno
            [qoppr_phi,phi_preso]=curveintersect(q_o,phi_po,q_o,phi_zo); 
   end
    
    if isempty(qprus1no)
    %Neoptereceno
            [qnoppr_phi,phi_presno]=curveintersect(q_no,phi_pno,q_no,phi_zno);
        
    end
        
      qpr1=[qoppr_phi,qnoppr_phi];

     
   if isempty(qpr1)
                
      qoppr_phi=max(qopres);
      qnoppr_phi=max(qnopres);
      qpr1=[qoppr_phi,qnoppr_phi];
                
   end
   
   if qpr1>0
   
       %Logicki pregled uslova
       qpr1_bool= (qpr1>=0.8);
   
   end
   
   
%Ustanovljavanje da li vozilo ispunjava uslove sto se tice dijagrama fi(q)
%--------------------------------------------------------------------------
n=size(qpprusl_1_bool);
n1=n(1,1);
n2=n(1,2);

if qpr1_bool>0
    
    qpr1_booln=ones(n1,n2);
    
else
    
    qpr1_booln=zeros(n1,n2);
       
end


qpr1_bool=(qpr1_booln>0);

qpr_bool=qpr1_bool&qpprusl_1_bool;
setappdata(0,'qpr_bool',qpr_bool)

function warn_dialog

qpr_bool=getappdata(0,'qpr_bool');



   if qpr_bool>0
   myicon1 = imread('checkmark.png');
h=msgbox('Vozilo zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Informacija!!!','custom',myicon1);
              
   else
     myicon2 = imread('xmark.jpeg');
h=msgbox('Vozilo ne zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Upozorenje!!','custom',myicon2);
            
  


   end
       

%%
function DiagramBR1
%==========================================================================


hold on
axis([0 1.5 0 1.5]);

q1=0.1:0.1:1.2;
phi1=0.1:0.1:1.2;
phi2=(q1+0.07)./0.85;
q_o=getappdata(0,'q_o');
q_no=getappdata(0,'q_no');
phi_po=getappdata(0,'phi_po');
phi_pno=getappdata(0,'phi_pno');
phi_zo=getappdata(0,'phi_zo');
phi_zno=getappdata(0,'phi_zno');


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


function DijagramBR2
%Crtanje dijagrama krivih iskoriscenog prijanjanja u funkciji od pritiska
%aktiviranja
%==========================================================================
q_no=getappdata(0,'q_no');
F_kp=getappdata(0,'F_kp');
F_kz=getappdata(0,'F_kz');
F_k=getappdata(0,'F_k');
F_pnofi=getappdata(0,'F_pnofi');
F_znofi=getappdata(0,'F_znofi');

%axis([0 0.8 0 12000]);
hold on
grid on
xlabel('q[/]');
ylabel('F[N]');
plot(q_no,F_kp,'-c');
plot(q_no,F_kz,'-m');
plot(q_no,F_k,'-k');
plot(q_no,F_pnofi,'-r');
plot(q_no,F_znofi,'-b');
hleg2 = legend('F_kp','F_kz','F_k','F_pnophi',...
'F_znophi');


function DijagramBR3
%Crtanje dijagrama blokiranja kretaca
%==========================================================================

q_o=getappdata(0,'q_o');
F_kp=getappdata(0,'F_kp');
F_kz=getappdata(0,'F_kz');
F_k=getappdata(0,'F_k');
F_pofi=getappdata(0,'F_pofi');
F_zofi=getappdata(0,'F_zofi');

%axis([0 0.8 0 12000]);
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


function DijagramBR4
%Crtanje dijagrama usporenja u funkciji od sile na pedali 
%==========================================================================
getappdata(0,'F_pinco')

a_ostv=getappdata(0,'a_ostvogr');
a_nostv=getappdata(0,'a_nostvogr');
F_pinco=getappdata(0,'F_pincoogr');
F_pincno=getappdata(0,'F_pincnoogr');


hold on
grid on
plot(F_pinco,a_ostv);
plot(F_pincno,a_nostv,'--');


xlabel('F_p[N]');
ylabel('a[m/s^{2}]');
legend('aopt','aneopt')


function PresTackeOgr
%Presecne tacke

%Ulazni podaci
%==========================================================================
q_o=getappdata(0,'q_o');
q_o(isnan(q_o))=0;
q_no=getappdata(0,'q_no');
q_no(isnan(q_no))=0;
F_kp=getappdata(0,'F_kp');
F_kz=getappdata(0,'F_kz');
F_pofi=getappdata(0,'F_pofi');
F_pofi(isnan(F_pofi))=0;
F_zofi=getappdata(0,'F_zofi');
F_zofi(isnan(F_zofi))=0;
F_pnofi=getappdata(0,'F_pnofi');
F_pnofi(isnan(F_pnofi))=0;
F_znofi=getappdata(0,'F_znofi');
F_znofi(isnan(F_znofi))=0;
a_o=getappdata(0,'a_o');
a_o(isnan(a_o))=0;
a_no=getappdata(0,'a_no');
a_no(isnan(a_no))=0;
F_pinc=getappdata(0,'F_pinc');


%Presecne tacke su resene tako sto se prvo pogleda koja kriva ima najmanji
%niz, i prema njoj se u ostalim krivim vade clanovi niza koji su visak...

size_qo=size(q_o);
size_qo=size_qo(1,2);
size_F_kp=size(F_kp);
size_F_kp=size_F_kp(1,2);
size_F_pofi=size(F_pofi);
size_F_pofi=size_F_pofi(1,2);
size_F_kz=size(F_kz);
size_F_kz=size_F_kz(1,2);
size_F_zofi=size(F_zofi);
size_F_zofi=size_F_zofi(1,2);

size_o=[size_F_zofi,size_F_kz,size_F_pofi,size_F_kp,size_qo];

size_o_max=max(size_o);
size_o_min=min(size_o);

size_o_total=size_o_max-size_o_min;


[M_o,I_o] = min(size_o(:));

[I_row_o, I_col_o] = ind2sub(size(size_o),I_o);


%Napraviti poredjenje sa minimalnom vrednosti, i za tu vrednost da se ne
%izbacuju vrednosti iz niza...

size_o_min1=size_o_min+1;

%Vadjenje podataka iz niza radi nalazenja normalnih presecnih tacaka....
%--------------------------------------------------------------------------
if size_o_min~=size_o_max
    
    if  I_col_o~=5

        a1=q_o(size_o_min1:size_o_max);
        q_o(ismember(q_o,a1))=[];

    end

    if  I_col_o~=4

        a2=F_kp(size_o_min1:size_o_max);
        F_kp(ismember(F_kp,a2))=[];

    end

    if  I_col_o~=3

        a3=F_pofi(size_o_min1:size_o_max);
        F_pofi(ismember(F_pofi,a3))=[];

    end

    if I_col_o~=2

        a4=F_kz(size_o_min1:size_o_max);
        F_kz(ismember(F_kz,a4))=[];

    end

    if I_col_o~=1

        a5=F_zofi(size_o_min1:size_o_max);
        F_zofi(ismember(F_zofi,a5))=[];


    end
    
end



%==========================================================================
%Optereceno



[qoppr,Fppr]=curveintersect(q_o,F_kp,q_o,F_pofi);  

   
[qozpr,Fzpr]=curveintersect(q_o,F_kz,q_o,F_zofi);  

qopres=[qoppr,qozpr];


%Stavljeno 1.5 radi pretpostavke da u slucaju ne blokiranja kretaca vozilo
%nece dostici vrednost od 1g na toj osovini...
   


    if isempty(qoppr)
        
        if isempty(qozpr)
        
            qozpr=1.5;
        
            qopr=max(q_o);
        
        end
      
        qoppr=1.5;
        
        
    end
    
    
     if isempty(qozpr)
        
        if isempty(qoppr)
        
            qoppr=1.5;
        
            qopr=max(q_o);
        
        end
      
        qozpr=1.5;
        
        
    end
    




    
   
    %Dodavane vrednosti za pisanje upozorenja na ekranu.
     qobool=logical(0);
        
    if qoppr>qozpr
        
        qopr=qozpr;
        qobool=logical(1);
      
    else
        
        if qoppr<qozpr
        
            qopr=qoppr;
     
        end
     
    end
    
    
    
%Neoptereceno
%==========================================================================
size_qno=size(q_no);
size_qno=size_qno(1,2);
size_F_kp=size(F_kp);
size_F_kp=size_F_kp(1,2);
size_F_pnofi=size(F_pnofi);
size_F_pnofi=size_F_pnofi(1,2);
size_F_kz=size(F_kz);
size_F_kz=size_F_kz(1,2);
size_F_znofi=size(F_znofi);
size_F_znofi=size_F_znofi(1,2);

size_no=[size_F_znofi,size_F_kz,size_F_pnofi,size_F_kp,size_qno];

[M_no,I_no] = min(size_no(:));

[I_row_no, I_col_no] = ind2sub(size(size_no),I_no);

size_no_max=max(size_no);
size_no_min=min(size_no);

%Napraviti poredjenje sa minimalnom vrednosti, i za tu vrednost da se ne
%izbacuju vrednosti iz niza...

size_no_total=size_no_max-size_no_min;

size_no_n=size_no_max-size_no_total;

size_no_min1=size_no_min+1;

%Vadjenje podataka iz niza radi nalazenja normalnih presecnih tacaka....
%--------------------------------------------------------------------------
if size_no_min~=size_no_max
    
    if  I_col_no~=5

        b1=q_no(size_no_min1:size_no_max);
        q_no(ismember(q_no,b1))=[];

    end

    if  I_col_no~=4

        b2=F_kp(size_no_min1:size_no_max);
        F_kp(ismember(F_kp,b2))=[];

    end

    if  I_col_no~=3

        b3=F_pnofi(size_no_min1:size_no_max);
        F_pnofi(ismember(F_pnofi,b3))=[];

    end

    if I_col_no~=2

        b4=F_kz(size_no_min1:size_no_max);
        F_kz(ismember(F_kz,b4))=[];

    end

    if I_col_no~=1

        b5=F_znofi(size_no_min1:size_no_max);
        F_znofi(ismember(F_znofi,b5))=[];


    end
    
end
   

%Neoptereceno
[qnoppr,Fppr]=curveintersect(q_no,F_kp,q_no,F_pnofi);  

[qnozpr,Fzpr]=curveintersect(q_no,F_kz,q_no,F_znofi);

qnopres=[qnoppr,qnozpr];






%Stavljeno 1.5 radi pretpostavke da u slucaju ne blokiranja kretaca vozilo
%nece dostici vrednost od 1g na toj osovini...     
        
            if isempty(qnoppr)
                
                 if isempty(qnozpr)
        
                qnozpr=1.5;
                
                qnopr=max(q_no);
                 
                end
        
            qnoppr=1.5;
        
            end
            
            
            if isempty(qnozpr)
                
                 if isempty(qnoppr)
        
                qnoppr=1.5;
                
                qnopr=max(q_no);
                 
                end
        
            qnozpr=1.5;
        
            end
    
           
        
       
     %Videti ovaj uslov sto stoji ovde....   
    qnobool=logical(0);
        
    if qnoppr>qnozpr
        
        qnopr=qnozpr;
        qnobool=logical(1);
       
                 
    else
        
         if qnoppr<qnozpr
        
                qnopr=qnoppr;
         
         end
     
    end
        
   
        
     qbool=[qobool,qnobool];   
    

     if qbool>0
     
     myicon = imread('xmark.jpeg');
     h=msgbox('Prvo ce blokirati zadnji tockovi vozila a to ce prouzrokovati nestabilnost vozila','Upozorenje!!','custom',myicon);    
          
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
setappdata(0,'a_ostvogr',a_ostv)
F_pincoInt=interp1(a_o,F_pinc,a_omax);
F_pinco=F_pinc(F_pinc<F_pincoInt);
fno=size(F_pinco);
fno=fno(1,2);
fno1=fno+1;
F_pinco(1,fno1)=F_pincoInt;
setappdata(0,'F_pincoogr',F_pinco)

%Neoptereceno
a_nomax=qnopr*10;
a_nostv=a_no(a_no<a_nomax);
nno=size(a_nostv);
nno=nno(1,2);
nno1=nno+1;
a_nostv(1,nno1)=a_nomax;
setappdata(0,'a_nostvogr',a_nostv)
F_pincnoInt=interp1(a_no,F_pinc,a_nomax);
F_pincno=F_pinc(F_pinc<F_pincnoInt);
fnno=size(F_pincno);
fnno=fnno(1,2);
fnno1=fnno+1;
F_pincno(1,fnno1)=F_pincnoInt;
setappdata(0,'F_pincnoogr',F_pincno)


function print_ZavProrBR

F_gkc2=getappdata(0,'F_gkc');
V_kc=getappdata(0,'V_kc');
V_r=getappdata(0,'V_r');
V_gkc=getappdata(0,'V_gkc');
d_gkc=getappdata(0,'d_gkc');
A_gkc=((d_gkc.^2).*pi)/4;
kp=getappdata(0,'kp');
kfp=getappdata(0,'kfp');
kfz=getappdata(0,'kfz');
k=getappdata(0,'k');
kq_no=getappdata(0,'kq_no');
kq_o=getappdata(0,'kq_o');
s_gkc=getappdata(0,'s_gkc');
f_p=getappdata(0,'f_p');
p_h=getappdata(0,'p_h');
F_kp=getappdata(0,'F_kp');
F_kz=getappdata(0,'F_kz');
F_k=getappdata(0,'F_k');
q_no=getappdata(0,'q_no');
q_o=getappdata(0,'q_o');
Z_pdo=getappdata(0,'Z_pdo');
Z_zdo=getappdata(0,'Z_zdo');
Z_pdno=getappdata(0,'Z_pdno');
Z_zdno=getappdata(0,'Z_zdno');
phi_po=getappdata(0,'phi_po');
phi_zo=getappdata(0,'phi_zo');
phi_pno=getappdata(0,'phi_pno');
phi_zno=getappdata(0,'phi_zno');
F_pinc=getappdata(0,'F_pinc');
a_o=getappdata(0,'a_o');
a_no=getappdata(0,'a_no');
a_ostv=getappdata(0,'a_ostvogr');
a_nostv=getappdata(0,'a_nostvogr');
F_pinco=getappdata(0,'F_pincoogr');
F_pincno=getappdata(0,'F_pincnoogr');


C=getappdata(0,'xls_ime_xls');




DataMatlab2XLS = {'F_gkc[N]', 'V_kc[mm^3]','V_r[mm^3]','V_gkc[mm^3]', 'A_gkc[mm^2]',...
    'd_gkc[mm]','k_p[/]','kfp[/]','kfz[/]','k[/]','kq_no[/]','kq_o[/]','s_gkc[mm]'...
    ,'f_p[mm]';F_gkc2 V_kc V_r V_gkc  A_gkc d_gkc kp kfp kfz k kq_no kq_o s_gkc, f_p};
DataMatlab2XLSt=DataMatlab2XLS';
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt,'ZavProrBezReg','A1');


A={'p_h[MPa]','F_kp[N]', 'F_kz[N]' ,'F_k[N]','q_no[/]','q_o[/]','Z_pdo[N]','Z_zdo[N]',...
    'Z_pdno[N]','Z_zdno[N]','phi_po[/]','phi_zo[/]','phi_pno[/]','phi_zno[/]'...
    ,'F_pinc[N]','a_o[m/s^2]','a_no[m/s^2]','F_pincostv[N]'...
    'a_ostv[m/s^2]','F_pincnostv[N]','a_nostv[m/s^2]'};
At=A';
DataMatlab2XLS = [p_h ;F_kp; F_kz; F_k ;q_no ;q_o ;Z_pdo ;Z_zdo... 
    ;Z_pdno ;Z_zdno;phi_po; phi_zo; phi_pno; phi_zno; F_pinc; a_o;...
    a_no];
% 
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At,'ZavProrBezReg','D1');
% 
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS, 'ZavProrBezReg','E1');

X=[F_pinco;a_ostv];
xlswrite(C, X, 'ZavProrBezReg','E18');
Y=[F_pincno;a_nostv];
xlswrite(C, Y, 'ZavProrBezReg','E20');
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close()
GUI_Otkaz