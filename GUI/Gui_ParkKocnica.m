function varargout = Gui_ParkKocnica(varargin)
% GUI_PARKKOCNICA MATLAB code for Gui_ParkKocnica.fig
%      GUI_PARKKOCNICA, by itself, creates a new GUI_PARKKOCNICA or raises the existing
%      singleton*.
%
%      H = GUI_PARKKOCNICA returns the handle to a new GUI_PARKKOCNICA or the handle to
%      the existing singleton*.
%
%      GUI_PARKKOCNICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PARKKOCNICA.M with the given input arguments.
%
%      GUI_PARKKOCNICA('Property','Value',...) creates a new GUI_PARKKOCNICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_ParkKocnica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_ParkKocnica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_ParkKocnica

% Last Modified by GUIDE v2.5 07-Dec-2015 00:08:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_ParkKocnica_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_ParkKocnica_OutputFcn, ...
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


% --- Executes just before Gui_ParkKocnica is made visible.
function Gui_ParkKocnica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no outputfku args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_ParkKocnica (see VARARGIN)

% Choose default command line outputfku for Gui_ParkKocnica

RGB = imread('slika4.jpg');
imshow(RGB);

handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac

%Update handles structure
guidata(hObject, handles);
%set(handles.gui_parkkocnica, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8]) 
%setappdata(gcf, 'fhUpdateF_min_pot', @UpdateF_min_pot);
%Gui_ParkKocnica=getappdata(0,'Gui_ParkKocnica');

%GuiUlPod=getappdata(0,'GuiUlPod');


% UIWAIT makes Gui_ParkKocnica wait for user response (see UIRESUME)
% uiwait(handles.gui_parkkocnica);

% --- Outputs from this function are returned to the command line.
function varargout = Gui_ParkKocnica_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning outputfku args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line outputfku from handles structure
varargout{1} = handles.output;



function I_mp_Callback(hObject, eventdata, handles)
% hObject    handle to I_mp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of I_mp as text
%        str2double(get(hObject,'String')) returns contents of I_mp as a double
I_mp=get(hObject,'String');
I_mp=str2double(I_mp);
setappdata(0,'I_mp',I_mp)

% --- Executes during object creation, after setting all properties.
function I_mp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to I_mp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function I_pk_Callback(hObject, eventdata, handles)
% hObject    handle to I_pk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of I_pk as text
%        str2double(get(hObject,'String')) returns contents of I_pk as a double

I_pk=get(hObject,'String');
handles.I_pk=get(hObject,'String');
I_pk=str2double(I_pk);
setappdata(0,'I_pk',I_pk)


% --- Executes during object creation, after setting all properties.
function I_pk_CreateFcn(hObject,eventdata, handles)
% hObject    handle to I_pk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of u as text
%        str2double(get(hObject,'String')) returns contents of u as a double
u=get(hObject,'String');
u=str2double(u);
setappdata(0,'u',u)


% --- Executes during object creation, after setting all properties.
function u_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_pol_Callback(hObject, eventdata, handles)
% hObject    handle to F_pol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_pol as text
%        str2double(get(hObject,'String')) returns contents of F_pol as a double
F_pol=get(hObject,'String');
F_pol=str2double(F_pol);
setappdata(0,'F_pol', F_pol)

% --- Executes during object creation, after setting all properties.
function F_pol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_pol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function boolpk
rd=getappdata(0,'r_d');
F_min=getappdata(0,'F_min');
F_ostv=getappdata(0,'F_ostv');
F_pol=getappdata(0,'F_pol');
F_pol(isempty(F_pol))=0;
I_pk=getappdata(0,'I_pk');
I_pk(isempty(I_pk))=0;
I_mp=getappdata(0,'I_mp');
I_mp(isempty(I_mp))=0;
eta_m=getappdata(0,'eta_m');
r_srz=getappdata(0,'r_srz');
C_z=getappdata(0,'C_z');
u=getappdata(0,'u');
u(isempty(u))=0;

bool_data=[I_pk, I_mp, u];
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)






function UpdateF_min_pot

% Izracunavanje potrebne i ostvarene sile kocenja

%Ulazni podaci
%--------------------------------------------------------------------------
m_o=getappdata(0,'m_o');
I_pk=getappdata(0,'I_pk');
I_mp=getappdata(0,'I_mp');
eta_m=getappdata(0,'eta_m');
C_z=getappdata(0,'C_z');
r_d=getappdata(0,'r_d');
F_pol=getappdata(0,'F_pol' );
r_srz=getappdata(0,'r_srz_ul')./100;
u=getappdata(0,'u')./100;
setappdata(0,'u',(u.*100))

%Racunanje
%--------------------------------------------------------------------------
F_min=m_o.*10.*u; %Potrebna sila
setappdata(0,'F_min', F_min);
F_ostv=F_pol.*r_srz.*I_mp.*I_pk.*C_z.*eta_m./r_d;
setappdata(0,'F_ostv',F_ostv)

if F_ostv>F_min
    
    myicon1 = imread('checkmark.png');
    h=msgbox('Vozilo zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Informacija!!!','custom',myicon1);
              
   else
     myicon2 = imread('xmark.jpeg');
    h=msgbox('Vozilo ne zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Upozorenje!!','custom',myicon2);

end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%UpdateF_min_pot %Ubacivanje podataka u figure strukturu

%Prikazivanje vrednosti ukupne sile kocenja na GUI-u
%Deo za ispisivanje upozorenja da podaci nisu uneti
boolpk
bool_value=getappdata(0,'bool_value');

            if any(bool_value==0)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end


UpdateF_min_pot
F_min=getappdata(0,'F_min');
F_ostv=getappdata(0,'F_ostv');
F_min=num2str(F_min);
F_ostv=num2str(F_ostv);
set(handles.izlaz,'String',F_min)
set(handles.izlaz2,'String',F_ostv)


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

close()

%Aktiviranje sledeceg GUI-a-

%Bez regulacije
q_br=getappdata(0,'q_o');
%Sa ogranicivacem pritiska
q_sr1=getappdata(0,'q_oogr');
q_sr1(isnan(q_sr1))=0;
%Sa ARSK
q_sr2=getappdata(0,'q_okor');
q_sr2(isnan(q_sr2))=0;

if max(q_br)>0
    
    sw_value=1;
end

if max(q_sr1)>0
    
    sw_value=2;
end

if max(q_sr2)>0
    
    sw_value=3;
end



close()


switch sw_value
    
    case 1
        
close()
        Gui_dialog17
    
    case 2
       
close()
        Gui_dialog8
    
    case 3
        
close()
        Gui_dialog8
    
end
end




% --- Executes during object creation, after setting all properties.
function izlaz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to izlaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function izlaz2_Callback(hObject, eventdata, handles)
% hObject    handle to izlaz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of izlaz2 as text
%        str2double(get(hObject,'String')) returns contents of izlaz2 as a double
r_d=get(hObject,'String');
r_d=str2double(r_d);
setappdata(0,'r_d',r_d)
getappdata(0,'r_d');

function print_UlPod
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
rd=getappdata(0,'r_d');
F_min=getappdata(0,'F_min');
F_ostv=getappdata(0,'F_ostv');
F_pol=getappdata(0,'F_pol');
I_pk=getappdata(0,'I_pk');
I_mp=getappdata(0,'I_mp');
eta_m=getappdata(0,'eta_m');
r_srz=getappdata(0,'r_srz');
C_z=getappdata(0,'C_z');
u=getappdata(0,'u');

bool_data=[I_pk, I_mp, u];
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)

%Komanda za unos
DataMatlab2XLS = {'I_mp[/]', 'I_pk[/]','rd[m]','u[%]', 'r_srz[m]', ...
    'C_z[/]','eta_m[/]','F_ostv[N]','F_pol[N]','F_min[N]'...
    ; I_mp I_pk  rd u   r_srz  C_z eta_m...
    F_ostv F_pol F_min};
DataMatlab2XLSt=DataMatlab2XLS';

C=getappdata(0,'xls_ime_xls');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt, 'Parkirna_kocnica', 'A1');


% --- Executes during object creation, after setting all properties.
function izlaz2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to izlaz2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
