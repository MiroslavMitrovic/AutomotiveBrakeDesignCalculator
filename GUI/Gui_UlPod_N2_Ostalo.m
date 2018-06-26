

function varargout = Gui_UlPod_N2_Ostalo(varargin)
% GUI_ULPOD_N2_OSTALO MATLAB code for Gui_UlPod_N2_Ostalo.fig
%      GUI_ULPOD_N2_OSTALO, by itself, creates a new GUI_ULPOD_N2_OSTALO or raises the existing
%      singleton*.
%
%      H = GUI_ULPOD_N2_OSTALO returns the handle to a new GUI_ULPOD_N2_OSTALO or the handle to
%      the existing singleton*.
%
%      GUI_ULPOD_N2_OSTALO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ULPOD_N2_OSTALO.M with the given input arguments.
%
%      GUI_ULPOD_N2_OSTALO('Property','Value',...) creates a new GUI_ULPOD_N2_OSTALO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_UlPod_N2_Ostalo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_UlPod_N2_Ostalo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_UlPod_N2_Ostalo

% Last Modified by GUIDE v2.5 01-Jun-2016 16:15:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_UlPod_N2_Ostalo_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_UlPod_N2_Ostalo_OutputFcn, ...
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



% --- Executes just before Gui_UlPod_N2_Ostalo is made visible.
function Gui_UlPod_N2_Ostalo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no outputfku args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_UlPod_N2_Ostalo (see VARARGIN)

% Choose default command line outputfku for Gui_UlPod_N2_Ostalo

RGB = imread('slika3.jpg');
imshow(RGB);

handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
%Update handles structure
guidata(hObject, handles);
%set(handles.gui_ulpod_n2_ostalo, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8]) 
setappdata(0,'GuiUlPod', gcf);
setappdata(gcf, 'fhUpdateF_ku', @UpdateF_ku);

GuiUlPod=getappdata(0,'GuiUlPod');

%GuiUlPod=getappdata(0,'GuiUlPod');


% UIWAIT makes Gui_UlPod_N2_Ostalo wait for user response (see UIRESUME)
% uiwait(handles.gui_ulpod_n2_ostalo);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_UlPod_N2_Ostalo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning outputfku args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line outputfku from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
F_pmax=get(hObject,'String');
F_pmax=str2double(F_pmax);
setappdata(0,'F_pmax',F_pmax)
getappdata(0,'F_pmax');

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



function mo_Callback(hObject, eventdata, handles)
% hObject    handle to mo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mo as text
%        str2double(get(hObject,'String')) returns contents of mo as a double

m_o=get(hObject,'String');
handles.mo=get(hObject,'String');
m_o=str2double(m_o);
setappdata(0,'m_o',m_o)
getappdata(0,'m_o');

% --- Executes during object creation, after setting all properties.
function mo_CreateFcn(hObject, ~, handles)
% hObject    handle to mo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
m_no=get(hObject,'String');
m_no=str2double(m_no);
setappdata(0,'m_no',m_no)
getappdata(0,'m_no');

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
L=get(hObject,'String');
L=str2double(L);
setappdata(0,'L', L)
getappdata(0,'L' );

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
m_po=get(hObject,'String');
m_po=str2double(m_po);
setappdata(0,'m_po',m_po)
getappdata(0,'m_po');


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
m_pno=get(hObject,'String');
m_pno=str2double(m_pno);
setappdata(0,'m_pno',m_pno)
getappdata(0,'m_pno');

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

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
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

h_cno=get(hObject,'String');
h_cno=str2double(h_cno);
setappdata(0,'h_cno',h_cno)
getappdata(0,'h_cno');




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

h_co=get(hObject,'String');
h_co=str2double(h_co);
setappdata(0,'h_co',h_co)
getappdata(0,'h_co');



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



function amax_Callback(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amax as text
%        str2double(get(hObject,'String')) returns contents of amax as a double
a_max=get(hObject,'String');
a_max=str2double(a_max);
setappdata(0,'a_max',a_max)
getappdata(0,'a_max');

% --- Executes during object creation, after setting all properties.
function amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes during object creation, after setting all properties.
function delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called






% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');


end



function UpdateF_ku % Izracunavanje ukupne sile kocenja-funkcija
delta=1;
setappdata(0,'delta', delta)
delta=getappdata(0,'delta');
m_o=getappdata(0,'m_o');
m_no=getappdata(0,'m_no');
a_max=getappdata(0,'a_max');
F_ku=m_o.*a_max.*delta;
setappdata(0,'F_ku', F_ku);
F_ku=getappdata(0,'F_ku');
L=getappdata(0,'L' );
m_po=getappdata(0,'m_po' );
m_zo=m_o-m_po;
m_pno=getappdata(0,'m_pno' );
m_zno=m_no-m_pno;
setappdata(0,'m_zo', m_zo);
setappdata(0,'m_zno', m_zno);
%Odredjivanje medjuosovinskih rastojanja
%Optereceno
l_zo=L.*(m_po./m_o);
l_po=L-l_zo;
setappdata(0,'l_zo', l_zo)
setappdata(0,'l_po', l_po)
%Neoptereceno
l_zno=L.*(m_pno./m_no);
l_pno=L-l_zno;
setappdata(0,'l_zno', l_zno)
setappdata(0,'l_pno', l_pno)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
UpdateF_ku %Ubacivanje podataka u figure strukturu
bool2      %provera da li su vrednosti unesene
%Prikazivanje vrednosti ukupne sile kocenja na GUI-u
mo=str2double(get(handles.mo,'String'));
amax=str2double(get(handles.amax,'String'));
delta=1;
F_ku=mo.*amax.*delta;
F_kustr=num2str(F_ku);
setappdata(0,'F_ku',F_ku)
getappdata(0,'F_ku')

set(handles.izlaz,'String',F_kustr)
a_max=getappdata(0,'a_max');
%Deo gde vrednost mora da bude manja od 10
if a_max>=10
     myicon2 = imread('xmark.jpeg');
h=msgbox('Molimo Vas unesite vrednost manju od 10 za a_max','Upozorenje!!','custom',myicon2);
error('unesite vrednost manju od 10')

end

%Deo za ispisivanje upozorenja da podaci nisu uneti
bool_value=getappdata(0,'bool_value');

if any(bool_value==0)
    
    warndlg('Nisu uneti svi podaci, unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
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

if counter>1


h = waitbar(0,'Molimo da sacekate...');
steps = 1;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_UlPod
end



close(h) 
close()


%Aktiviranje sledeceg GUI-a-Raspodela Konstantne sile kocenja
IzbKat=getappdata(0,'IzbKat');

    if IzbKat<3
    
        RaspSK
    
    else
      
        RaspSK_2
        
    end
    
end

% --- Executes during object creation, after setting all properties.
function izlaz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to izlaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double
r_d=get(hObject,'String');
r_d=str2double(r_d);
setappdata(0,'r_d',r_d)
getappdata(0,'r_d');

function bool2

%Podaci za upis
rd=getappdata(0,'r_d');
F_ku=getappdata(0,'F_ku');
a_max=getappdata(0,'a_max');

m_o=getappdata(0,'m_o');
h_co=getappdata(0,'h_co');
h_cno=getappdata(0,'h_cno');
l_zo=getappdata(0,'l_zo');
l_po=getappdata(0,'l_po');
l_zno=getappdata(0,'l_zno');
l_pno=getappdata(0,'l_pno');
l=getappdata(0,'L');
m_no=getappdata(0,'m_no');
F_pmax=getappdata(0,'F_pmax');
m_po=getappdata(0,'m_po');
m_pno=getappdata(0,'m_pno');
m_zo=getappdata(0,'m_zo');
m_zno=getappdata(0,'m_zno');

bool_data=[F_pmax m_o l rd m_no l_pno l_zno h_cno l_po l_zo h_co...
    a_max F_ku m_po m_pno m_zo m_zno];
bool_data(isnan(bool_data))=0;%Izbacivanje NaN vrednosti
bool_data(isempty(bool_data))=0;
bool_value=logical(bool_data);%Logicko poredjenje za proveru unesenih podataka

setappdata(0,'bool_value', bool_value)



function print_UlPod
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
rd=getappdata(0,'r_d');
F_ku=getappdata(0,'F_ku');
a_max=getappdata(0,'a_max');
delta=getappdata(0,'delta');
m_o=getappdata(0,'m_o');
h_co=getappdata(0,'h_co');
h_cno=getappdata(0,'h_cno');
l_zo=getappdata(0,'l_zo');
l_po=getappdata(0,'l_po');
l_zno=getappdata(0,'l_zno');
l_pno=getappdata(0,'l_pno');
l=getappdata(0,'L');
m_no=getappdata(0,'m_no');
F_pmax=getappdata(0,'F_pmax');
m_po=getappdata(0,'m_po');
m_pno=getappdata(0,'m_pno');
m_zo=getappdata(0,'m_zo');
m_zno=getappdata(0,'m_zno');

bool_data=[F_pmax m_o l rd m_no l_pno l_zno h_cno l_po l_zo h_co...
    a_max delta F_ku m_po m_pno m_zo m_zno];
bool_data(isnan(bool_data))=0;%Izbacivanje NaN vrednosti
bool_value=logical(bool_data);%Logicko poredjenje za proveru unesenih podataka

setappdata(0,'bool_value', bool_value)



%Komanda za unos
DataMatlab2XLS = {'Fpmax[N]', 'm_o[kg]','l[m]','rd[m]', 'm_no[kg]', 'l_pno[m]'...
    ,'l_zno[m]','h_cno[m]','l_po[m]','l_zo[m]','h_co[m]','a_max[m/s^2]','delta[/]'...
    ,'F_ku[N]', 'm_po[kg]','m_zo[kg]','m_pno[kg]','m_zno[kg]'; F_pmax m_o l rd m_no l_pno l_zno h_cno l_po l_zo h_co...
    a_max delta F_ku m_po m_zo m_pno m_zno};

DataMatlab2XLSt=DataMatlab2XLS';


C=getappdata(0,'xls_ime_xls')
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt, 'Ulazni_podaci', 'A1');


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

popup1=get(hObject,'Value');   
setappdata(0,'popup1',popup1)
Izbor_koc_sist=getappdata(0,'popup1');
setappdata(0,'Izbor_koc_sist',Izbor_koc_sist)


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
