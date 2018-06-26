function varargout = Gui_naziv(varargin)
% GUI_NAZIV MATLAB code for Gui_naziv.fig
%      GUI_NAZIV, by itself, creates a new GUI_NAZIV or raises the existing
%      singleton*.
%
%      H = GUI_NAZIV returns the handle to a new GUI_NAZIV or the handle to
%      the existing singleton*.
%
%      GUI_NAZIV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_NAZIV.M with the given input arguments.
%
%      GUI_NAZIV('Property','Value',...) creates a new GUI_NAZIV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_naziv_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_naziv_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_naziv

% Last Modified by GUIDE v2.5 06-Mar-2016 12:33:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_naziv_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_naziv_OutputFcn, ...
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


% --- Executes just before Gui_naziv is made visible.
function Gui_naziv_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_naziv (see VARARGIN)

% Choose default command line output for Gui_naziv
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_naziv wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_naziv_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PROIZVODJAC_Callback(hObject, eventdata, handles)
% hObject    handle to PROIZVODJAC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PROIZVODJAC as text
%        str2double(get(hObject,'String')) returns contents of PROIZVODJAC as a double
%==========================================================================
%DODATI IF PETLJU KOJA CE REGULISATI KOJA JE KATEGORIJA DODATA I UZ TO
%DODATI ODGOVARAJUCU IZABRANU KATEGORIJU VOZILA
%==========================================================================
Ime_xls_fajla_proizvodjac=get(hObject,'String');   
xls1={'_'};

Ime_xls_fajla_proizvodjac=strcat(Ime_xls_fajla_proizvodjac,xls1);
setappdata(0,'xls_ime_proizvodjac',Ime_xls_fajla_proizvodjac)
getappdata(0,'xls_ime_proizvodjac')
% --- Executes during object creation, after setting all properties.
function PROIZVODJAC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PROIZVODJAC (see GCBO)
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
    a=getappdata(0,'Ime_xls_fajla_xls');
c=num2str(cell2mat(a));
setappdata(0,'xls_ime_xls',c)
b=[0];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(c, b, 'Ulazni_podaci', 'A1');
end
close(h) 
close()
Gui_UlPod



function TIP_Callback(hObject, eventdata, handles)
% hObject    handle to TIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TIP as text
%        str2double(get(hObject,'String')) returns contents of TIP as a double
Ime_xls_fajla_tip=get(hObject,'String');   
xls1={'_'};



Ime_xls_fajla_tip=strcat(Ime_xls_fajla_tip,xls1);
setappdata(0,'xls_ime_tip',Ime_xls_fajla_tip)
getappdata(0,'xls_ime_tip')



% --- Executes during object creation, after setting all properties.
function TIP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TIP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function OZNAKA_Callback(hObject, eventdata, handles)
% hObject    handle to OZNAKA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OZNAKA as text
%        str2double(get(hObject,'String')) returns contents of OZNAKA as a double
Ime_xls_fajla_oznaka=get(hObject,'String');   
xls1={'_'};



Ime_xls_fajla_oznaka=strcat(Ime_xls_fajla_oznaka,xls1);
setappdata(0,'xls_ime_oznaka',Ime_xls_fajla_oznaka)
getappdata(0,'xls_ime_oznaka')


Ime_xls_fajla_proizvodjac=getappdata(0,'xls_ime_proizvodjac');
Ime_xls_fajla_tip=getappdata(0,'xls_ime_tip');

Ime_xls_fajla=strcat(Ime_xls_fajla_proizvodjac,Ime_xls_fajla_tip,Ime_xls_fajla_oznaka);

IzbKat=getappdata(0,'IzbKat');
if IzbKat==1 
    xls2={'_M1'};
 Ime_xls_fajla=strcat(Ime_xls_fajla,xls2);
else
    if IzbKat==2
        xls3={'_N1'};
        Ime_xls_fajla=strcat(Ime_xls_fajla,xls3);
    else
        if IzbKat==3
            xls3={'_N2'};
        Ime_xls_fajla=strcat(Ime_xls_fajla,xls3);
        
        end
    end

end

xls4={'.xls'};
Ime_xls_fajla_xls=strcat(Ime_xls_fajla,xls4);

setappdata(0,'Ime_xls_fajla_xls',Ime_xls_fajla_xls);
getappdata(0,'Ime_xls_fajla_xls')
% --- Executes during object creation, after setting all properties.
function OZNAKA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OZNAKA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Izvesti ovako i izbor kategorija i izbor tipa vozila
%==========================================================================
popup1=get(hObject,'Value');   
setappdata(0,'popup1',popup1)
getappdata(0,'popup1')
%==========================================================================

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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
