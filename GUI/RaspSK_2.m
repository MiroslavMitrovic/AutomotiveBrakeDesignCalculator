function varargout = RaspSK_2(varargin)
% RASPSK_2 MATLAB code for RaspSK_2.fig
%      RASPSK_2, by itself, creates a new RASPSK_2 or raises the existing
%      singleton*.
%
%      H = RASPSK_2 returns the handle to a new RASPSK_2 or the handle to
%      the existing singleton*.
%
%      RASPSK_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RASPSK_2.M with the given input arguments.
%
%      RASPSK_2('Property','Value',...) creates a new RASPSK_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RaspSK_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RaspSK_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RaspSK_2

% Last Modified by GUIDE v2.5 04-Mar-2016 22:37:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RaspSK_2_OpeningFcn, ...
                   'gui_OutputFcn',  @RaspSK_2_OutputFcn, ...
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

% --- Executes just before RaspSK_2 is made visible.
function RaspSK_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RaspSK_2 (see VARARGIN)

% Choose default command line output for RaspSK_2
handles.output = hObject;


%handles.m_o=num2str(getappdata(0,'m_o'))
% Update handles structure
guidata(hObject, handles);
set(handles.Counter,'String',0)%handles za brojac

%set(handles.Gui_RASPSK, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])

RaspSileKoc                                     % Racunjanje
axes(handles.axes1)
plot_diagram                                    % Plotovanje
handles.R_max=num2str(getappdata(0,'R_max'));
handles.R_min=num2str(getappdata(0,'R_min'));
R_min=handles.R_min;                            
R_max=handles.R_max;
set(handles.min,'String',R_min)                 % Prikazivanje Min vrednosti
set(handles.max,'String',R_max)                 % Prikazivanje Max vrednosti

%Stalno apdejtovanje
%--------------------------------------------------------------------------
setappdata(gcf, 'RaspSileKoc', @RaspSileKoc);
setappdata(gcf, 'plot_diagram', @plot_diagram);
setappdata(gcf, 'IskPrij', @IskPrij1);
%--------------------------------------------------------------------------


% UIWAIT makes RaspSK_2 wait for user response (see UIRESUME)
% uiwait(handles.Gui_RASPSK);


% --- Outputs from this function are returned to the command line.
function varargout = RaspSK_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function RaspSileKoc



L=getappdata(0,'L');
r_d=getappdata(0,'r_d');
m_o=getappdata(0,'m_o');
m_no=getappdata(0,'m_no');
L_pno=getappdata(0,'l_pno');
L_zno=getappdata(0,'l_zno');
L_po=getappdata(0,'l_po');
L_zo=getappdata(0,'l_zo');
h_co=getappdata(0,'h_co');
h_cno=getappdata(0,'h_cno');
q=[0:0.1:0.8];
setappdata(0,'q',q);


%Proracun i dijagram raspodele za neoptereceno vozilo 
%Odredjeno je da je maksimalna vrednost teorijske raspodele minimalna
%vrednost gornje granice raspodele u opterecenom i neopterecenom stanju, i
%suprotno sto se tice donje granice raspodele, maksimalna vrednost gornje
%granice raspodele u opterecenom i neopterecenom stanju
R_gno=((q+0.07).*(L_zno+q.*h_cno))./((0.85.*L.*q)-(q+0.07).*(L_zno+q.*h_cno));

for i=4:1:9
        qr1(1,i-3)=q(1,i);
end    
R_dno=((0.74.*L.*qr1)./((L_pno-qr1.*h_cno).*(qr1-0.02)))-1;



%Poracun i dijagram raspodele za optereceno vozilo 

R_go=((q+0.07).*(L_zo+q.*h_co))./((0.85.*L.*q)-(q+0.07).*(L_zo+q.*h_co));


R_do=((0.74.*L.*qr1)./((L_po-qr1.*h_co).*(qr1-0.02)))-1;



%Prednja osovina 

qr2(1,:)=0.15:0.05:0.3;

R_dpno=((qr2-0.08).*(L_zno+qr2.*h_cno))./((L.*qr2)-(L_zno+qr2.*h_cno).*(qr2-0.08));
R_dpo=((qr2-0.08).*(L_zo+qr2.*h_co))./((L.*qr2)-(L_zo+qr2.*h_co).*(qr2-0.08));

%Zadnja osovina

R_dzno=(((L.*qr2)./((L_pno-qr2.*h_cno).*(qr2+0.08))))-1;
R_dzo=(((L.*qr2)./((L_po-qr2.*h_co).*(qr2+0.08))))-1;

%Odredjivanje ekstremnih vrednosti

for i=1:1:9
 
    
        R_g(i,:)=[R_go(1,i); R_gno(1,i)];
       
end

R_g=R_g(R_g>0);

%Maksimalna vrednost raspodele
R_max=min(R_g);

for i=1:1:6
    
   R_d(i,:)=[R_dno(1,i); R_do(1,i)]; 
    
end

R_d=R_d(R_d>0);

for i=1:1:4

     R_dos(i,:)=[R_dpo(1,i); R_dzo(1,i);R_dpno(1,i); R_dzno(1,i)];
    
end



R_dos=R_dos(R_dos>0);

R_min1=max(R_dos);
R_min2=max(R_d);
%Minimum vrednosti raspodele
R_min=max(R_min1,R_min2);

 setappdata(0,'q_r1',qr1)
 setappdata(0,'q_r2',qr2)   
 setappdata(0,'R_dpno',R_dpno)
 setappdata(0,'R_dpo',R_dpo)
 setappdata(0,'R_dzno',R_dzno)
 setappdata(0,'R_dzo',R_dzo)
 setappdata(0,'R_gno',R_gno)
 setappdata(0,'R_dno',R_dno)
 setappdata(0,'R_go',R_go)
 setappdata(0,'R_do',R_do)
 setappdata(0,'R_max', R_max)
 setappdata(0,'R_min', R_min)


function plot_diagram

%Dijagram
%Podeliti Rgo i Rgno na 2 plota da bi nastao odgovarajuci razmak...
%To ne utice na racunanje Max i Min...
q=getappdata(0,'q');
R_gno=getappdata(0,'R_gno');
R_dno=getappdata(0,'R_dno');
R_go=getappdata(0,'R_go');
R_do=getappdata(0,'R_do');
q_r1=getappdata(0,'q_r1');
q_r2=getappdata(0,'q_r2');
R_dpno=getappdata(0,'R_dpno');
R_dpo=getappdata(0,'R_dpo');
R_dzno=getappdata(0,'R_dzno');
R_dzo=getappdata(0,'R_dzo');

cla
hold on
plot(q,R_gno,'--');
plot(q_r1,R_dno,'-y')
plot(q_r1,R_do,'-m')
plot(q,R_go,'-c');
plot(q_r2,R_dpno,'--r')
plot(q_r2,R_dpo,'-r')
plot(q_r2,R_dzno,'--k')
plot(q_r2,R_dzo,'-k')




axis([0.2 0.8 0 12]);
 
xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_gno','R_dno','R_do','R_go','R_dpno', 'R_dpo','R_dzno','R_dzo');
grid on



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
R=get(hObject,'String');
R=str2double(R);
setappdata(0,'R',R)
%Podaci za upozorenje


function IskPrij1
R=getappdata(0,'R');
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
phi=[0:0.1:0.8];
q=[ 0:0.1:0.8 ];
%==========================================================================
%Dinamicke reakcije napred i pozadi neoptereceno vozilo

Z_pdno=((m_no.*g)./l).*(l_zno+q.*h_cno);
Z_zdno=((m_no.*g)./l).*(l_pno-q.*h_cno);


%Dinamicke reakcije napred i pozadi optereceno vozilo

Z_pdo=((m_o.*g)./l).*(l_zo+q.*h_co);
Z_zdo=((m_o.*g)./l).*(l_po-q.*h_co);

%==========================================================================
%Sile kocenja napred i pozadi u neopterecenom i opterecenom stanju

%Neoptereceno
Fk_pno=(R./(1+R)).*m_no.*q*10;
Fk_zno=(1./(1+R)).*m_no.*q*10;

%Optereceno
Fk_po=(R./(1+R)).*m_o.*q*10;
Fk_zo=(1./(1+R)).*m_o.*q*10;

%==========================================================================
%Iskorisceno prijanjanje napred i pozadi u slucaju opterecenog i
%neopterecenog stanja 

%Iskorisceno prijanje u opterecenom stanju
phipo=Fk_po./Z_pdo;
phizo=Fk_zo./Z_zdo;

%Iskorisceno prijanje u neopterecenom stanju
phipno=Fk_pno./Z_pdno;
phizno=Fk_zno./Z_zdno;
%==========================================================================
%Crtanje dijagrama krivih iskoriscenog prijanjanja 
cla
q_02=0.2:0.1:0.8;
phi_02=(q_02+0.07)./(0.85);
q_03=0.3:0.1:0.8;
phi_03=(q_03-0.02)./(0.74);
q_04=0.15:0.05:0.30;
phi_041=q_04+0.08;
phi_042=q_04-0.08;
%Optereceno stanje 
plot(q, phi);
hold on
plot(q, phipo,'-m');
plot(q, phizo,'-k');
plot(q, phipno,'--m');
plot(q, phizno,'--k');
gr1=plot(q_02,phi_02);
set(gr1,'color','red','LineWidth',2);
gr2=plot(q_03,phi_03);
set(gr2,'color','yellow','LineWidth',2);
gr3=plot(q_04,phi_041);
set(gr3,'color','black','LineWidth',2);
gr4=plot(q_04,phi_042);
set(gr4,'color','cyan','LineWidth',2);
xlabel('q[/]');
ylabel('phi[/]');
hleg1 = legend('\phi =q','\phi_{po}','\phi_{zo}','\phi_{pno}','\phi_{zno}','\phi_{gr1}=(q_02+0.07)./(0.85);'...
    ,'\phi_{gr2}=(q_03-0.02)./(0.74)','\phi_{gr3}=q_04+0.08','\phi_{gr4}=q_04-0.08');

function print_RaspSK
%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis
q=getappdata(0,'q');
R_gno=getappdata(0,'R_gno');
R_dno=getappdata(0,'R_dno');
R_go=getappdata(0,'R_go');
R_do=getappdata(0,'R_do');
R=getappdata(0,'R');
q_r1=getappdata(0,'q_r1');
q_r2=getappdata(0,'q_r2');
R_dpno=getappdata(0,'R_dpno');
R_dpo=getappdata(0,'R_dpo');
R_dzno=getappdata(0,'R_dzno');
R_dzo=getappdata(0,'R_dzo');
C=getappdata(0,'xls_ime_xls');





%Komanda za unos

A={'q[/]','R_gno[/]','q_r1[/]', 'R_dno[/]' ,'q_r2[/]',...
    'R_dpno[/]','R_dzno[/]', 'q[/]' ,'R_go[/]','q_r1[/]'...
    ,'R_do[/]','q_r2[/]','R_dpo[/]','R_dzo[/]','R_usvojeno[/]'};
At=A';
DataMatlab2XLS1 = [q; R_gno];
DataMatlab2XLS2=[q_r1;R_dno];
DataMatlab2XLS3=[q_r2; R_dpno; R_dzno];
DataMatlab2XLS4 = [q; R_go];
DataMatlab2XLS5=[q_r1;R_do];
DataMatlab2XLS6=[q_r2; R_dpo; R_dzo];

warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'Predhodni_proracun_Kocenja'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS1, 'Predhodni_proracun_Kocenja'...
, 'B1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS2, 'Predhodni_proracun_Kocenja'...
, 'B3');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS3, 'Predhodni_proracun_Kocenja'...
, 'B5');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS4, 'Predhodni_proracun_Kocenja'...
, 'B8');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS5, 'Predhodni_proracun_Kocenja'...
, 'B10');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS6, 'Predhodni_proracun_Kocenja'...
, 'B12');


warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, R, 'Predhodni_proracun_Kocenja'...
, 'B15');






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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


bool_data=getappdata(0,'R');
bool_data(isnan(bool_data))=0;
bool_value=logical(bool_data);
setappdata(0,'bool_value', bool_value)

%Upozorenje o unosu podataka
if any(bool_value==0)
    
    warndlg('Molim Vas unesite vrednost konstantne raspodele i pritisnite dugme dalje!!!','UPOZORENJE')
    error('Vrednost nije uneta')
    
end

axes(handles.axes2)
IskPrij1


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
    print_RaspSK

end


 

close(h)
close()
Gui_Dialog12

end



% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in nazad.
function nazad_Callback(hObject, eventdata, handles)
% hObject    handle to nazad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
Gui_UlPod
