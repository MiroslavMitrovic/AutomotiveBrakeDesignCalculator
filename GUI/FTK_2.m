function varargout = FTK_2(varargin)
% FTK_2 MATLAB code for FTK_2.fig
%      FTK_2, by itself, creates a new FTK_2 or raises the existing
%      singleton*.
%
%      H = FTK_2 returns the handle to a new FTK_2 or the handle to
%      the existing singleton*.
%
%      FTK_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTK_2.M with the given input arguments.
%
%      FTK_2('Property','Value',...) creates a new FTK_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FTK_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FTK_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FTK_2

% Last Modified by GUIDE v2.5 05-Jun-2016 00:27:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FTK_2_OpeningFcn, ...
                   'gui_OutputFcn',  @FTK_2_OutputFcn, ...
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
% --- Executes just before FTK_2 is made visible.
function FTK_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FTK_2 (see VARARGIN)

% Choose default command line output for FTK_2



%handles.Fmip=num2str(getappdata(0,'Fmip'))
handles.output = hObject;
set(handles.Counter,'String',0)%handles za brojac
% Update handles structure
guidata(hObject, handles);


                
%set(handles.Gui_FTK, 'units', 'normalized', 'position', [0.05 0.15 0.9 0.8])





setappdata(0,'FTK', gcf);
setappdata(gcf, 'FTK_Rac', @FTK_Rac);


% UIWAIT makes FTK_2 wait for user response (see UIRESUME)
% uiwait(handles.Gui_FTK);


% --- Outputs from this function are returned to the command line.
function varargout = FTK_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pmax1_Callback(hObject, eventdata, handles)
% hObject    handle to pmax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pmax1 as text
%        str2double(get(hObject,'String')) returns contents of pmax1 as a double

p_max1=str2double(get(hObject,'String'));
setappdata(0,'p_max1',p_max1);

% --- Executes during object creation, after setting all properties.
function pmax1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pmax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pmax2_Callback(hObject, eventdata, handles)
% hObject    handle to pmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pmax2 as text
%        str2double(get(hObject,'String')) returns contents of pmax2 as a double

p_max2=str2double(get(hObject,'String'));
setappdata(0,'p_max2',p_max2);



% --- Executes during object creation, after setting all properties.
function pmax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eta_Callback(hObject, eventdata, handles)
% hObject    handle to eta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eta as text
%        str2double(get(hObject,'String')) returns contents of eta as a double
eta_uk=str2double(get(hObject,'String'));
setappdata(0,'eta_uk',eta_uk);

% --- Executes during object creation, after setting all properties.
function eta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_srp_Callback(hObject, eventdata, handles)
% hObject    handle to r_srp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r_srp as text
%        str2double(get(hObject,'String')) returns contents of r_srp as a double
r_srp_ul=str2double(get(hObject,'String'));
setappdata(0,'r_srp_ul',r_srp_ul);

% --- Executes during object creation, after setting all properties.
function r_srp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_srp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r_srz_Callback(hObject, eventdata, handles)
% hObject    handle to r_srz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r_srz as text
%        str2double(get(hObject,'String')) returns contents of r_srz as a double
r_srz_ul=str2double(get(hObject,'String'));
setappdata(0,'r_srz_ul',r_srz_ul);


% --- Executes during object creation, after setting all properties.
function r_srz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_srz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_p_Callback(hObject, eventdata, handles)
% hObject    handle to C_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_p as text
%        str2double(get(hObject,'String')) returns contents of C_p as a double

C_p=str2double(get(hObject,'String'));
setappdata(0,'C_p',C_p);






% --- Executes during object creation, after setting all properties.
function C_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_p (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function C_z_Callback(hObject, eventdata, handles)
% hObject    handle to C_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of C_z as text
%        str2double(get(hObject,'String')) returns contents of C_z as a double

C_z=str2double(get(hObject,'String'));
setappdata(0,'C_z',C_z);

% --- Executes during object creation, after setting all properties.
function C_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FTK_Rac
%Odredjivanje ukupnih sila i momenata
%==========================================================================
%%Velicine 
%==========================================================================
%F_uk         [N]     Ukupna sila kocenja 
%rd           [m]     Dinamicki poluprecnik trenja
%F_kpo        [N]     Sila kocenja na prednjoj osovini u opterecenom stanju
%F_kzo        [N]     Sila kocenja na zadnjoj osovini u opterecenom stanju
%F_kpto       [N]     Sila po tocku na predjoj osovini u opterecenom stanju
%F_zpto       [N]     Sila po tocku na zadnjoj osovini u opterecenom stanju
%M_kpto       [Nm]    Moment kocenja po tocku na prednjoj osovini u 
%                     opterecenom stanju
%M_zpto       [Nm]    Moment kocenja po tocku na zadnjoj osovini u
%                     opterecenom stanju.
%r_srp        [m]     Srednji poluprecnik trenja prednje
%                     kocnice(0.25-0.4rd)
%C_p          [/]     Karakteristika prednje kocnice 
%r_srz        [m]     Srednji poluprecnik trenja zadnje kocnice(0.25-0.4rd) 
%C_z          [/]     Karakteristika zadnje kocnice 
%Fmip        [N]     Potrebna sila trenja na prednjoj osovini 
%Fmiz        [N]     Potrebna sila trenja na zadnjoj osovini 
%pmax2        [/]     Mehanicki stepen korisnosti (0.5-0.9)
%p_hmax       [MPa]   Najveci neregulisani pritisak u HPM-u (6-10(12)[MPa])
%A_kp         [m^2]   Potrebna povrsina poprecnog preseka klipa kocnog cil.
%A_kz         [m^2]   Potrebna povrsina poprecnog preseka klipa kocnog cil.
%eta        [/]     Hidraulicki stepen korisnosti (0.9)
%d_kcp        [m]     Precnik klipa kocnog cilindra prednjih kocnica 
%d_kcz        [m]     Precnik klipa kocnog cilindra zadnjih kocnica 
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
%%
%Ulazne Velicine 
%==========================================================================
F_ku=getappdata(0,'F_ku');
R=getappdata(0,'R');
rd=getappdata(0,'r_d');
eta=getappdata(0,'eta_uk');
setappdata(0,'eta',eta)
r_srp=getappdata(0,'r_srp_ul');
setappdata(0,'r_srp',r_srp)
r_srz=getappdata(0,'r_srz_ul');
setappdata(0,'r_srz',r_srz)
C_p=getappdata(0,'C_p');
setappdata(0,'C_p',C_p)
C_z=getappdata(0','C_z');
setappdata(0,'C_z',C_z)
i_pk=getappdata(0,'i_pk');
setappdata(0,'i_pk',i_pk)
i_zk=getappdata(0,'i_zk');
setappdata(0,'i_zk',i_zk)
i_sis=0;


%==========================================================================
%%
%Sile kocenja po osovinama u opterecenom stanju

F_kpo=F_ku.*(R./(1+R));
setappdata(0,'F_kpo',F_kpo)
F_kzo=F_ku.*(1./(1+R));
setappdata(0,'F_kzo',F_kzo)
%Sile kocenja po tocku u opterecenom stanju 
F_kpto=F_kpo./2;
setappdata(0,'F_kpto',F_kpto)
F_kzto=F_kzo./2;
setappdata(0,'F_kzto',F_kzto)
%Momenti kocenja po tockovima u opterecenom stanju
M_kpto=F_kpto.*rd;
setappdata(0,'M_kpto',M_kpto)
M_kzto=F_kzto.*rd;
setappdata(0,'M_kzto',M_kzto)

%Izbor srednjeg poluprecnika trenja (0.25-0.4)*rd [m]

%r_srp=r_srp1.*rd;
%r_srz=r_srz1.*rd;
%Izbor karakteristika kocnice C(Simpleks[1.7-2.2] Dupleks[2.4-3.2]
%Duoservo[2.8-5.5] Disk sa stegom[0.7] Lamelasta[3.2-6.5])


%Potrebne sile trenja po kocnicama 

F_mip=M_kpto./(r_srp./1000);
F_miz=M_kzto./(r_srz./1000);
setappdata(0,'F_mip',F_mip)
setappdata(0,'F_miz',F_miz)
%Potrebne sile aktiviranja kocnica 

F_ap=(F_mip./C_p)./eta;
F_az=(F_miz./C_z)./eta;
setappdata(0,'F_ap',F_ap)
setappdata(0,'F_az',F_az)
%Dodati uslov za racunanje precnika kocnih cilindara, odnosno ako je sistem
%hidraulicki ili pneumatski...

%Odredjivanje potrebnih sila na klipnjaci cilindra
%--------------------------------------------------------------------------

F_klp_pot=F_ap./i_pk;
setappdata(0,'F_klp_pot',F_klp_pot)
F_klz_pot=F_az./i_zk;
setappdata(0,'F_klz_pot',F_klz_pot)





% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bool


bool_value=getappdata(0,'bool_value_ul');

            if any(bool_value==0)

                warndlg('Nisu uneti svi podaci, unesite sve podatke i pritisnite dugme dalje!!!','UPOZORENJE')
                error('Vrednost nije uneta')

            end


FTK_Rac

%ULAZI ZA ISPIS
%--------------------------------------------------------------------------
handles.F_mip=num2str(getappdata(0,'F_mip'));
handles.F_miz=num2str(getappdata(0,'F_miz'));
handles.F_klp_pot=num2str(getappdata(0,'F_klp_pot'));
handles.F_klz_pot=num2str(getappdata(0,'F_klz_pot'));
handles.F_ap=num2str(getappdata(0,'F_ap'));
handles.F_az=num2str(getappdata(0,'F_az'));


%ISPIS U POLJA
%--------------------------------------------------------------------------
F_miphan=handles.F_mip;             %Sila aktivacije napred
set(handles.Fmip,'String',F_miphan) 
F_mizhan=handles.F_miz;             %Sila aktivacije pozadi
set(handles.Fmiz,'String',F_mizhan) 



F_aphan=handles.F_ap;             %Sila aktivacije napred
set(handles.Fap,'String',F_aphan) 
F_azhan=handles.F_az;             %Sila aktivacije pozadi
set(handles.Faz,'String',F_azhan) 
F_klp_pothan=handles.F_klp_pot;    %Sila na klipnjaci koc.cil napred
set(handles.Fklp,'String',F_klp_pothan) 
F_klz_pothan=handles.F_klz_pot;    %Sila na klipnjaci koc.cil pozadi
set(handles.Fklz,'String',F_klz_pothan)
% 
% i=[];
% 
% if isempty(i)
% 
% j=0;
% 
% end
% 
% if j==0
% 
%     Gui_dialog15
% 
% end
% 
% 
% i=getappdata(0,'I_glkoc_vent');
% 
% if i==0 
%     
%     print_FTK
%     close all
%     GUI_SilaKocnogCilindra_N2
%     
%     
% end
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

print_FTK
close()
GUI_SilaKocnogCilindra_N2

end
%--------------------------------------------------------------------------

function bool
eta=getappdata(0,'eta_uk');
eta(isnan(eta))=0;
eta(isempty(eta))=0;
r_srp=getappdata(0,'r_srp_ul');
r_srp(isnan(r_srp))=0;
r_srp(isempty(r_srp))=0;
r_srz=getappdata(0,'r_srz_ul');
r_srz(isnan(r_srz))=0;
r_srz(isempty(r_srz))=0;
C_p=getappdata(0,'C_p');
C_p(isnan(C_p))=0;
C_p(isempty(C_p))=0;
C_z=getappdata(0,'C_z');
C_z(isnan(C_z))=0;
C_z(isempty(C_z))=0;
i_pk=getappdata(0,'i_pk');
i_pk(isnan(i_pk))=0;
i_pk(isempty(i_pk))=0;
i_zk=getappdata(0,'i_zk');
i_zk(isnan(i_zk))=0;
i_zk(isempty(i_zk))=0;


bool_data=[eta r_srp r_srz C_p C_z i_pk i_zk];
bool_value=logical(bool_data);
setappdata(0,'bool_value',bool_value)



function print_FTK

%Funkcija za stampanje podataka u .xls tabelu
%--------------------------------------------------------------------------
%Podaci za upis

F_kpo=getappdata(0,'F_kpo');
F_kzo=getappdata(0,'F_kzo');
F_kpto=getappdata(0,'F_kpto');
F_kzto=getappdata(0,'F_kzto');
M_kpto=getappdata(0,'M_kpto');
M_kzto=getappdata(0,'M_kzto');
r_srp=getappdata(0,'r_srp');
r_srz=getappdata(0,'r_srz');
C_p=getappdata(0,'C_p');
C_z=getappdata(0,'C_z');
F_mip=getappdata(0,'F_mip');
F_miz=getappdata(0,'F_miz');
F_ap=getappdata(0,'F_ap');
F_az=getappdata(0,'F_az');
i_pk=getappdata(0,'i_pk');
i_zk=getappdata(0,'i_zk');
F_klp=max(getappdata(0,'F_klp'));
F_klz=max(getappdata(0,'F_klz'));
p_1_max=getappdata(0,'p_max1');
p_2_max=getappdata(0,'p_max2');



C=getappdata(0,'xls_ime_xls');


%Komanda za unos



% %Vrednosti za upozorenje
% 
% 
% bool_data1=[r_srp, r_srz, C_p,C_z ,p_1_max,p_2_max];
% bool_value1=logical(bool_data1);
% bool_data2=[d_kcp,d_kcz];
% 
% setappdata(0,'bool_value1',bool_value1)
% bool_value2=logical(bool_data2);
% setappdata(0,'bool_value2',bool_value2)
% bool_value_tot=[bool_value1, bool_value2];
% setappdata(0,'bool_value_tot', bool_value_tot)
% 

DataMatlab2XLS = {'F_kpo[N]', 'F_kzo[N]','F_kpto[N]','F_kzto[N]', 'M_kpto[Nm]',...
    'M_kzto[Nm]','r_srpd[mm]','r_srzd[mm]','C_p[/]','C_z[/]','F_mip[N]',...
  'F_miz[N]','F_ap[N]','F_az[N]',... 
  'p_max1[bar]','p_max2[bar]','F_klp[N]','F_klz[N]','i_kp[/]','i_kz[/]';F_kpo F_kzo F_kpto...
  F_kzto M_kpto M_kzto r_srp...
  r_srz C_p C_z F_mip F_miz F_ap F_az p_1_max p_2_max F_klp...
  F_klz i_pk i_zk};

DataMatlab2XLSt=DataMatlab2XLS';
warning('off','MATLAB:xlswrite:Addsheet');
xlswrite(C, DataMatlab2XLSt,...
    'OdrPotrMomentaiSila','A1');


% --- Executes during object creation, after setting all properties.
function Fmip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fmip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double

d_kcp= str2double(get(hObject,'String'));
setappdata(0,'d_kcp',d_kcp)
% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double

d_kcz=str2double(get(hObject,'String'));
setappdata(0,'d_kcz',d_kcz)


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_klp_Callback(hObject, eventdata, handles)
% hObject    handle to F_klp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

F_klp=str2double(get(hObject,'String'));
setappdata(0,'F_klp',F_klp)



% Hints: get(hObject,'String') returns contents of F_klp as text
%        str2double(get(hObject,'String')) returns contents of F_klp as a double


% --- Executes during object creation, after setting all properties.
function F_klp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_klp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function F_klz_Callback(hObject, eventdata, handles)
% hObject    handle to F_klz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

F_klz=str2double(get(hObject,'String'));
setappdata(0,'F_klz',F_klz)



% Hints: get(hObject,'String') returns contents of F_klz as text
%        str2double(get(hObject,'String')) returns contents of F_klz as a double


% --- Executes during object creation, after setting all properties.
function F_klz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to F_klz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Kocni_Cilindri
%==========================================================================
%Funkcija koja prikazuje karakteristike izabranih kocnih cilindara napred i
%pozadi
%--------------------------------------------------------------------------
%Sile na klipnjaci
F_klp_max=getappdata(0,'F_klp');
F_klz_max=getappdata(0,'F_klz');
%Pritisci u prvom i drugom kocnom krugu(1,2)
p_1=getappdata(0,'p_1');
size_p_1=size(p_1);
size_p_1=size_p_1(1,2);
p_2=getappdata(0,'p_2');
size_p_2=size(p_2);
size_p_2=size_p_2(1,2);

size_p=[size_p_1, size_p_2];

size_p_max=max(size_p);
size_p_min=min(size_p);

size_p_total=size_p_max-size_p_min;


[M_p,I_p] = min(size_p(:));

[I_red_p, I_kol_p] = ind2sub(size(size_p),I_p);

size_p_min1=size_p_min+1;

if size_p_min~=size_p_max
    
    if  I_kol_p~=1

        a1=p_1(size_p_min1:size_p_max);
        p_1(ismember(p_1,a1))=[];

    end

    if  I_kol_p~=2

        a2=p_2(size_p_min1:size_p_max);
        p_2(ismember(p_2,a2))=[];

    end
  
end

setappdata(0,'p_1',p_1)
setappdata(0,'p_2',p_2)

vel_p1=size(p_1);
vel_p1=vel_p1(1,2);

inc_p1=max(p_1)./vel_p1;

F_klp_inc=F_klp_max./vel_p1;
F_klp=0:F_klp_inc:F_klp_max;
size_F_klp=size(F_klp);
size_F_klp=size_F_klp(1,2);
setappdata(0,'F_klp',F_klp)
vel_p2=size(p_2);
vel_p2=vel_p2(1,2);

inc_p2=max(p_2)./vel_p2;


F_klz_inc=F_klz_max./vel_p2;
F_klz=0:F_klz_inc:F_klz_max;
size_F_klz=size(F_klz);
size_F_klz=size_F_klz(1,2);
setappdata(0,'F_klz',F_klz)

%Srediti nizove da budu istih clanova zbog presecnih tacki u zavrsnom
%proracunu.....
size_Fkl=[size_F_klp, size_F_klz];

size_F_kl_max=max(size_Fkl);
size_F_kl_min=min(size_Fkl);

size_Fkl_total=size_F_kl_max-size_F_kl_min;


[M,I] = min(size_Fkl(:));

[I_red, I_kol] = ind2sub(size(size_Fkl),I);


%Napraviti poredjenje sa minimalnom vrednosti, i za tu vrednost da se ne
%izbacuju vrednosti iz niza...

size_F_kl_min1=size_F_kl_min+1;

if size_F_kl_min~=size_F_kl_max
    
    if  I_kol~=1

        a1=F_klp(size_F_kl_min1:size_F_kl_max);
        F_klp(ismember(F_klp,a1))=[];

    end

    if  I_kol~=2

        a2=F_klz(size_F_kl_min1:size_F_kl_max);
        F_klz(ismember(F_klp,a2))=[];

    end

end

setappdata(0,'F_klp',F_klp)
setappdata(0,'F_klz',F_klz)



function C_ARSK_Callback(hObject, eventdata, handles)
% hObject    handle to C_ARSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

C_ARSK= str2double(get(hObject,'String'));
setappdata(0,'C_ARSK',C_ARSK)


% Hints: get(hObject,'String') returns contents of C_ARSK as text
%        str2double(get(hObject,'String')) returns contents of C_ARSK as a double


% --- Executes during object creation, after setting all properties.
function C_ARSK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_ARSK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i_pk_Callback(hObject, eventdata, handles)
% hObject    handle to i_pk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i_pk as text
%        str2double(get(hObject,'String')) returns contents of i_pk as a double

i_pk=str2double(get(hObject,'String'));
setappdata(0,'i_pk',i_pk)

% --- Executes during object creation, after setting all properties.
function i_pk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i_pk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i_zk_Callback(hObject, eventdata, handles)
% hObject    handle to i_zk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of i_zk as text
%        str2double(get(hObject,'String')) returns contents of i_zk as a double
i_zk=str2double(get(hObject,'String'));
setappdata(0,'i_zk',i_zk)

% --- Executes during object creation, after setting all properties.
function i_zk_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i_zk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
