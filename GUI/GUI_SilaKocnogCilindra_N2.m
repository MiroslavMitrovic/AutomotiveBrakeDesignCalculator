function varargout = GUI_SilaKocnogCilindra_N2(varargin)
% GUI_SILAKOCNOGCILINDRA_N2 MATLAB code for GUI_SilaKocnogCilindra_N2.fig
%      GUI_SILAKOCNOGCILINDRA_N2, by itself, creates a new GUI_SILAKOCNOGCILINDRA_N2 or raises the existing
%      singleton*.
%
%      H = GUI_SILAKOCNOGCILINDRA_N2 returns the handle to a new GUI_SILAKOCNOGCILINDRA_N2 or the handle to
%      the existing singleton*.
%
%      GUI_SILAKOCNOGCILINDRA_N2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SILAKOCNOGCILINDRA_N2.M with the given input arguments.
%
%      GUI_SILAKOCNOGCILINDRA_N2('Property','Value',...) creates a new GUI_SILAKOCNOGCILINDRA_N2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_SilaKocnogCilindra_N2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_SilaKocnogCilindra_N2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_SilaKocnogCilindra_N2

% Last Modified by GUIDE v2.5 25-Jun-2016 19:19:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_SilaKocnogCilindra_N2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_SilaKocnogCilindra_N2_OutputFcn, ...
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
% --- Executes just before GUI_SilaKocnogCilindra_N2 is made visible.
function GUI_SilaKocnogCilindra_N2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_SilaKocnogCilindra_N2 (see VARARGIN)

% Choose default command line output for GUI_SilaKocnogCilindra_N2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.Counter,'String',0)%handles za brojac
handles.F_klp_pot=num2str(getappdata(0,'F_klp_pot'));
handles.F_klz_pot=num2str(getappdata(0,'F_klz_pot'));
F_klp_pothan=handles.F_klp_pot;    %Sila na klipnjaci koc.cil napred
set(handles.potrebnonapred,'String',F_klp_pothan) 
F_klz_pothan=handles.F_klz_pot;    %Sila na klipnjaci koc.cil pozadi
set(handles.potrebnonazad,'String',F_klz_pothan)

% UIWAIT makes GUI_SilaKocnogCilindra_N2 wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_SilaKocnogCilindra_N2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bool

bool_value=getappdata(0,'bool_value');

if any(bool_value)==0
    
    
                warndlg('Nisu uneti svi podaci, unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')
                
end


Karakteristika_Pozadi
axes(handles.axes5)
Karakteristika_Napred
axes(handles.axes6)

%BROJAC
%--------------------------------------------------------------------------
currentCounterValue = str2double(get(handles.Counter, 'String'));
newString = sprintf('%d', int32(currentCounterValue +1));
set(handles.Counter, 'String', newString )
counter=str2double(get(handles.Counter,'String'));
% 
if counter>2 %ako je brojac veci od 2, resetovati ga na 0
    newString=0;
    newString=num2str(newString);
   set(handles.Counter, 'String', newString )

end


setappdata(0,'I_kc',1)%potrebno u sledecem .m fajlu da bi program znao da li je korekcija bila uzeta vec u obzir ili ne...
 

if counter>1
print_karakteristika   
close()
Gui_dialog16

end

function bool

F_pkcmax=getappdata(0,'F_omax');
F_pkcmax(isnan(F_pkcmax))=0;
F_pkcmax(isempty(F_pkcmax))=0;
p_max1=getappdata(0,'p_max1kc');
p_max1(isempty(p_max1))=0;
p_max1(isnan(p_max1))=0;
F_zkcmax=getappdata(0,'F_omax2');
F_zkcmax(isnan(F_zkcmax))=0;
F_zkcmax(isempty(F_zkcmax))=0;
p_max2=getappdata(0,'p_max2kc');
p_max2(isnan(p_max2))=0;
p_max2(isempty(p_max2))=0;


bool_data=[F_pkcmax p_max1  F_zkcmax p_max2];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)

function p_max1_Callback(hObject, eventdata, handles)
% hObject    handle to p_max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_max1 as text
%        str2double(get(hObject,'String')) returns contents of p_max1 as a double
p_max=str2double(get(hObject,'String'));
setappdata(0,'p_max1kc',p_max)

% --- Executes during object creation, after setting all properties.
function p_max1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function Karakteristika_Napred
F_pkcmax=getappdata(0,'F_omax');
p_max=getappdata(0,'p_max1kc');
p_inc=0:0.1:p_max;
setappdata(0,'p_inc',p_inc)


F_pkc=((F_pkcmax./p_max).*p_inc);
setappdata(0,'F_pkc',F_pkc)


plot(p_inc,F_pkc,'LineWidth',2)
xlabel('p_{1}[bar]')
ylabel('F[N]')
legend('F_{pkc}[N]')

function Karakteristika_Pozadi
F_zkcmax=getappdata(0,'F_omax2');
p_max2=getappdata(0,'p_max2kc');
p_inc2=0:0.1:p_max2;
setappdata(0,'p_inc2',p_inc2)


F_zkc=((F_zkcmax./p_max2).*p_inc2);
setappdata(0,'F_zkc',F_zkc)


plot(p_inc2,F_zkc,'LineWidth',2)
xlabel('p_{2}[bar]')
ylabel('F[N]')
legend('F_{zkc}[N]')


function print_karakteristika
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
F_pkc=getappdata(0,'F_pkc');
p_inc=getappdata(0,'p_inc');
F_zkc=getappdata(0,'F_zkc');
p_inc2=getappdata(0,'p_inc2');
C=getappdata(0,'xls_ime_xls');
naziv_cilindra_napred=getappdata(0,'naziv_cilindra_napred');
naziv_cilindra_napred(isempty(naziv_cilindra_napred))=0;
naziv_cilindra_pozadi=getappdata(0,'naziv_cilindra_pozadi');
naziv_cilindra_pozadi(isempty(naziv_cilindra_pozadi))=0;
%Komanda za unos

A={'F_pkc[N]','p_inc1[bar]','F_zkc[N]','p_inc2[bar]','Naziv Cilindra Napred','Naziv Cilindra Nazad' };
At=A';
DataMatlab2XLS1 = [F_pkc; p_inc];
DataMatlab2XLS2 =[F_zkc; p_inc2];

warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'KarakteristikaKocCilindra'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1, 'KarakteristikaKocCilindra'...
, 'B1');
warning('off','MATLAB:xlswrite:Addsheet');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS2, 'KarakteristikaKocCilindra'...
, 'B3');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,naziv_cilindra_napred , 'KarakteristikaKocCilindra'...
, 'B5');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C,naziv_cilindra_pozadi , 'KarakteristikaKocCilindra'...
, 'B6');









function F_p_2d_Callback(hObject, eventdata, handles)
% hObject    handle to F_p_2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_p_2d as text
%        str2double(get(hObject,'String')) returns contents of F_p_2d as a double
F_p_2d=str2double(get(hObject,'String'));
setappdata(0,'F_p_2d',F_p_2d)

% --- Executes during object creation, after setting all properties.
function F_p_2d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_p_2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_1max_Callback(hObject, eventdata, handles)
% hObject    handle to p_1max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_1max as text
%        str2double(get(hObject,'String')) returns contents of p_1max as a double
p_1max=str2double(get(hObject,'String'));
setappdata(0,'p_1maxkc',p_1max)





% --- Executes during object creation, after setting all properties.
function p_1max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_1max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_2max_Callback(hObject, eventdata, handles)
% hObject    handle to p_2max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_2max as text
%        str2double(get(hObject,'String')) returns contents of p_2max as a double

p_2max=str2double(get(hObject,'String'));
setappdata(0,'p_2maxkc',p_2max)


% --- Executes during object creation, after setting all properties.
function p_2max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_2max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_omax1_Callback(hObject, eventdata, handles)
% hObject    handle to F_omax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_omax1 as text
%        str2double(get(hObject,'String')) returns contents of F_omax1 as a double
F_omax=str2double(get(hObject,'String'));
setappdata(0,'F_omax',F_omax)

% --- Executes during object creation, after setting all properties.
function F_omax1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_omax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Naziv_Callback(hObject, eventdata, handles)
% hObject    handle to Naziv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Naziv as text
%        str2double(get(hObject,'String')) returns contents of Naziv as a double

Naziv=get(hObject,'String');
setappdata(0,'Naziv',Naziv) 

% --- Executes during object creation, after setting all properties.
function Naziv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Naziv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function p_max2_Callback(hObject, eventdata, handles)
% hObject    handle to p_max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_max2 as text
%        str2double(get(hObject,'String')) returns contents of p_max2 as a double
p_max2=str2double(get(hObject,'String'));
setappdata(0,'p_max2kc',p_max2)

% --- Executes during object creation, after setting all properties.
function p_max2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_omax2_Callback(hObject, eventdata, handles)
% hObject    handle to F_omax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_omax2 as text
%        str2double(get(hObject,'String')) returns contents of F_omax2 as a double

F_omax2=str2double(get(hObject,'String'));
setappdata(0,'F_omax2',F_omax2)
% --- Executes during object creation, after setting all properties.
function F_omax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_omax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
naziv_cilindra_napred=get(hObject,'String');
setappdata(0,'naziv_cilindra_napred',naziv_cilindra_napred)

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double

naziv_cilindra_pozadi=get(hObject,'String');
setappdata(0,'naziv_cilindra_pozadi',naziv_cilindra_pozadi)

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
