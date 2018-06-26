function varargout = GUI_Otkaz(varargin)
% GUI_OTKAZ MATLAB code for GUI_Otkaz.fig
%      GUI_OTKAZ, by itself, creates a new GUI_OTKAZ or raises the existing
%      singleton*.
%
%      H = GUI_OTKAZ returns the handle to a new GUI_OTKAZ or the handle to
%      the existing singleton*.
%
%      GUI_OTKAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_OTKAZ.M with the given input arguments.
%
%      GUI_OTKAZ('Property','Value',...) creates a new GUI_OTKAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Otkaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Otkaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Otkaz

% Last Modified by GUIDE v2.5 14-Dec-2015 21:15:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Otkaz_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Otkaz_OutputFcn, ...
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
% --- Executes just before GUI_Otkaz is made visible.
function GUI_Otkaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Otkaz (see VARARGIN)

% Choose default command line output for GUI_Otkaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%set(handles.Gui_ZAVPRBR, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])

ZavPror_Rac               %Racunanje
axes(handles.slika1)
DiagramBR1                  %Plotovanje prvog dijagrama
axes(handles.slika2)
DiagramBR2                 %Plotovanje drugog dijagrama
axes(handles.slika3)        
DiagramBR3                 %Plotovanje treceg dijagrama

axes(handles.slika4)  
DiagramBR4                 %Plotovanje treceg dijagrama

h = waitbar(0,'Molimo da sacekate...');
warn_dialog                 %Prozor upozorenja da li vozilo ispunjava uslove
steps = 1;

for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_otk
end
close(h) 


% UIWAIT makes GUI_Otkaz wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Otkaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function ZavPror_Rac
%%
%Velicine 
%==========================================================================
%F_kp               [N]     Sila kocenja na prednjoj osovini 
%F_kz               [N]     Sila kocenja na zadnjoj osovini 
%q_op               [/]     Kocni koeficient za optereceno vozilo 
%q_no               [/]     Kocni koeficient za neoptereceno vozilo 
%Z_pd               [N]     Dinamicke reakcije na prednjoj osovini 
%Z_zd               [N]     Dinamicke reakcije na zadnjoj osovini 
%phi_p              [/]     Iskorisceno prijanjanje na prednjoj osovini
%phi_z              [/]     Iskorisceno prijanjanje na zadnjoj osovini
%m_o                [kg]    Masa opterecenog vozila 
%==========================================================================
%%
%Ulazni podaci 
%==========================================================================
l=getappdata(0,'L');
lpo=getappdata(0,'l_po');
lzo=getappdata(0,'l_zo');
hco=getappdata(0,'h_co');
lpno=getappdata(0,'l_pno');
lzno=getappdata(0,'l_zno');
hcno=getappdata(0,'h_cno');
phi=0.8;
%Bez regulacije
q_bro=getappdata(0,'q_o');
m_o=getappdata(0,'m_o');
m_no=getappdata(0,'m_no');
%Sa ogranicivacem pritiska
q_sr1=getappdata(0,'q_oogr');
q_sr1(isnan(q_sr1))=0;
%Sa ARSK
q_sr2=getappdata(0,'q_okor');
q_sr2(isnan(q_sr2))=0;

if max(q_bro)>0
    
    sw_value=1;
end

if max(q_sr1)>0
    
    sw_value=2;
end

if max(q_sr2)>0
    
    sw_value=3;
end

setappdata(0,'sw_value',sw_value)

switch sw_value
    
    case 1
        
        
        Fkp_br=getappdata(0,'F_kp');
        Fkz_br=getappdata(0,'F_kz');
             
        setappdata(0,'F_kp',Fkp_br)
        setappdata(0,'F_kz',Fkz_br)
        %Otkaz prednjeg kocnog kruga
        q_otkpo=(Fkz_br)./(m_o.*10);
        q_otkpno=(Fkz_br)./(m_no.*10);
        Zzd_bro=((m_o.*10)./l).*(lpo-(q_otkpo.*hco));
        Zzd_brno=((m_no.*10)./l).*(lpno-(q_otkpno.*hcno));
        F_zphio=Zzd_bro.*phi;
        F_zphino=Zzd_brno.*phi;
       
    
        
        %Otkaz zadnjeg kocnog kruga
        q_otkzo=(Fkp_br)./(m_o.*10);
        q_otkzno=(Fkp_br)./(m_no.*10);
        Zpd_bro=((m_o.*10)./l).*(lzo+(q_otkzo.*hco));
        Zpd_brno=((m_no.*10)./l).*(lzno+(q_otkzno.*hcno));
        F_pphio=Zpd_bro.*phi;
        F_pphino=Zpd_brno.*phi;

    case 2
        
        Fkp_sr1=getappdata(0,'F_kpogr');
        Fkp_sr1(isnan( Fkp_sr1))=0;
        Fkz_sr1=getappdata(0,'F_kzogr');
        Fkz_sr1(isnan(Fkz_sr1))=0;
        setappdata(0,'F_kp',Fkp_sr1)
        setappdata(0,'F_kz',Fkz_sr1)
%         Zpdo_sr1=getappdata(0,'Z_pdoogr');
%         Zpdo_sr1(isnan(Zpdo_sr1))=0;      
%         Zzdo_sr1=getappdata(0,'Z_zdoogr');
%         Zzdo_sr1(isnan(Zzdo_sr1))=0;
        %Otkaz prednjeg kocnog kruga
        q_otkpo=(Fkz_sr1)./(m_o.*10);
        q_otkpno=(Fkz_sr1)./(m_no.*10);
        Zzd_bro=((m_o.*10)./l).*(lpo-(q_otkpo.*hco));
        Zzd_brno=((m_no.*10)./l).*(lpno-(q_otkpno.*hcno));
        F_zphio=Zzd_bro.*phi;
        F_zphino=Zzd_brno.*phi;
%         phi_otkp=Fkz_sr1./(Zzdo_sr1);
        %Otkaz zadnjeg kocnog kruga
        q_otkzo=(Fkp_sr1)./(m_o.*10);
        q_otkzno=(Fkp_sr1)./(m_no.*10);
        Zpd_bro=((m_o.*10)./l).*(lzo+(q_otkzo.*hco));
        Zpd_brno=((m_no.*10)./l).*(lzno+(q_otkzno.*hcno));
        F_pphio=Zpd_bro.*phi;
        F_pphino=Zpd_brno.*phi;
%       phi_otkz=Fkp_sr1./(Zpdo_sr1);
        
      


    case 3
        
        Fkp_sr2o=getappdata(0,'F_kpkoropt');
        Fkp_sr2o(isnan( Fkp_sr2o))=0;
        Fkz_sr2o=getappdata(0,'F_kzkoropt');
        Fkz_sr2o(isnan(Fkz_sr2o))=0;
        Fkp_sr2no=getappdata(0,'F_kpkorneopt');
        Fkp_sr2no(isnan( Fkp_sr2no))=0;
        Fkz_sr2no=getappdata(0,'F_kzkorneopt');
        Fkz_sr2no(isnan(Fkz_sr2no))=0;
        
        setappdata(0,'F_kposr2',Fkp_sr2o)
        setappdata(0,'F_kzosr2',Fkz_sr2o)
        setappdata(0,'F_kpnosr2',Fkp_sr2no)
        setappdata(0,'F_kznosr2',Fkz_sr2no)
%         Zpdo_sr2=getappdata(0,'Z_pdokor');
%         Zpdo_sr2(isnan(Zpdo_sr2))=0;
%         Zzdo_sr2=getappdata(0,'Z_zdokor');
%         Zzdo_sr2(isnan(Zzdo_sr2))=0;
        
         %Otkaz prednjeg kocnog kruga
        q_otkpo=(Fkz_sr2o)./(m_o.*10);
        q_otkpno=(Fkz_sr2no)./(m_no.*10);
        Zzd_bro=((m_o.*10)./l).*(lpo-(q_otkpo.*hco));
        Zzd_brno=((m_no.*10)./l).*(lpno-(q_otkpno.*hcno));
        F_zphio=Zzd_bro.*phi;
        F_zphino=Zzd_brno.*phi;
%         phi_otkp=Fkz_sr2./(Zzdo_sr2);
        %Otkaz zadnjeg kocnog kruga
        q_otkzo=(Fkp_sr2o)./(m_o.*10);
        q_otkzno=(Fkp_sr2no)./(m_no.*10);
        Zpd_bro=((m_o.*10)./l).*(lzo+(q_otkzo.*hco));
        Zpd_brno=((m_no.*10)./l).*(lzno+(q_otkzno.*hcno));
        F_pphio=Zpd_bro.*phi;
        F_pphino=Zpd_brno.*phi;
%         phi_otkz=Fkp_sr2./(Zpdo_sr2);
        

end

setappdata(0,'q_otkpo',q_otkpo)
setappdata(0,'q_otkpno',q_otkpno)
setappdata(0,'q_otkzo',q_otkzo)
setappdata(0,'q_otkzno',q_otkzno)
setappdata(0,'Zzd_bro',Zzd_bro)
setappdata(0,'Zzd_brno',Zzd_brno)
setappdata(0,'Zpd_bro',Zpd_bro)
setappdata(0,'Zpd_brno',Zpd_brno)
setappdata(0,'F_zphio',F_zphio)
setappdata(0,'F_zphino',F_zphino)
setappdata(0,'F_pphio',F_pphio)
setappdata(0,'F_pphino',F_pphino)


function warn_dialog

q_po=getappdata(0,'q_otkpo');
q_pno=getappdata(0,'q_otkpno');
q_zo=getappdata(0,'q_otkzo');
q_zno=getappdata(0,'q_otkzno');

q_okt=[max(q_po),max(q_zo),max(q_pno),max(q_zno)];

qpr_bool=(q_okt>0.15);

   if qpr_bool>0
   
   myicon1 = imread('checkmark.png');
    h=msgbox('Vozilo zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Informacija!!!','custom',myicon1);
              
   else
     myicon2 = imread('xmark.jpeg');
    h=msgbox('Vozilo ne zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Upozorenje!!','custom',myicon2);
            
   end
       

%%
function DiagramBR1 %OTKAZ PREDNJEG KOCNOG KRUGA OPTERECENO
%==========================================================================
sw_value=getappdata(0,'sw_value');

q_otkpo=getappdata(0,'q_otkpo');
F_zphio=getappdata(0,'F_zphio');

switch sw_value 
    
    case 1
          Fkz_br=getappdata(0,'F_kz');
          Fkzo=Fkz_br;
          
    case 2
        
       
        Fkz_sr1=getappdata(0,'F_kzogr');
        Fkz_sr1(isnan(Fkz_sr1))=0;
        Fkzo=Fkz_sr1;
    case 3
              
        Fkz_sr2=getappdata(0,'F_kzkoropt');
        Fkz_sr2(isnan(Fkz_sr2))=0;
        Fkzo=Fkz_sr2;
end
        
        

hold on

plot(q_otkpo,Fkzo,'-c')
plot(q_otkpo,F_zphio,'-r')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('Fkzopt','Fzphiopt')

function DiagramBR2 %OTKAZ PREDNJEG KOCNOG KRUGA NEOPTERECENO
%==========================================================================
sw_value=getappdata(0,'sw_value');
q_otkpno=getappdata(0,'q_otkpno');
F_zphino=getappdata(0,'F_zphino');

switch sw_value 
    
    case 1
          Fkz_br=getappdata(0,'F_kz');
          Fkzno=Fkz_br;
          
    case 2
        
        Fkz_sr1=getappdata(0,'F_kzogr');
        Fkz_sr1(isnan(Fkz_sr1))=0;
        Fkzno=Fkz_sr1;
    case 3
              
        Fkz_sr2no=getappdata(0,'F_kzkorneopt');
        Fkz_sr2no(isnan(Fkz_sr2no))=0;
        Fkzno=Fkz_sr2no;
end
        


hold on

plot(q_otkpno,Fkzno,'--c')
plot(q_otkpno,F_zphino,'--r')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('Fkzneopt','Fzphineopt')

function DiagramBR3 %OTKAZ ZADNJEG KOCNOG KRUGA OPTERECENO
%==========================================================================
sw_value=getappdata(0,'sw_value');

q_otkzo=getappdata(0,'q_otkzo');
F_pphio=getappdata(0,'F_pphio');

switch sw_value 
    
    case 1
          Fkp_br=getappdata(0,'F_kp');
          Fkpo=Fkp_br;
          
    case 2
        
       
        Fkp_sr1=getappdata(0,'F_kpogr');
        Fkp_sr1(isnan(Fkp_sr1))=0;
        Fkpo=Fkp_sr1;
    case 3
              
        Fkp_sr2=getappdata(0,'F_kposr2');
        Fkp_sr2(isnan(Fkp_sr2))=0;
        Fkpo=Fkp_sr2;
end
        
        

hold on

plot(q_otkzo,Fkpo,'-b')
plot(q_otkzo,F_pphio,'-m')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('Fkpopt','Fpphiopt')

function DiagramBR4 %OTKAZ ZADNJEG KOCNOG KRUGA NEOPTERECENO
%==========================================================================
sw_value=getappdata(0,'sw_value');
q_otkzno=getappdata(0,'q_otkzno');
F_pphino=getappdata(0,'F_pphino');

switch sw_value 
    
    case 1
          Fkp_br=getappdata(0,'F_kp');
          Fkpno=Fkp_br;
          
    case 2
        
        Fkp_sr1=getappdata(0,'F_kpogr');
        Fkp_sr1(isnan(Fkp_sr1))=0;
        Fkpno=Fkp_sr1;
    case 3
              
        Fkp_sr2no=getappdata(0,'F_kpnosr2');
        Fkp_sr2no(isnan(Fkp_sr2no))=0;
        Fkpno=Fkp_sr2no;
end
        


hold on

plot(q_otkzno,Fkpno,'--b')
plot(q_otkzno,F_pphino,'--m')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('Fkpneopt','Fpphineopt')









function print_otk

q_otkpo=getappdata(0,'q_otkpo');
q_otkpno=getappdata(0,'q_otkpno');
q_otkzo=getappdata(0,'q_otkzo');
q_otkzno=getappdata(0,'q_otkzno');
F_zphio=getappdata(0,'F_zphio');
F_zphino=getappdata(0,'F_zphino');
F_pphio=getappdata(0,'F_pphio');
F_pphino=getappdata(0,'F_pphino');
F_kpo=getappdata(0,'F_kposr2');
F_kzo=getappdata(0,'F_kzosr2');
F_kpno=getappdata(0,'F_kpnosr2');
F_kzno=getappdata(0,'F_kznosr2');
F_kp=getappdata(0,'F_kp');
F_kz=getappdata(0,'F_kz');

kor=[F_kpo,F_kzo,F_kpno,F_kzno];
F_k=[F_kp, F_kz];

if isempty(kor)
    
    F_kpo=zeros(1,10);
    F_kzo=zeros(1,10);
    F_kpno=zeros(1,10);
    F_kzno=zeros(1,10);
    
end

if isempty(F_k)
    
    F_kp=zeros(1,10);
    F_kz=zeros(1,10);
    
end




C=getappdata(0,'xls_ime_xls');
nule=zeros([100,100]);
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'OtkaziKocnihKrugova','A1');



DataMatlab2XLS = {'F_kp[N]', 'F_kz[N]','F_kpo[N]', 'F_kzo[N]','F_kpno[N]', 'F_kzno[N]','F_pphio[N]','F_zphio[N]', 'F_pphino[N]',...
    'F_zphino[N]','q_otkpo[/]','q_otkzo[/]','q_otkpno[/]','q_otkzno[/]';F_kp, F_kz,F_kpo, F_kzo,F_kpno, F_kzno,  F_pphio, F_zphio,F_pphino,...
    F_zphino, q_otkpo, q_otkzo, q_otkpno, q_otkzno};
DataMatlab2XLSt=DataMatlab2XLS';
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt,'OtkaziKocnihKrugova','A1');
  xlswrite(C, F_kp,'OtkaziKocnihKrugova','B1');
  xlswrite(C, F_kz,'OtkaziKocnihKrugova','B2');
  xlswrite(C, F_kpo,'OtkaziKocnihKrugova','B3');
  xlswrite(C, F_kzo,'OtkaziKocnihKrugova','B4');
  xlswrite(C, F_kpno,'OtkaziKocnihKrugova','B5');
  xlswrite(C, F_kzno,'OtkaziKocnihKrugova','B6');
  xlswrite(C, F_pphio,'OtkaziKocnihKrugova','B7');
  xlswrite(C, F_zphio,'OtkaziKocnihKrugova','B8');
  xlswrite(C, F_pphino,'OtkaziKocnihKrugova','B9');
  xlswrite(C, F_zphino,'OtkaziKocnihKrugova','B10');
  xlswrite(C, q_otkpo,'OtkaziKocnihKrugova','B11');
  xlswrite(C, q_otkzo,'OtkaziKocnihKrugova','B12');
  xlswrite(C, q_otkpno,'OtkaziKocnihKrugova','B13');
  xlswrite(C, q_otkzno,'OtkaziKocnihKrugova','B14');
  
% 
%  
 
 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
sw_value=getappdata(0,'sw_value');


if sw_value==1

Gui_ParkKocnica   
%Gui_dialog2

end

if sw_value==2

Gui_ParkKocnica    
%Gui_dialog8
    
end


if sw_value==3
    
Gui_ParkKocnica    
%Gui_dialog8

end
