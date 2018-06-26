function varargout = Gui_RSKSR(varargin)
% GUI_RSKSR MATLAB code for Gui_RSKSR.fig
%      GUI_RSKSR, by itself, creates a new GUI_RSKSR or raises the existing
%      singleton*.
%
%      H = GUI_RSKSR returns the handle to a new GUI_RSKSR or the handle to
%      the existing singleton*.
%
%      GUI_RSKSR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_RSKSR.M with the given input arguments.
%
%      GUI_RSKSR('Property','Value',...) creates a new GUI_RSKSR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_RSKSR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_RSKSR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_RSKSR

% Last Modified by GUIDE v2.5 28-Dec-2014 13:09:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_RSKSR_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_RSKSR_OutputFcn, ...
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

%ISPRAVITI I OVDE CRTANJE DONJE GRANICE!!!
% --- Executes just before Gui_RSKSR is made visible.
function Gui_RSKSR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_RSKSR (see VARARGIN)

% Choose default command line output for Gui_RSKSR

handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac


PPK3
%plotovanje
axes(handles.axes1)
Dijagram1 
axes(handles.axes2)
Dijagram2
%Prikaz min i max vrednosti raspodele
handles.R_nomax=num2str(getappdata(0,'R_nomax'));
handles.R_nomin=num2str(getappdata(0,'R_nomin'));
handles.R_omax=num2str(getappdata(0,'R_omax'));
handles.R_omin=num2str(getappdata(0,'R_omin'));
R_nomin=handles.R_nomin;                            
R_nomax=handles.R_nomax;
R_omin=handles.R_omin;                            
R_omax=handles.R_omax;
set(handles.Rnomax,'String',R_nomin)                
set(handles.Rnomin,'String',R_nomax)                
set(handles.Romax,'String',R_omin)                
set(handles.Romin,'String',R_omax)                


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_RSKSR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_RSKSR_OutputFcn(hObject, eventdata, handles) 
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

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
R_no2=str2double(get(hObject,'String'));
setappdata(0,'R_no2',R_no2)

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

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
R_o2=str2double(get(hObject,'String'));
setappdata(0,'R_o2',R_o2)

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

function bool1
%Podaci za upis
R_no=getappdata(0,'R_no2');
R_no(isempty(R_no))=0;
R_o=getappdata(0,'R_o2');
R_o(isempty(R_o))=0;
bool_data=[R_no, R_o];
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Deo za ispisivanje upozorenja da podaci nisu uneti
bool1

bool_value=getappdata(0,'bool_value');

            if any(bool_value==0)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end




Karakteristika
handles.K=getappdata(0,'K');
K=handles.K;
set(handles.Kar,'String',K)
IskPrij
axes(handles.axes3)
Dijagram4
axes(handles.axes4)
Dijagram3

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
    print_RaspSKSR
end




close(h) 
close()
dialog11=getappdata(0,'dialog11');
if dialog11==1
    
    FTK
else
    
    Gui_dialog5
end
end


function PPK3
%%Funkcija koja racuna prethodni proracun 
%Odredjivanje raspodele sile kocenja R pomocu inverzije uslova za
%iskorisceno prijanjanje iz dijagrama 1a UNECE pravilnika broj 13, prilog 10
%R_g    [/] Gornja vrednost raspodele 
%R_d    [/] Donja vrednost raspodele 
%Raspodela se racuna i za optereceno i neoptereceno stanje

%%Ulazni Podaci 
l=getappdata(0,'L');
r_d=getappdata(0,'r_d');
m_o=getappdata(0,'m_o');
m_no=getappdata(0,'m_no');
l_pno=getappdata(0,'l_pno');
l_zno=getappdata(0,'l_zno');
h_cno=getappdata(0,'h_cno');
l_po=getappdata(0,'l_po');
l_zo=getappdata(0,'l_zo');
h_co=getappdata(0,'h_co');
a_max=getappdata(0,'a_max');
g=10;
q_max=a_max./g;
F_ku=getappdata(0,'F_ku');

q=[0:0.1:0.8];

setappdata(0,'q_plt',q)
%Proracun i dijagram raspodele za neoptereceno vozilo 
%R_gno=((q+0.07).*(L_zno+q.*h_cno))./((0.85.*L.*q)-(q+0.07).*(L_zno+q.*h_cno));
R_gno=((q+0.07).*(l_zno+q.*h_cno))./((0.85.*l.*q)-(q+0.07).*(l_zno+q.*h_cno));
setappdata(0,'R_gno1',R_gno)
    R_gno>0;
    R_gnoext=R_gno(R_gno>0);
    setappdata(0,'R_gno2',R_gnoext)

R_dno=(l_zno+(q.*h_cno))./(l_pno-(q.*h_cno));
setappdata(0,'R_dno1',R_dno)
    R_dno>0;
    R_dnoext=R_dno(R_dno>0);
    setappdata(0,'R_dno2',R_dnoext)
%Poracun i dijagram raspodele za optereceno vozilo 

R_go=((q+0.07).*(l_zo+q.*h_co))./((0.85.*l.*q)-(q+0.07).*(l_zo+q.*h_co));
setappdata(0,'R_go1',R_go)    
    R_go>0;
    R_goext=R_go(R_go>0);
    setappdata(0,'R_go2',R_goext)
R_do=(l_zo+(q.*h_co))./(l_po-(q.*h_co));
setappdata(0,'R_do1',R_do) 
    R_do>0;
    R_doext=R_do(R_do>0);
     setappdata(0,'R_do2',R_doext)
%Odredjivanje ekstremnih vrednosti
Rgrno1=max(R_dnoext);
setappdata(0,'R_nomax',Rgrno1)
Rgrno2=min(R_gnoext);

if isempty(Rgrno2)
   
    Rgrno2=0;
    
end
setappdata(0,'R_nomin',Rgrno2)
Rgro1=max(R_doext);
setappdata(0,'R_omax',Rgro1)
Rgro2=min(R_goext);
setappdata(0,'R_omin',Rgro2)


function Karakteristika
%Izbor konacno usvojenih raspodela 
%%==========================================================================
Rno = getappdata(0,'R_no2');
%---------------------------------------------------------------------------
Ro = getappdata(0,'R_o2');

%Konstanta korektora kocenja
%==========================================================================
K=Ro./Rno;
setappdata(0,'K',K)

        if isnan(K)
         warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end

        if isinf(K)
            warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end

%--------------------------------------------------------------------------
function Dijagram1

R_gno=getappdata(0,'R_gno1');
R_dno=getappdata(0,'R_dno1');
q=getappdata(0,'q_plt');
cla
hold on
plot(q,R_gno,'--');
plot(q,R_dno);
xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_gno','R_dno');
grid on
axis([0.2 0.8 0 8]);
%==========================================================================
function Dijagram2
R_go=getappdata(0,'R_go1');
R_do=getappdata(0,'R_do1');
q=getappdata(0,'q_plt');
cla
hold on
plot(q,R_do,'-m');
plot(q,R_go,'-c');
axis([0.2 0.8 0 8]);

xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_do','R_go');
grid on
function IskPrij

Rno=getappdata(0,'R_no2');
Ro=getappdata(0,'R_o2');
m_no=getappdata(0,'m_no');
m_o=getappdata(0,'m_o');
l=getappdata(0,'L');
l_pno=getappdata(0,'l_pno');
l_zno=getappdata(0,'l_zno');
l_po=getappdata(0,'l_po');
l_zo=getappdata(0,'l_zo');

h_co=getappdata(0,'h_co');
h_cno=getappdata(0,'h_cno');
g=10;
phiplt=[0:0.1:0.8];
setappdata(0,'phi_plt',phiplt)
q=[ 0:0.1:0.8 ];
%==========================================================================
%Dinamicke reakcije napred i pozadi neoptereceno vozilo

Z_pdno=((m_no.*g)./l).*(l_zno+q.*h_cno);
setappdata(0,'Z_pdno1',Z_pdno)
Z_zdno=((m_no.*g)./l).*(l_pno-q.*h_cno);
setappdata(0,'Z_zdno1',Z_zdno)

%Dinamicke reakcije napred i pozadi optereceno vozilo

Z_pdo=((m_o.*g)./l).*(l_zo+q.*h_co);
setappdata(0,'Z_pdo1',Z_pdo)
Z_zdo=((m_o.*g)./l).*(l_po-q.*h_co);
setappdata(0,'Z_zdo1',Z_zdo)
%==========================================================================
%Sile kocenja napred i pozadi u neopterecenom i opterecenom stanju

%Neoptereceno
Fk_pno=(Rno./(1+Rno)).*m_no.*q*10;
Fk_zno=(1./(1+Rno)).*m_no.*q*10;

%Optereceno
Fk_po=(Ro./(1+Ro)).*m_o.*q*10;
Fk_zo=(1./(1+Ro)).*m_o.*q*10;

%==========================================================================
%Iskorisceno prijanjanje napred i pozadi u slucaju opterecenog i
%neopterecenog stanja 

%Iskorisceno prijanje u opterecenom stanju
phipo=Fk_po./Z_pdo;
setappdata(0,'phi_po2',phipo)
phizo=Fk_zo./Z_zdo;
setappdata(0,'phi_zo2',phizo)

%Iskorisceno prijanje u neopterecenom stanju
phipno=Fk_pno./Z_pdno;
setappdata(0,'phi_pno2',phipno)
phizno=Fk_zno./Z_zdno;
setappdata(0,'phi_zno2',phizno)
%==========================================================================
function Dijagram3 
q_02=[0.2:0.1:0.8];
phi_02=(q_02+0.07)./(0.85);
q_03=[0.3:0.05:0.45];
phi_03=q_03+0.05;
phipo=getappdata(0,'phi_po2');
phizo=getappdata(0,'phi_zo2');
q=getappdata(0,'q_plt');
phi=getappdata(0,'phi_plt');
%Optereceno stanje 
cla
plot(q, phi);
hold on
plot(q, phipo,'-m');
plot(q, phizo,'-k');
gr1=plot(q_02,phi_02);
set(gr1,'color','red','LineWidth',2);
gr2=plot(q_03,phi_03);
set(gr2,'color','yellow','LineWidth',2);
xlabel('q[/]');
ylabel('phi[/]');
hleg1 = legend('\phi =q','\phi_{po}','\phi_{zo}','\phi_{gr1}','\phi_{gr2}');
%--------------------------------------------------------------------------
function Dijagram4
q_02=[0.2:0.1:0.8];
phi_02=(q_02+0.07)./(0.85);
q_03=[0.3:0.05:0.45];
phi_03=q_03+0.05;
phipno=getappdata(0,'phi_pno2');
phizno=getappdata(0,'phi_zno2');
q=getappdata(0,'q_plt');
phi=getappdata(0,'phi_plt');
%Optereceno stanje 
cla
plot(q, phi);
hold on
plot(q, phipno,'-m');
plot(q, phizno,'-k');
gr1=plot(q_02,phi_02);
set(gr1,'color','red','LineWidth',2);
gr2=plot(q_03,phi_03);
set(gr2,'color','yellow','LineWidth',2);
xlabel('q[/]');
ylabel('phi[/]');
hleg1 = legend('\phi =q','\phi_{po}','\phi_{zo}','\phi_{gr1}','\phi_{gr2}');

function print_RaspSKSR
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
q=getappdata(0,'q_plt');
R_gno=getappdata(0,'R_gno');
R_dno=getappdata(0,'R_dno');
R_go=getappdata(0,'R_go');
R_do=getappdata(0,'R_do');
R_no=getappdata(0,'R_no2');
R_o=getappdata(0,'R_o2');
C=getappdata(0,'xls_ime_xls');
bool_data=[R_no, R_o];
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)
%Komanda za unos

A={'R_gno[/]','R_dno[/]', 'R_go[/]' ,'R_do[/]'};
At=A';
A1={'R_ousvj[/]','R_nousvj[/]'};
A1t=A1';
DataMatlab2XLS = [ R_gno; R_dno; R_go; R_do ];
DataMatlab2XLS1 = ([ R_o, R_no ])';

warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'Predhodni_proracun_Kocenja'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A1t, 'Predhodni_proracun_Kocenja'...
, 'A5');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS, 'Predhodni_proracun_Kocenja'...
, 'B1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1, 'Predhodni_proracun_Kocenja'...
, 'B5');






% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
