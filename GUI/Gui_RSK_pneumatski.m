function varargout = Gui_RSK_pneumatski(varargin)
% GUI_RSK_PNEUMATSKI MATLAB code for Gui_RSK_pneumatski.fig
%      GUI_RSK_PNEUMATSKI, by itself, creates a new GUI_RSK_PNEUMATSKI or raises the existing
%      singleton*.
%
%      H = GUI_RSK_PNEUMATSKI returns the handle to a new GUI_RSK_PNEUMATSKI or the handle to
%      the existing singleton*.
%
%      GUI_RSK_PNEUMATSKI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_RSK_PNEUMATSKI.M with the given input arguments.
%
%      GUI_RSK_PNEUMATSKI('Property','Value',...) creates a new GUI_RSK_PNEUMATSKI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_RSK_pneumatski_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_RSK_pneumatski_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui_RSK_pneumatski

% Last Modified by GUIDE v2.5 14-Jun-2016 15:03:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_RSK_pneumatski_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_RSK_pneumatski_OutputFcn, ...
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


% --- Executes just before Gui_RSK_pneumatski is made visible.
function Gui_RSK_pneumatski_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui_RSK_pneumatski (see VARARGIN)

% Choose default command line output for Gui_RSK_pneumatski
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui_RSK_pneumatski wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_RSK_pneumatski_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ogranicivac_Pritiska
handles.Kogr=getappdata(0,'K_ogr');
Kogr=handles.Kogr;
set(handles.K,'String',Kogr)
handles.K1ogr=getappdata(0,'K_1ogr');
K1ogr=handles.K1ogr;
set(handles.K1,'String',K1ogr)
axes(handles.axes1)
Dijagram
h = waitbar(0,'Molimo da sacekate...');
steps = 1;
 for step = 1:steps
    
     waitbar(step / steps)
     print_Gui_Ogranicivac
 end
close(h) 
close()
Gui_dialog7N2

function Ogranicivac_Pritiska

N=20;

p_2ul=getappdata(0,'p_2'); 
    
L1=getappdata(0,'L1');%vrednost do koje  ARSK ima linearnu karakteristiku 

N_ul=(max(p_2ul)./N);
p_2=(0:N_ul:max(p_2ul));
Pul1=[min(p_2):0.1:L1];
Pizl1=Pul1;
L2=max(ceil(p_2));%maksimalna vrednost ulaznog pritiska
L3=getappdata(0,'L3');%maksimalna vrednost izlaznog pritiska u ogranicivacu
L4=L2-L1;
L5=(L3-L1)./(L4);%inkrementalna vrednost
Pul2=[L1:1:L2];
Pizl2=[L1:L5:L3 ];
pul=[Pul1,Pul2];
pizl=[Pizl1,Pizl2];
L5=(L3./L2)*L1;
p_2=pul;
p_2=unique(p_2);
p_2izl=pizl;
p_2izl=unique(p_2izl);

setappdata(0,'p_izlogr',p_2izl)

setappdata(0,'p_ulogr',p_2)


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
pul=getappdata(0,'p_ulogr');
pizl=getappdata(0,'p_izlogr');

cla
hold on
grid on
plot(pul,pizl,'LineWidth',2);
axis([0 10 0 10]);
xlabel('pul[bar]');
ylabel('pizl[bar]');





function print_Gui_Ogranicivac

pul=(getappdata(0,'p_ulogr'))';
pizl=(getappdata(0,'p_izlogr'))';
K=getappdata(0,'K_ogr');
K1=getappdata(0,'K_1ogr');

C=getappdata(0,'xls_ime_xls');

nule=zeros([100,4]);

%'K[/]','K1[/]';pul, pizl,K,K1
A = {'pul[MPa]','pizl[MPa]','K[/]','K1[/]'};
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, nule,'OgranicivacN2','A1');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, A,'OgranicivacN2','A1');
B=[pul, pizl];
D=[K,K1];
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, B,'OgranicivacN2','A2');
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, D, 'OgranicivacN2','C2');
