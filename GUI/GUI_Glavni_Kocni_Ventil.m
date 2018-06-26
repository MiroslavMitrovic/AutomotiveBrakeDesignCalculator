function varargout = GUI_Glavni_Kocni_Ventil(varargin)
% GUI_GLAVNI_KOCNI_VENTIL MATLAB code for GUI_Glavni_Kocni_Ventil.fig
%      GUI_GLAVNI_KOCNI_VENTIL, by itself, creates a new GUI_GLAVNI_KOCNI_VENTIL or raises the existing
%      singleton*.
%
%      H = GUI_GLAVNI_KOCNI_VENTIL returns the handle to a new GUI_GLAVNI_KOCNI_VENTIL or the handle to
%      the existing singleton*.
%
%      GUI_GLAVNI_KOCNI_VENTIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GLAVNI_KOCNI_VENTIL.M with the given input arguments.
%
%      GUI_GLAVNI_KOCNI_VENTIL('Property','Value',...) creates a new GUI_GLAVNI_KOCNI_VENTIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Glavni_Kocni_Ventil_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Glavni_Kocni_Ventil_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Glavni_Kocni_Ventil

% Last Modified by GUIDE v2.5 14-Jun-2016 12:36:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Glavni_Kocni_Ventil_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Glavni_Kocni_Ventil_OutputFcn, ...
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
% --- Executes just before GUI_Glavni_Kocni_Ventil is made visible.
function GUI_Glavni_Kocni_Ventil_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Glavni_Kocni_Ventil (see VARARGIN)

% Choose default command line output for GUI_Glavni_Kocni_Ventil
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);



% UIWAIT makes GUI_Glavni_Kocni_Ventil wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Glavni_Kocni_Ventil_OutputFcn(hObject, eventdata, handles) 
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

if any(bool_value==0)
    
    warndlg('Molim Vas unesite potrebne vrednosti!','UPOZORENJE')
    error('Vrednost nije uneta')
    
end


currentCounterValue = str2double(get(handles.Counter, 'String'));
newString = sprintf('%d', int32(currentCounterValue +1));
set(handles.Counter, 'String', newString )
counter=str2double(get(handles.Counter,'String'));

if counter>2 %ako je brojac veci od 2, resetovati ga na 0
    newString=0;
    newString=num2str(newString);
   set(handles.Counter, 'String', newString )

end


GKV
axes(handles.axes5)
Print_GKV


if counter>1
    
print_GKV
close()
Gui_dialog15

end


function F_p_1d_Callback(hObject, eventdata, handles)
% hObject    handle to F_p_1d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_p_1d as text
%        str2double(get(hObject,'String')) returns contents of F_p_1d as a double
F_p_1d=str2double(get(hObject,'String'));
setappdata(0,'F_p_1d',F_p_1d)

% --- Executes during object creation, after setting all properties.
function F_p_1d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_p_1d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function bool

p_max1=getappdata(0,'p_1max');  %Prvi kocni krug
p_max1(isempty(p_max1))=0;
p_max2=getappdata(0,'p_2max');  %Drugi kocni krug
p_max2(isempty(p_max2))=0;
F_pmax=getappdata(0,'F_pmax');  %Maksimalna sila na pedali
F_pmax(isempty(F_pmax))=0;
F_p_1d=getappdata(0,'F_p_1d');  %Pocetna sila prvog kruga
F_p_1d(isempty(F_p_1d))=0;
F_p_2d=getappdata(0,'F_p_2d');  %Pocetna sila drugog kruga
F_p_2d(isempty(F_p_2d))=0;

bool_data=[p_max1 p_max2 F_pmax F_p_1d F_p_2d];
bool_value=logical(bool_data);

setappdata(0,'bool_value',bool_value)



function GKV
%U ovom modelu cemo iskljuciti opciju predkocenja, odnosno, predkocenje ce
%postojati samim tim jer ce pritisci u kocnim krugovima biti drugaciji...
%=========================================================================

p_max1=getappdata(0,'p_1max');  %Prvi kocni krug
p_max2=getappdata(0,'p_2max');  %Drugi kocni krug

F_pmax=getappdata(0,'F_pmax');  %Maksimalna sila na pedali
F_p_1d=getappdata(0,'F_p_1d');  %Pocetna sila prvog kruga
F_p_2d=getappdata(0,'F_p_2d');  %Pocetna sila drugog kruga


%U zavisnosti od maksimalnog pritiska i same karakteristike ventila imacemo
%dve prave, za prvi i drugi kocni krug....
%==========================================================================

pi=p_max1./(F_pmax-F_p_1d); %Karakteristika prvog kocnog kruga
pii=p_max2./(F_pmax-F_p_2d);%Karakteristika drugog kocnog kruga


%Porast pritiska tek krece sa ~50[N] ili vise sile na pedali
%==========================================================================
F_pmaxinc1=F_p_1d:10:F_pmax;
F_pmaxinc2=F_p_2d:10:F_pmax;
p_1=pi.*(F_pmaxinc1-F_p_1d);
p_2=pii.*(F_pmaxinc2-F_p_2d);

%Videti da li treba nekako uracunati gubitke u samom komandnom ventilu...
setappdata(0,'F_pmaxinc1',F_pmaxinc1)
setappdata(0,'F_pmaxinc2',F_pmaxinc2)
setappdata(0,'p_1',p_1)
setappdata(0,'p_2',p_2)



function Print_GKV

F_pmaxinc1=getappdata(0,'F_pmaxinc1');
F_pmaxinc2=getappdata(0,'F_pmaxinc2');
p_1=getappdata(0,'p_1');
p_2=getappdata(0,'p_2');



% figure('Name','Karakteristika Glavnog Kocnog Ventila','NumberTitle','off')

plot(F_pmaxinc1,p_1)
hold on
plot(F_pmaxinc2,p_2)
axis([0 400 0 10])
xlabel('F_p[N]')
ylabel('P_i[bar]')
legend('p_1','p_2');


function print_GKV
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
F_pmax=getappdata(0,'F_pmax');
F_p_1d=getappdata(0,'F_p_1d');
F_p_2d=getappdata(0,'F_p_2d');
p_1max=getappdata(0,'p_1max');
p_2max=getappdata(0,'p_2max');
F_pmaxinc1=getappdata(0,'F_pmaxinc1');
F_pmaxinc2=getappdata(0,'F_pmaxinc2');
p_1=getappdata(0,'p_1');
p_2=getappdata(0,'p_2');

Naziv=getappdata(0,'Naziv');
C=getappdata(0,'xls_ime_xls');

%Komanda za unos

A={'F_pmax[N]','F_p_1d[N]','F_p_2d[N]', 'p_1max[bar]' ,'p_2max[bar]',...
    'F_pmaxinc1[N]', 'p_1[bar]','F_pmaxinc2[N]' ,'p_2[bar]','Naziv ventila'};
At=A';
DataMatlab2XLS1 = [F_pmax; F_p_1d;F_p_2d;p_1max;p_2max ];
DataMatlab2XLS2=[F_pmaxinc1;p_1];
DataMatlab2XLS3=[F_pmaxinc2; p_2];
DataMatlab2XLS4=Naziv;
DataMatlab2XLS4(isempty(DataMatlab2XLS4))=0;
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'Glavni_Kocni_Ventil'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1, 'Glavni_Kocni_Ventil'...
, 'B1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS2, 'Glavni_Kocni_Ventil'...
, 'B6');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS3, 'Glavni_Kocni_Ventil'...
, 'B8');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS4, 'Glavni_Kocni_Ventil'...
, 'B10');
warning('off','MATLAB:xlswrite:Addsheet');




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
setappdata(0,'p_1max',p_1max)





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
setappdata(0,'p_2max',p_2max)


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



function F_pmax_Callback(hObject, eventdata, handles)
% hObject    handle to F_pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_pmax as text
%        str2double(get(hObject,'String')) returns contents of F_pmax as a double
F_pmax=str2double(get(hObject,'String'));
setappdata(0,'F_pmax',F_pmax)

% --- Executes during object creation, after setting all properties.
function F_pmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_pmax (see GCBO)
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
Nazivtest=str2double(get(hObject,'String'));
if isempty(Nazivtest)
    setappdata(0,'Naziv',0)
else
    setappdata(0,'Naziv',Naziv) 
end
    

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
