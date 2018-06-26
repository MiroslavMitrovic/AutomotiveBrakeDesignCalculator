function varargout = GUI_Otkaz_PomocnoKocenje(varargin)
% GUI_OTKAZ_POMOCNOKOCENJE MATLAB code for GUI_Otkaz_PomocnoKocenje.fig
%      GUI_OTKAZ_POMOCNOKOCENJE, by itself, creates a new GUI_OTKAZ_POMOCNOKOCENJE or raises the existing
%      singleton*.
%
%      H = GUI_OTKAZ_POMOCNOKOCENJE returns the handle to a new GUI_OTKAZ_POMOCNOKOCENJE or the handle to
%      the existing singleton*.
%
%      GUI_OTKAZ_POMOCNOKOCENJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_OTKAZ_POMOCNOKOCENJE.M with the given input arguments.
%
%      GUI_OTKAZ_POMOCNOKOCENJE('Property','Value',...) creates a new GUI_OTKAZ_POMOCNOKOCENJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Otkaz_PomocnoKocenje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Otkaz_PomocnoKocenje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Otkaz_PomocnoKocenje

% Last Modified by GUIDE v2.5 06-Sep-2016 01:24:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Otkaz_PomocnoKocenje_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Otkaz_PomocnoKocenje_OutputFcn, ...
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
% --- Executes just before GUI_Otkaz_PomocnoKocenje is made visible.
function GUI_Otkaz_PomocnoKocenje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Otkaz_PomocnoKocenje (see VARARGIN)

% Choose default command line output for GUI_Otkaz_PomocnoKocenje
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);


%set(handles.Gui_ZAVPRBR, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])
 


% UIWAIT makes GUI_Otkaz_PomocnoKocenje wait for user response (see UIRESUME)
% uiwait(handles.Gui_ZAVPRBR);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Otkaz_PomocnoKocenje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function ZavPror_Rac
%%
%Velicine 
%==========================================================================
%F_kp               [N]     Sila kocenja na prednjoj osovini 
%F_kz               [N]     Sila kocenja na zadnjoj osovini 
%q_op               [/]     Kocni koeficient za optereceno vozilo 
%q_no               [/]     Kocni koeficient za neoptereceno vozilo 
%Z_pd               [N]     Dinamicke reakcije na prednjoj osovini 
%Z_zd               [N]     Dinamicke reakcije na zadnjoj osovini 
%phi_p              [/]     Iskorisceno prijanjanje na prednjoj osovini
%phi_z              [/]     Iskorisceno prijanjanje na zadnjoj osovini
%m_o                [kg]    Masa opterecenog vozila 
%==========================================================================
%%
%Ulazni podaci 
%==========================================================================
l=getappdata(0,'L');
lpo=getappdata(0,'l_po');
lzo=getappdata(0,'l_zo');
hco=getappdata(0,'h_co');
lpno=getappdata(0,'l_pno');
lzno=getappdata(0,'l_zno');
hcno=getappdata(0,'h_cno');
phi=0.8;
m_o=getappdata(0,'m_o');
m_no=getappdata(0,'m_no');

        
        F_pklc=getappdata(0,'F_pklc');
        i_zk=getappdata(0,'i_zk');
        F_pklc=F_pklc.*i_zk;

        N=20;
        F_pklc_inc=F_pklc./N;
        F_pklc=0:F_pklc_inc:F_pklc;
        setappdata(0,'F_pklc',F_pklc)
         
        
        %Pomocno kocenje Optereceno stanje
        q_otkpo=(F_pklc)./(m_o.*10);
        Zzd_bro=((m_o.*10)./l).*(lpo-(q_otkpo.*hco));
        F_zphio=Zzd_bro.*phi;
        
       
        %Pomocno kocenje Neoptereceno stanje
        q_otkpno=(F_pklc)./(m_no.*10);
        Zzd_brno=((m_no.*10)./l).*(lpno-(q_otkpno.*hcno));
        F_zphino=Zzd_brno.*phi;
       
setappdata(0,'q_otkpo',q_otkpo)
setappdata(0,'q_otkpno',q_otkpno)
setappdata(0,'Zzd_bro',Zzd_bro)
setappdata(0,'Zzd_brno',Zzd_brno)
setappdata(0,'F_zphio',F_zphio)
setappdata(0,'F_zphino',F_zphino)
a=getappdata(0,'F_pklc')


function warn_dialog

q_po=getappdata(0,'q_otkpo');
q_pno=getappdata(0,'q_otkpno');
q_okt=[max(q_po),max(q_pno)];

qpr_bool=(q_okt>0.2);

   if qpr_bool>0
   
    myicon1 = imread('checkmark.png');
    h=msgbox('Vozilo zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Informacija!!!','custom',myicon1);
              
   else
     myicon2 = imread('xmark.jpeg');
    h=msgbox('Vozilo ne zadovoljava uslove sa stanovista kocnih performansi prema pravilniku','Upozorenje!!','custom',myicon2);


   end
       

%%
function DiagramBR1 %OTKAZ PREDNJEG KOCNOG KRUGA OPTERECENO
%==========================================================================
F_pklc=getappdata(0,'F_pklc');
i_zk=getappdata(0,'i_zk');
F_pklc=F_pklc.*i_zk;

q_otkpo=getappdata(0,'q_otkpo');
F_zphio=getappdata(0,'F_zphio');

        
hold on

plot(q_otkpo,F_pklc,'-c')
plot(q_otkpo,F_zphio,'-r')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('F_pklc','Fzphiopt')



function DiagramBR2 %OTKAZ PREDNJEG KOCNOG KRUGA NEOPTERECENO
%==========================================================================
F_pklc=getappdata(0,'F_pklc');
i_zk=getappdata(0,'i_zk');
F_pklc=F_pklc.*i_zk;
q_otkpno=getappdata(0,'q_otkpno');
F_zphino=getappdata(0,'F_zphino');


hold on

plot(q_otkpno,F_pklc,'--c')
plot(q_otkpno,F_zphino,'--r')
grid on
xlabel('q[/]');
ylabel('F[N]');
legend('F_pklc','Fzphineopt')







function print_otk
%Optereceno
q_otkpo=getappdata(0,'q_otkpo');
F_zphio=getappdata(0,'F_zphio');
%Neoptereceno
F_pklc=getappdata(0,'F_pklc');
i_zk=getappdata(0,'i_zk');
F_pklc=F_pklc.*i_zk;
q_otkpno=getappdata(0,'q_otkpno');
F_zphino=getappdata(0,'F_zphino');
DataMatlab2XLS1=[q_otkpo;F_zphio];  
DataMatlab2XLS2=[q_otkpno;F_zphino];   
C=getappdata(0,'xls_ime_xls');

nule=zeros([100,100]);
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'Pomocno Kocenje','A1');
DataMatlab2XLS = {'F_pklc[N]', 'q_otkpo[/]','F_zphio[N]','q_oktpno[/]', 'F_zphino[N]'};
DataMatlab2XLSt=DataMatlab2XLS';
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt,'Pomocno Kocenje','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, F_pklc,'Pomocno Kocenje','B1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1,'Pomocno Kocenje','B2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS2,'Pomocno Kocenje','B4');

 

function F_pklc_Callback(hObject, eventdata, handles)
% hObject    handle to F_pklc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of F_pklc as text
%        str2double(get(hObject,'String')) returns contents of F_pklc as a double
counter=str2double(get(handles.Counter,'String'));
if counter<1
F_pklc= str2double(get(hObject,'String'));
setappdata(0,'F_pklc',F_pklc)
end

% --- Executes during object creation, after setting all properties.
function F_pklc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_pklc (see GCBO)
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
bool_data=getappdata(0,'F_pklc');
bool_data(isempty(bool_data))=0;
bool_value=logical(bool_data);

if any(bool_value)==0
    
    
                warndlg('Nisu uneti svi podaci, unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')
                
end

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
if counter==1
ZavPror_Rac               %Racunanje
axes(handles.slika1)%Plotovanje prvog dijagrama
DiagramBR1
axes(handles.slika3)
DiagramBR2                 %Plotovanje drugog dijagrama
end
if counter>1

h = waitbar(0,'Molimo da sacekate...');
warn_dialog                 %Prozor upozorenja da li vozilo ispunjava uslove
steps = 1;
close()
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_otk
    close('all')
    Gui_ParkKocnica_N2
end
end