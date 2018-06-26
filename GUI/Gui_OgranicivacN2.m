function varargout = Gui_OgranicivacN2(varargin)
% GUI_OGRANICIVACN2 MATLAB code for Gui_OgranicivacN2.fig
%      GUI_OGRANICIVACN2, by itself, creates a new GUI_OGRANICIVACN2 or raises the existing
%      singleton*.
%
%      H = GUI_OGRANICIVACN2 returns the handle to a new GUI_OGRANICIVACN2 or the handle to
%      the existing singleton*.
%
%      GUI_OGRANICIVACN2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_OGRANICIVACN2.M with the given input arguments.
%
%      GUI_OGRANICIVACN2('Property','Value',...) creates a new GUI_OGRANICIVACN2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_OgranicivacN2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_OgranicivacN2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_OgranicivacN2

% Last Modified by GUIDE v2.5 28-Jun-2016 19:53:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_OgranicivacN2_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_OgranicivacN2_OutputFcn, ...
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


% --- Executes just before Gui_OgranicivacN2 is made visible.
function Gui_OgranicivacN2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_OgranicivacN2 (see VARARGIN)

% Choose default command line output for Gui_OgranicivacN2
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_OgranicivacN2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_OgranicivacN2_OutputFcn(hObject, eventdata, handles) 
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

 
  L1=str2double(get(hObject,'String'));
  setappdata(0,'L1',L1)
  
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


    L3=str2double(get(hObject,'String')); 
    setappdata(0,'L3',L3)
    

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
function bool

L1=getappdata(0,'L1');
L1(isempty(L1))=0;
L3=getappdata(0,'L3');
L3(isempty(L3))=0;

bool_data=[L1 L3];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bool

bool_value=getappdata(0,'bool_value');
 if any(bool_value==0)

                warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end

Ogranicivac_Pritiska
handles.Kogr=getappdata(0,'K_ogr');
Kogr=handles.Kogr;
set(handles.K,'String',Kogr)
handles.K1ogr=getappdata(0,'K_1ogr');
K1ogr=handles.K1ogr;
set(handles.K1,'String',K1ogr)
axes(handles.axes1)
Dijagram


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
setappdata(0,'I_kc',0)
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
    print_Gui_Ogranicivac
end
close(h) 
close()
Gui_dialog7N2
end


function Ogranicivac_Pritiska

N=20;  
L1=getappdata(0,'L1');%vrednost do koje  ARSK ima linearnu karakteristiku 
p_h=getappdata(0,'p_2');
N_ul=(max(p_h)./N);
p_hp=(0:N_ul:max(p_h));
Pul1=[min(p_h):0.1:L1];
Pizl1=Pul1;
L2=max(ceil(p_hp));%maksimalna vrednost ulaznog pritiska
L3=getappdata(0,'L3');%maksimalna vrednost izlaznog pritiska u ogranicivacu
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2=[L1:1:L2];
Pizl2=[L1:L5:L3 ];
pul=[Pul1,Pul2];
pizl=[Pizl1,Pizl2];
L5=(L3./L2)*L1;
p_hp=pul;
p_hp=unique(p_hp);
p_hz=pizl;
p_hz=unique(p_hz);

setappdata(0,'p_2izl',p_hz)
setappdata(0,'p_2ogr',p_hz)
p_2ogr=getappdata(0,'p_2ogr');
setappdata(0,'p_2ul',p_hp)
p_2izl=getappdata(0,'p_2izl');
setappdata(0,'p_izlogr',p_2izl)
setappdata(0,'p_ulogr',p_2ogr)

a=getappdata(0,'p_2ogr')
K=(L3-L1)./(L2-L1);% Karakteristika ogranicivaca
setappdata(0,'K_ogr',K)
K_1=1./K ;         % Reciprocna vrednost karakteristike ogranicivaca
setappdata(0,'K_1ogr',K_1)

%Poredjenje za gresku
%--------------------------------------------------------------------------
        if isnan(K_1)
         warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end

        if isinf(K_1)
            warndlg('Molim Vas unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                        error('Vrednost nije uneta')
        end



function Dijagram
pul=getappdata(0,'p_2ul');
pizl=getappdata(0,'p_2izl');

cla
hold on
plot(pul,pizl,'LineWidth',2);
axis([0 10 0 10]);
xlabel('pul[bar]');
ylabel('pizl[bar]');
legend('p_{2kor}')





function print_Gui_Ogranicivac

pul=(getappdata(0,'p_2ul'))';
pizl=(getappdata(0,'p_2izl'))';
K=getappdata(0,'K_ogr');
K1=getappdata(0,'K_1ogr');

C=getappdata(0,'xls_ime_xls');

nule=zeros([100,4]);

%'K[/]','K1[/]';pul, pizl,K,K1
A = {'pul[bar]','pizl[bar]','K[/]','K1[/]'};
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'Regulator','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A,'Regulator','A1');
B=[pul, pizl];
D=[K,K1];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, B,'Regulator','A2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, D, 'Regulator','C2');
