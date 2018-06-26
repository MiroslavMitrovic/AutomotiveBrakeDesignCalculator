function varargout = GUI_SilaOprugeKocnogCilindra_N2(varargin)
% GUI_SILAOPRUGEKOCNOGCILINDRA_N2 MATLAB code for GUI_SilaOprugeKocnogCilindra_N2.fig
%      GUI_SILAOPRUGEKOCNOGCILINDRA_N2, by itself, creates a new GUI_SILAOPRUGEKOCNOGCILINDRA_N2 or raises the existing
%      singleton*.
%
%      H = GUI_SILAOPRUGEKOCNOGCILINDRA_N2 returns the handle to a new GUI_SILAOPRUGEKOCNOGCILINDRA_N2 or the handle to
%      the existing singleton*.
%
%      GUI_SILAOPRUGEKOCNOGCILINDRA_N2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SILAOPRUGEKOCNOGCILINDRA_N2.M with the given input arguments.
%
%      GUI_SILAOPRUGEKOCNOGCILINDRA_N2('Property','Value',...) creates a new GUI_SILAOPRUGEKOCNOGCILINDRA_N2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_SilaOprugeKocnogCilindra_N2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_SilaOprugeKocnogCilindra_N2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_SilaOprugeKocnogCilindra_N2

% Last Modified by GUIDE v2.5 19-Jun-2016 18:16:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_SilaOprugeKocnogCilindra_N2_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_SilaOprugeKocnogCilindra_N2_OutputFcn, ...
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
% --- Executes just before GUI_SilaOprugeKocnogCilindra_N2 is made visible.
function GUI_SilaOprugeKocnogCilindra_N2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_SilaOprugeKocnogCilindra_N2 (see VARARGIN)

% Choose default command line output for GUI_SilaOprugeKocnogCilindra_N2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes GUI_SilaOprugeKocnogCilindra_N2 wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_SilaOprugeKocnogCilindra_N2_OutputFcn(hObject, eventdata, handles) 
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
Karakteristika
axes(handles.axes5)
print_karakteristika
close()

function p_max_Callback(hObject, eventdata, handles)
% hObject    handle to p_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of p_max as text
%        str2double(get(hObject,'String')) returns contents of p_max as a double
p_max=str2double(get(hObject,'String'));
setappdata(0,'p_max',p_max)

% --- Executes during object creation, after setting all properties.
function p_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Karakteristika
F_pkcmax=getappdata(0,'F_omax');
p_max=getappdata(0,'p_max');
p_inc=0:0.1:p_max;
setappdata(0,'p_inc',p_inc)


F_pklc=F_pkcmax-((F_pkcmax./p_max).*p_inc);
setappdata(0,'F_pklc',F_pklc)


plot(p_inc,F_pklc,'LineWidth',2)



function print_karakteristika
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
F_pklc=getappdata(0,'F_pklc');
p_inc=getappdata(0,'p_inc');
C=getappdata(0,'xls_ime_xls');

%Komanda za unos

A={'F_pklc[N]','p_inc[bar]'};
At=A';
DataMatlab2XLS1 = [F_pklc; p_inc;];


warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'KarakteristikaOpruge'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1, 'KarakteristikaOpruge'...
, 'B1');
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



function F_omax_Callback(hObject, eventdata, handles)
% hObject    handle to F_omax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_omax as text
%        str2double(get(hObject,'String')) returns contents of F_omax as a double
F_omax=str2double(get(hObject,'String'));
setappdata(0,'F_omax',F_omax)

% --- Executes during object creation, after setting all properties.
function F_omax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_omax (see GCBO)
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
