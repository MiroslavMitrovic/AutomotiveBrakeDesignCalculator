function varargout = Gui_Ogranicivac(varargin)
% GUI_OGRANICIVAC MATLAB code for Gui_Ogranicivac.fig
%      GUI_OGRANICIVAC, by itself, creates a new GUI_OGRANICIVAC or raises the existing
%      singleton*.
%
%      H = GUI_OGRANICIVAC returns the handle to a new GUI_OGRANICIVAC or the handle to
%      the existing singleton*.
%
%      GUI_OGRANICIVAC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_OGRANICIVAC.M with the given input arguments.
%
%      GUI_OGRANICIVAC('Property','Value',...) creates a new GUI_OGRANICIVAC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_Ogranicivac_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_Ogranicivac_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_Ogranicivac

% Last Modified by GUIDE v2.5 24-Jan-2015 15:56:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_Ogranicivac_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_Ogranicivac_OutputFcn, ...
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


% --- Executes just before Gui_Ogranicivac is made visible.
function Gui_Ogranicivac_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_Ogranicivac (see VARARGIN)

% Choose default command line output for Gui_Ogranicivac
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_Ogranicivac wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_Ogranicivac_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
  L1=str2double(get(hObject,'String'));
  setappdata(0,'L1',L1)
  
% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    L3=str2double(get(hObject,'String')); 
    setappdata(0,'L3',L3)
    

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bool

bool_value=getappdata(0,'bool_value');
 if any(bool_value==0)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end


Ogranicivac_Pritiska
handles.Kogr=getappdata(0,'K_ogr');
Kogr=handles.Kogr;
set(handles.K,'String',Kogr)
handles.K1ogr=getappdata(0,'K_1ogr');
K1ogr=handles.K1ogr;
set(handles.K1,'String',K1ogr)
axes(handles.axes1)
Dijagram


currentCounterValue = str2double(get(handles.Counter, 'String'));
newString = sprintf('%d', int32(currentCounterValue +1));
set(handles.Counter, 'String', newString )
counter=str2double(get(handles.Counter,'String'));

if counter>2 %ako je brojac veci od 2, resetovati ga na 0
    newString=0;
    newString=num2str(newString);
   set(handles.Counter, 'String', newString )

end


if counter>1

h = waitbar(0,'Molimo da sacekate...');
steps = 1;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_Gui_Ogranicivac
end
close(h) 
close()
Gui_dialog7

end

function  ZavProrSR_Ul_Pod
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
F_p=getappdata(0,'F_pmax')
i_p=getappdata(0,'i_p');
C_sp=getappdata(0,'C_sp');
A_gkc=getappdata(0,'A_gkc');
d_gkc=getappdata(0,'d_gkcizl');
eta_mk=getappdata(0,'eta_m');
A_pkc=getappdata(0,'A_kp');
A_zkc=getappdata(0,'A_kz');
s_pkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_zkc=1;    % za disk kocnice od 0,7-1[mm] za dobos 2 do 2.5[mm]
s_shgkc=2;  % od 1-2[mm]
eta_h=getappdata(0,'eta_h');
C_p=getappdata(0,'C_p');
C_z=getappdata(0,'C_z');
d_kcp=getappdata(0,'d_kcp');    %[mm]
d_kcz=getappdata(0,'d_kcz');    %[mm]    
r_srp=getappdata(0,'r_srp');    %[mm]    
r_srz=getappdata(0,'r_srz');    %[mm]
r_d=getappdata(0,'r_d.*1000');  %[mm]
r_dd=r_d./1000;     %[m]
m_o=getappdata(0,'m_o');        %[kg]
g=10;                           %[m^s^2]
m_no=getappdata(0,'m_no');    %[kg]
l=getappdata(0,'L');          %[m]
l_pno=getappdata(0,'L_pno');  %[m]
l_zno=getappdata(0,'L_zno');  %[m]
l_po=getappdata(0,'l_po');    %[m]
l_zo=getappdata(0,'l_zo');    %[m]
h_co=getappdata(0,'h_co');    %[m]
h_cno=getappdata(0,'h_cno');  %[m]
% f_ped=IK.f_pedale;  %[mm]
phi=0.8;            %[/]

function Ogranicivac_Pritiska

i_p=getappdata(0,'i_p');
C_sp=getappdata(0,'C_sp');
d_gkc=getappdata(0,'d_gkc');
eta_mk=getappdata(0,'eta_m');
eta_h=getappdata(0,'eta_h');
%Inkrementalno podeljena vrednost F_p 
%==========================================================================
F_pmin=0;
N=20;
F_pmax=getappdata(0,'F_pmax');
F_inc=F_pmax./N;
F_pinc=F_pmin:F_inc:F_pmax;

%Pritisak u prenosnom mehanizmu [MPa]
%==========================================================================
    %Faktor pritiska 
    kp=(4.*i_p.*C_sp.*eta_mk.*eta_h./(((d_gkc.^(2)).*pi)));
    
L1=getappdata(0,'L1');%vrednost do koje  ARSK ima linearnu karakteristiku 
p_h=kp.*F_pinc;
N_ul=(max(p_h)./N);
p_hp=(0:N_ul:max(p_h));
Pul1=[min(p_h):0.1:L1];
Pizl1=Pul1;
L2=max(ceil(p_hp));%maksimalna vrednost ulaznog pritiska
L3=getappdata(0,'L3');%maksimalna vrednost izlaznog pritiska u ogranicivacu
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2=[L1:1:L2];
Pizl2=[L1:L5:L3 ];
pul=[Pul1,Pul2];
pizl=[Pizl1,Pizl2];
L5=(L3./L2)*L1;
p_hp=pul;
p_hp=unique(p_hp);
p_hz=pizl;
p_hz=unique(p_hz);

setappdata(0,'p_izlogr',p_hz)

setappdata(0,'p_ulogr',p_hp)

F_pinc=p_hp./kp;
setappdata(0,'F_pincogr',F_pinc)

K=(L3-L1)./(L2-L1);% Karakteristika ogranicivaca
setappdata(0,'K_ogr',K)
K_1=1./K ;         % Reciprocna vrednost karakteristike ogranicivaca
setappdata(0,'K_1ogr',K_1)

%Poredjenje za gresku
%--------------------------------------------------------------------------
        if isnan(K_1)
         warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end

        if isinf(K_1)
            warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end



function Dijagram
pul=getappdata(0,'p_ulogr');
pizl=getappdata(0,'p_izlogr');

cla
hold on
plot(pul,pizl,'LineWidth',2);
axis([0 10 0 10]);
xlabel('pul[MPa]');
ylabel('pizl[MPa]');

function bool

L1=getappdata(0,'L1');
L1(isempty(L1))=0;
L3=getappdata(0,'L3');
L3(isempty(L3))=0;

bool_data=[L1 L3];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)



function print_Gui_Ogranicivac

pul=(getappdata(0,'p_ulogr'))';
pizl=(getappdata(0,'p_izlogr'))';
K=getappdata(0,'K_ogr');
K1=getappdata(0,'K_1ogr');

C=getappdata(0,'xls_ime_xls');

nule=zeros([100,4]);

%'K[/]','K1[/]';pul, pizl,K,K1
A = {'pul[MPa]','pizl[MPa]','K[/]','K1[/]'};
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'Ogranicivac','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A,'Ogranicivac','A1');
B=[pul, pizl];
D=[K,K1];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, B,'Ogranicivac','A2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, D, 'Ogranicivac','C2');
