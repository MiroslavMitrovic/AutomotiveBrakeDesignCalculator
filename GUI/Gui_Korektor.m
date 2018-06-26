function varargout = Gui_Korektor(varargin)
% GUI_KOREKTOR MATLAB code for Gui_Korektor.fig
%      GUI_KOREKTOR, by itself, creates a new GUI_KOREKTOR or raises the existing
%      singleton*.
%
%      H = GUI_KOREKTOR returns the handle to a new GUI_KOREKTOR or the handle to
%      the existing singleton*.
%
%      GUI_KOREKTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KOREKTOR.M with the given input arguments.
%
%      GUI_KOREKTOR('Property','Value',...) creates a new GUI_KOREKTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_Korektor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_Korektor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_Korektor

% Last Modified by GUIDE v2.5 03-Jan-2015 15:16:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_Korektor_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_Korektor_OutputFcn, ...
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


% --- Executes just before Gui_Korektor is made visible.
function Gui_Korektor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_Korektor (see VARARGIN)

% Choose default command line output for Gui_Korektor
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_Korektor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_Korektor_OutputFcn(hObject, eventdata, handles) 
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


Korektor_Pritiska_neopt
Korektor_Pritiska_opt
handles.Kkor=getappdata(0,'K_korneopt');
Kkor=handles.Kkor;
set(handles.K,'String',Kkor)
handles.K1kor=getappdata(0,'K_1korneopt');
K1kor=handles.K1kor;
set(handles.K1,'String',K1kor)
handles.Kkoropt=getappdata(0,'K_koropt');
Kkoropt=handles.Kkoropt;
set(handles.text12,'String',Kkoropt)
handles.K1koropt=getappdata(0,'K_1koropt');
K1koropt=handles.K1koropt;
set(handles.text14,'String',K1koropt)

axes(handles.axes1)
Dijagram_neopt
axes(handles.axes2)
Dijagram_opt

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
print_Gui_Korektor
end
close(h) 
close()
Gui_dialog10
end

function Korektor_Pritiska_neopt

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
Pul1neopt=[min(p_h):0.1:L1];
Pizl1neopt=Pul1neopt;
L2=max(ceil(p_hp));%maksimalna vrednost ulaznog pritiska
L3=getappdata(0,'L3');%maksimalna vrednost izlaznog pritiska u ogranicivacu
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2neopt=[L1:1:L2];
Pizl2neopt=[L1:L5:L3 ];
pulneopt=[Pul1neopt,Pul2neopt];
pizlneopt=[Pizl1neopt,Pizl2neopt];
p_hzneopt=pizlneopt;
p_hzneopt=unique(p_hzneopt);
setappdata(0,'p_izlkorneopt',p_hzneopt)
p_hpneopt=pulneopt;
p_hpneopt=unique(p_hpneopt);
setappdata(0,'p_ulkorneopt',p_hpneopt)

F_pincneopt=p_hpneopt./kp;
setappdata(0,'F_pinckorneopt',F_pincneopt)

Kneopt=(L3-L1)./(L2-L1);% Karakteristika ogranicivaca
setappdata(0,'K_korneopt',Kneopt)
K_1neopt=1./Kneopt ;         % Reciprocna vrednost karakteristike ogranicivaca

setappdata(0,'K_1korneopt',K_1neopt)
%Deo za ispisivanje upozorenja da podaci nisu uneti

            if isnan(K_1neopt)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end
            
            if isinf(K_1neopt)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end

function bool

L1=getappdata(0,'L1');
L1(isempty(L1))=0;
L3=getappdata(0,'L3');
L3(isempty(L3))=0;

bool_data=[L1 L3];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)



function Korektor_Pritiska_opt

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
p_h=kp.*F_pinc;
N_ul=(max(p_h)./N);
p_hp=(0:N_ul:max(p_h));
p_hzopt=p_hp;
p_hzopt=unique(p_hzopt);
setappdata(0,'p_izlkoropt',p_hzopt)
p_hpopt=p_hp;
p_hpopt=unique(p_hpopt);
setappdata(0,'p_ulkoropt',p_hpopt)

F_pincopt=p_hpopt./kp;
setappdata(0,'F_pinckoropt',F_pincopt)

Kopt=1;% Karakteristika ogranicivaca
setappdata(0,'K_koropt',Kopt)
K_1opt=1 ;         % Reciprocna vrednost karakteristike ogranicivaca
setappdata(0,'K_1koropt',K_1opt)


function Dijagram_neopt
pulneopt=getappdata(0,'p_ulkorneopt');
pizlneopt=getappdata(0,'p_izlkorneopt');

cla
hold on
plot(pulneopt,pizlneopt,'LineWidth',2);
axis([0 10 0 10])
xlabel('pul[MPa]');
ylabel('pizl[MPa]');


function Dijagram_opt
pulopt=getappdata(0,'p_ulkoropt'); 
pizlopt=getappdata(0,'p_izlkoropt');

cla
hold on
axis([0 10 0 10])
plot(pulopt,pizlopt,'LineWidth',2);
xlabel('pul[MPa]');
ylabel('pizl[MPa]');


function print_Gui_Korektor

pulneopt=(getappdata(0,'p_ulkorneopt'))';
pizlneopt=(getappdata(0,'p_izlkorneopt'))';

pulopt=(getappdata(0,'p_ulkoropt'))'; 
pizlopt=(getappdata(0,'p_izlkoropt'))';
Kopt=getappdata(0,'K_koropt');
Kneopt=getappdata(0,'K_korneopt');
K1opt=getappdata(0,'K_1koropt');
K1neopt=getappdata(0,'K_1korneopt');


C=getappdata(0,'xls_ime_xls');

nule=zeros([100,4]);


A = {'pulneopt[MPa]' ,'pizlneopt[MPa]''pulopt[MPa]' ,'pizlopt[MPa]'...
   ,'Kneopt[/]','K1neopt[/]','Kopt[/]','K1opt[/]'};
B=[pulneopt, pizlneopt];
F=[pulopt, pizlopt];
D=[Kneopt, K1neopt, Kopt, K1opt];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'Korektor','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A,'Korektor','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,B,'Korektor','A2');
xlswrite(C,F,'Korektor','C2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,D,'Korektor','E2');


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
L1_opt=str2double(get(hObject,'String'));
setappdata(0,'L1_opt',L1_opt)

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

L3_opt=str2double(get(hObject,'String'));
setappdata(0,'L3_opt',L3_opt)
% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
    L_1opt=str2double(get(hObject,'String'));
    setappdata(0,'L_1opt',L_1opt)
% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
    L_2opt=str2double(get(hObject,'String'));
    setappdata(0,'L_2opt',L_2opt)
% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
