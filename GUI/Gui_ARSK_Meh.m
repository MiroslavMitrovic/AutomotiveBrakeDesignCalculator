function varargout = Gui_ARSK_Meh(varargin)
% GUI_ARSK_MEH MATLAB code for Gui_ARSK_Meh.fig
%      GUI_ARSK_MEH, by itself, creates a new GUI_ARSK_MEH or raises the existing
%      singleton*.
%
%      H = GUI_ARSK_MEH returns the handle to a new GUI_ARSK_MEH or the handle to
%      the existing singleton*.
%
%      GUI_ARSK_MEH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ARSK_MEH.M with the given input arguments.
%
%      GUI_ARSK_MEH('Property','Value',...) creates a new GUI_ARSK_MEH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_ARSK_Meh_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_ARSK_Meh_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_ARSK_Meh

% Last Modified by GUIDE v2.5 14-Jun-2016 14:47:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_ARSK_Meh_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_ARSK_Meh_OutputFcn, ...
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


% --- Executes just before Gui_ARSK_Meh is made visible.
function Gui_ARSK_Meh_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_ARSK_Meh (see VARARGIN)

% Choose default command line output for Gui_ARSK_Meh
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_ARSK_Meh wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_ARSK_Meh_OutputFcn(hObject, eventdata, handles) 
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
setappdata(0,'I_kc',0)
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
print_Gui_Korektor
end

I_ARSK_N2=1;
setappdata(0,'I_ARSK_N2',I_ARSK_N2)
close(h) 
close()
Gui_dialog10N2

end
function Korektor_Pritiska_neopt

p_2ul=getappdata(0,'p_2');
N=20;

%Inkrementalno podeljena vrednost F_p 
%==========================================================================
    
L1=getappdata(0,'L1');%vrednost do koje  ARSK ima linearnu karakteristiku 
N_ul=(max(p_2ul)./N);
p_hp=(0:N_ul:max(p_2ul));
Pul1neopt=[min(p_2ul):0.1:L1];
Pizl1neopt=Pul1neopt;
L2=max(ceil(p_2ul));%maksimalna vrednost ulaznog pritiska
L3=getappdata(0,'L3');%maksimalna vrednost izlaznog pritiska u ogranicivacu
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2neopt=[L1:1:L2];
Pizl2neopt=[L1:L5:L3 ];
pulneopt=[Pul1neopt,Pul2neopt];
pizlneopt=[Pizl1neopt,Pizl2neopt];
p_zneopt=pizlneopt;
p_zneopt=unique(p_zneopt);
setappdata(0,'p_izlkorneopt',p_zneopt)
p_pneopt=pulneopt;
p_pneopt=unique(p_pneopt);
setappdata(0,'p_2no',p_pneopt)

Kneopt=(L3-L1)./(L2-L1);% Karakteristika ogranicivaca
setappdata(0,'K_korneopt',Kneopt)
K_1neopt=1./Kneopt ;         % Reciprocna vrednost karakteristike ogranicivaca

 setappdata(0,'K_1korneopt',K_1neopt)
% %Deo za ispisivanje upozorenja da podaci nisu uneti
% 
%             if isnan(K_1neopt)
% 
%                 warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
%                 error('Vrednost nije uneta')
% 
%             end
%             
%             if isinf(K_1neopt)
% 
%                 warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
%                 error('Vrednost nije uneta')
% 
%             end
% 
% 

function bool

L1=getappdata(0,'L1');
L1(isempty(L1))=0;
L3=getappdata(0,'L3');
L3(isempty(L3))=0;

bool_data=[L1 L3];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)


function Korektor_Pritiska_opt

p2_ul=getappdata(0,'p_2');
N=20;
%Pritisak u prenosnom mehanizmuu[MPa]
%==========================================================================

N_ul=(max(p2_ul)./N);
p_p=(0:N_ul:max(p2_ul));
p_zopt=p_p;
p_zopt=unique(p_zopt);
setappdata(0,'p_izlkoropt',p_zopt)
p_popt=p_p;
p_popt=unique(p_popt);
setappdata(0,'p_2o',p_popt)

Kopt=1;% Karakteristika ogranicivaca
setappdata(0,'K_koropt',Kopt)
K_1opt=1 ;         % Reciprocna vrednost karakteristike ogranicivaca
setappdata(0,'K_1koropt',K_1opt)


function Dijagram_neopt
pulneopt=getappdata(0,'p_2no');
pizlneopt=getappdata(0,'p_izlkorneopt');

cla
hold on
plot(pulneopt,pizlneopt,'LineWidth',2);
axis([0 10 0 10])
xlabel('pul[bar]');
ylabel('pizl[bar]');
legend('p_{2kor}')


function Dijagram_opt
pulopt=getappdata(0,'p_2o'); 
pizlopt=getappdata(0,'p_izlkoropt');

cla
hold on
axis([0 10 0 10])
plot(pulopt,pizlopt,'LineWidth',2);
xlabel('pul[bar]');
ylabel('pizl[bar]');
legend('p_{2}')


function print_Gui_Korektor

pulneopt=(getappdata(0,'p_2no'))';
pizlneopt=(getappdata(0,'p_izlkorneopt'))';

pulopt=(getappdata(0,'p_2o'))'; 
pizlopt=(getappdata(0,'p_izlkoropt'))';
Kopt=getappdata(0,'K_koropt');
Kneopt=getappdata(0,'K_korneopt');
K1opt=getappdata(0,'K_1koropt');
K1neopt=getappdata(0,'K_1korneopt');


C=getappdata(0,'xls_ime_xls');

nule=zeros([100,4]);


A = {'pulneopt[bar]' ,'pizlneopt[bar]''pulopt[bar]' ,'pizlopt[bar]'...
   ,'Kneopt[/]','K1neopt[/]','Kopt[/]','K1opt[/]'};
B=pulneopt;
B1=pizlneopt;

D=[Kneopt, K1neopt, Kopt, K1opt];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'KorektorN2','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A,'KorektorN2','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,B,'KorektorN2','A2');
xlswrite(C,B1,'KorektorN2','B2');
xlswrite(C,pulopt,'KorektorN2','C2');
xlswrite(C,pizlopt,'KorektorN2','D2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,D,'KorektorN2','E2');


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
