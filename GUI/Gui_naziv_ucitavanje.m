function varargout = Gui_naziv_ucitavanje(varargin)
% GUI_NAZIV_UCITAVANJE MATLAB code for Gui_naziv_ucitavanje.fig
%      GUI_NAZIV_UCITAVANJE, by itself, creates a new GUI_NAZIV_UCITAVANJE or raises the existing
%      singleton*.
%
%      H = GUI_NAZIV_UCITAVANJE returns the handle to a new GUI_NAZIV_UCITAVANJE or the handle to
%      the existing singleton*.
%
%      GUI_NAZIV_UCITAVANJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_NAZIV_UCITAVANJE.M with the given input arguments.
%
%      GUI_NAZIV_UCITAVANJE('Property','Value',...) creates a new GUI_NAZIV_UCITAVANJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_naziv_ucitavanje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_naziv_ucitavanje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_naziv_ucitavanje

% Last Modified by GUIDE v2.5 16-Mar-2016 22:06:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_naziv_ucitavanje_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_naziv_ucitavanje_OutputFcn, ...
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


% --- Executes just before Gui_naziv_ucitavanje is made visible.
function Gui_naziv_ucitavanje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_naziv_ucitavanje (see VARARGIN)

% Choose default command line output for Gui_naziv_ucitavanje
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_naziv_ucitavanje wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_naziv_ucitavanje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function NAZIV_Callback(hObject, eventdata, handles)
% hObject    handle to NAZIV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NAZIV as text
%        str2double(get(hObject,'String')) returns contents of NAZIV as a double
%==========================================================================
%DODATI IF PETLJU KOJA CE REGULISATI KOJA JE KATEGORIJA DODATA I UZ TO
%DODATI ODGOVARAJUCU IZABRANU KATEGORIJU VOZILA
%==========================================================================
Ime_xls_fajla_naziv=get(hObject,'String');   
xls1=('.xls');
Ime_xls_fajla_naziv=strcat(Ime_xls_fajla_naziv,xls1);
setappdata(0,'xls_ime_naziv',Ime_xls_fajla_naziv)

% --- Executes during object creation, after setting all properties.
function NAZIV_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NAZIV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%xlswrite('ProracunKocenja.xls', DataMatlab2XLSt, 'Ulazni_podaci', 'A1');
h = waitbar(0,'Molim da sacekate...');
steps = 1;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    a=getappdata(0,'xls_ime_naziv');

setappdata(0,'xls_ime_xls',a)

end
C=getappdata(0,'xls_ime_xls');
C=num2str(C);

%Stringovi za poredjenje i kasnije odredjivanje kojoj kategoriji vozilo
%pripada radi nastavka proracuna...Unos podataka, prethodni i zavrsni
%proracun....
%==========================================================================

k1 = strfind(C,'M1');
k2 = strfind(C,'N1');
k3 = strfind(C,'N2');

data=(xlsread(C,'Ulazni_podaci', 'B1:B20'))';
setappdata(0,'data',data)
getappdata(0,'data')

close(h) 
close()
if k1>0

    Gui_UlPod_Ucitavanje
end

if k2>0

    Gui_UlPod_Ucitavanje
end

if k3>0
  
    Gui_UlPod_Ucitavanje_N2_Ostalo
    
end

    
