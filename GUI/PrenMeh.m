function varargout = PrenMeh(varargin)
% PRENMEH MATLAB code for PrenMeh.fig
%      PRENMEH, by itself, creates a new PRENMEH or raises the existing
%      singleton*.
%
%      H = PRENMEH returns the handle to a new PRENMEH or the handle to
%      the existing singleton*.
%
%      PRENMEH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRENMEH.M with the given input arguments.
%
%      PRENMEH('Property','Value',...) creates a new PRENMEH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PrenMeh_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PrenMeh_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PrenMeh

% Last Modified by GUIDE v2.5 21-Dec-2014 23:09:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PrenMeh_OpeningFcn, ...
                   'gui_OutputFcn',  @PrenMeh_OutputFcn, ...
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
% --- Executes just before PrenMeh is made visible.
function PrenMeh_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrenMeh (see VARARGIN)

% Choose default command line output for PrenMeh
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%set(handles.Gui_PrenMeh, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])


setappdata(gcf, 'PrenMeh_Rac', @PrenMeh_Rac);



% UIWAIT makes PrenMeh wait for user response (see UIRESUME)
% uiwait(handles.Gui_PrenMeh);


% --- Outputs from this function are returned to the command line.
function varargout = PrenMeh_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PrenMeh_Rac
%Funkcija za izbor komande 

%Ulazne velicine
%==========================================================================
%F_p             [N]     Sila na pedali(ne sme da predje vrednost od 500N)
%i_p             [/]     Prenosni odnos prenosnog mehanizma komande(4.5-7) 
%p_h             [MPa]   Maksimalni pritisak u sistemu (6-10MPa)
%d_gkc           [m]     Precnik glavnog kocnog cilindra
%K_sp            [/]     Pojacanje servo pojacala
%eta_mk          [/]     Stepen korisnosti komande 
%F_gkc           [N]     Sila na klipnjaci glavnog kocnog cilindra
%p_hmax          [MPa]   Najveci neregulisani pritisak u HPM-u (6-10(12)[MPa])
%f_pedale        [mm]    Hod pedale(vrednosti za mehanicki prenosni 
%sistem-ne treba da predje 150[mm], dok za servo pojacani sistem vrednosti
%bi trebalo da su u opsegu od 75 do 90[mm] da bi se ostvarilo usporenje od
%priblizno 1g)
%==========================================================================
%%
%Funkcija za unos podataka----
% koristi se naredba 'input' za unos preko komandne linije
% opcija 's' se odnosi na to da izlazni parametar bude string
% zatim se koristi komanda 'str2num' za pretvaranje stringa u numericki
% zapis 
%Primer---- InputStr_N=input('Unesi broj stepeni prenosa N:  ','s');
% N = str2num(InputStr_N);
%==========================================================================
F_pul=getappdata(0,'F_pmax'); %(max 500[N])-iz ulaznih podataka

i_p=getappdata(0,'i_p');      %Bice uneto iz trenutnog GUI-a
p_hmax=getappdata(0,'p_hmax');%Bice uneto iz proslog GUI-a
C_sp=getappdata(0,'C_sp');    %Bice uneto iz trenutnog GUI-a
eta_h=getappdata(0,'eta_h');  %Bice uneto iz proslog GUI-a

%Moze i da se usvoji i da se prema njemu dimenzionise prenosni odnos pedale

%Izracunavanje precnika glavnog kocnog cilindra[m]!
%==========================================================================

%Potrebna sila na klipnjaci glavnog kocnog cilindra [N]

F_gkc=F_pul.*i_p.*C_sp.*eta_h;
setappdata(0,'F_gkc',F_gkc)
%getappdata(0,'F_gkc')

%Izracunavanje precnika gkc [m]

A=4.*F_gkc;
B=p_hmax.*pi;
d_gkc=(A./B).^(1./2);



%Izracunavanje precnika glavnog kocnog cilindra[mm]!
%d_gkc=d_gkc%.*1000  %Potrebni precnik da bi se ostvarila potrebna sila,
                    %treba usvojiti najblizi precnik prema katalogu proizv.
setappdata(0,'d_gkc',d_gkc)
getappdata(0,'d_gkc');




function ip_Callback(hObject, eventdata, handles)
% hObject    handle to ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ip as text
%        str2double(get(hObject,'String')) returns contents of ip as a double

ip=str2double(get(hObject,'String'));
setappdata(0,'i_p',ip)

% --- Executes during object creation, after setting all properties.
function ip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function csp_Callback(hObject, eventdata, handles)
% hObject    handle to csp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of csp as text
%        str2double(get(hObject,'String')) returns contents of csp as a double
Csp=str2double(get(hObject,'String'));
setappdata(0,'C_sp',Csp)


% --- Executes during object creation, after setting all properties.
function csp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to csp (see GCBO)
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
d_gkcizl=str2double(get(hObject,'String'));
setappdata(0,'d_gkcizl',d_gkcizl)

A_gkc=((d_gkcizl.^2).*pi)./4;  %Izlazna povrsina potrebna za proracun sistema  
setappdata(0,'A_gkc',A_gkc)

h = waitbar(0,'Molimo da sacekate...');
steps = 1;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_PrenMeh

end
%Deo za ispisivanje upozorenja da podaci nisu uneti
bool_value=getappdata(0,'bool_value');

            if any(bool_value==0)

                warndlg('Nisu uneti svi podaci, unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end


close(h) 

close()

GUI_ZavProrBR


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

function print_PrenMeh

F_pul=getappdata(0,'F_pmax');
F_gkc=getappdata(0,'F_gkc');
i_p=getappdata(0,'i_p');
C_sp=getappdata(0,'C_sp');
d_gkc=getappdata(0,'d_gkcizl');
bool_data=[F_pul, i_p, C_sp, d_gkc];
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)



C=getappdata(0,'xls_ime_xls');

DataMatlab2XLS = {'d_gkc[mm]', 'F_gkc[N]','i_p[/]', 'C_sp[/]',...
   'F_pmax[N]';d_gkc F_gkc i_p C_sp  F_pul};
DataMatlab2XLSt=DataMatlab2XLS';
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt,'Izbor_komande','A1');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


PrenMeh_Rac

handles.Fgkc=num2str(getappdata(0,'F_gkc'));
handles.dgkc=num2str(getappdata(0,'d_gkc'));
Fgkc=handles.Fgkc;
dgkc=handles.dgkc;
set(handles.text20,'String',Fgkc)
set(handles.text21,'String',dgkc)
