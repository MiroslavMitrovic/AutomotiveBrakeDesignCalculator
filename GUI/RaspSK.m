function varargout = RaspSK(varargin)
% RASPSK MATLAB code for RaspSK.fig
%      RASPSK, by itself, creates a new RASPSK or raises the existing
%      singleton*.
%
%      H = RASPSK returns the handle to a new RASPSK or the handle to
%      the existing singleton*.
%
%      RASPSK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RASPSK.M with the given input arguments.
%
%      RASPSK('Property','Value',...) creates a new RASPSK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RaspSK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RaspSK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RaspSK

% Last Modified by GUIDE v2.5 02-Feb-2016 23:48:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RaspSK_OpeningFcn, ...
                   'gui_OutputFcn',  @RaspSK_OutputFcn, ...
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

% --- Executes just before RaspSK is made visible.
function RaspSK_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RaspSK (see VARARGIN)

% Choose default command line output for RaspSK
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac


%handles.m_o=num2str(getappdata(0,'m_o'))
% Update handles structure
guidata(hObject, handles);


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


% UIWAIT makes RaspSK wait for user response (see UIRESUME)
% uiwait(handles.Gui_RASPSK);


% --- Outputs from this function are returned to the command line.
function varargout = RaspSK_OutputFcn(hObject, eventdata, handles) 
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
R_gno>0;
R_gnoext=R_gno(R_gno>0);
R_dno=(L_zno+(q.*h_cno))./(L_pno-(q.*h_cno));
R_dno>0;
R_dnoext=R_dno(R_dno>0);


%Poracun i dijagram raspodele za optereceno vozilo 

R_go=((q+0.07).*(L_zo+q.*h_co))./((0.85.*L.*q)-(q+0.07).*(L_zo+q.*h_co));
R_go>0;
R_goext=R_go(R_go>0);

R_do=(L_zo+(q.*h_co))./(L_po-(q.*h_co));
R_do>0;
R_doext=R_do(R_do>0);
%Odredjivanje ekstremnih vrednosti


for i=5:1:9
R_g(i,:)=[R_go(1,i); R_gno(1,i)];
R_d(i,:)=[R_do(1,i); R_dno(1,i)];
end


R_g=R_g(R_g>0);
R_d=R_d(R_d>0);

R_gmin=min(R_g);%Maksimalna vrednost raspodele
setappdata(0,'R_max',R_gmin)
R_dmin=min(R_d);
R_dmax=max(R_d);%Minimalna vrednost raspodele
setappdata(0,'R_min',R_dmax)
%Za slucaj kada je Rdno manje od Rgo


        if R_gmin<R_dmax
                        
            warndlg('Izbor konstantne raspodele nije moguc!!!','UPOZORENJE')
            
        end
            
setappdata(0,'R_gno',R_gno)
setappdata(0,'R_dno',R_dno)
setappdata(0,'R_go',R_go)
setappdata(0,'R_do',R_do)




function plot_diagram

%Dijagram
%Podeliti Rgo i Rgno na 2 plota da bi nastao odgovarajuci razmak...
%To ne utice na racunanje Max i Min...
q=getappdata(0,'q');
R_gno=getappdata(0,'R_gno');
R_dno=getappdata(0,'R_dno');
R_go=getappdata(0,'R_go');
R_do=getappdata(0,'R_do');
L=getappdata(0,'L');
l_po=getappdata(0,'l_po');
l_pno=getappdata(0,'l_pno');
h_co=getappdata(0,'h_co');
h_cno=getappdata(0,'h_cno');
l_zo=getappdata(0,'l_zo');
l_zno=getappdata(0,'l_zno');

q1=[q(1,4),q(1,5), 0.45];
% R_do1=[4, 5 , 6];
% R_do(R_do1)=[];
% R_dno(R_do1)=[];
% q2=q;
% q2(R_do1)=[];
R_do2=(L.*q1)./((l_po-q1.*h_co).*(q1+0.05))-1;
R_dno2=(L.*q1)./((l_pno-q1.*h_cno).*(q1+0.05))-1;

        for i=1:4

            q_plot1(1,i)=q(1,i);
            R_doplot1(1,i)=R_do(1,i);
            R_dnoplot1(1,i)=R_dno(1,i);

        end
%Deo prvi krivih
q_plot2=0.45;
R_doplot2=(l_zo+(q_plot2.*h_co))./(l_po-(q_plot2.*h_co));
R_dnoplot2=(l_zno+(q_plot2.*h_cno))./(l_pno-(q_plot2.*h_cno));
%Deo Drugi krivih
q_plot2=[q_plot2, q(1,6), q(1,7), q(1,8), q(1,9)];
R_doplot2=[R_doplot2, R_do(1,6), R_do(1,7), R_do(1,8), R_do(1,9)];       
R_dnoplot2=[R_dnoplot2, R_dno(1,6), R_dno(1,7), R_dno(1,8), R_dno(1,9)];       
            
        
        

cla
hold on
plot(q,R_gno,'--');
plot(q_plot2,R_dnoplot2);
plot(q_plot2,R_doplot2,'-m');
plot(q_plot1,R_dnoplot1);
plot(q_plot1,R_doplot1,'-m');
plot(q,R_go,'-c');
plot(q1,R_do2,'--k');
plot(q1,R_dno2,'--r');
axis([0.2 0.8 0 12]);
% 
xlabel('q[/]');
ylabel('R[/]');
hleg1 = legend('R_gno','R_dno','R_do','R_go','R_do1', 'R_dno1');
grid on



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
R= str2double(get(hObject,'String'))
setappdata(0,'R',R)


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
q_02=[0.2:0.1:0.8];
phi_02=(q_02+0.07)./(0.85);
q_03=[0.3:0.05:0.45];
phi_03=q_03+0.05;
%Optereceno stanje 
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
C=getappdata(0,'xls_ime_xls');





%Komanda za unos

A={'q[/]','R_gno[/]','R_dno[/]', 'R_go[/]' ,'R_do[/]','R_usvojeno[/]'};
At=A';
DataMatlab2XLS = [q; R_gno; R_dno; R_go; R_do ];

warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, At, 'Predhodni_proracun_Kocenja'...
, 'A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLS, 'Predhodni_proracun_Kocenja'...
, 'B1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, R, 'Predhodni_proracun_Kocenja'...
, 'B5');






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

R=getappdata(0,'R');
R(isempty(R))=0;
%Podaci za upozorenje


bool_value=logical(R);
setappdata(0,'bool_value', bool_value)

bool_value=getappdata(0,'bool_value');

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
Dialog1

end

% Get the current position of the GUI from the handles structure
% to pass to the modal dialog.





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
