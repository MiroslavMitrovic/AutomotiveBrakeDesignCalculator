function varargout = GUI_IzbKat(varargin)
% GUI_IZBKAT MATLAB code for GUI_IzbKat.fig
%      GUI_IZBKAT, by itself, creates a new GUI_IZBKAT or raises the existing
%      singleton*.
%
%      H = GUI_IZBKAT returns the handle to a new GUI_IZBKAT or the handle to
%      the existing singleton*.
%
%      GUI_IZBKAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IZBKAT.M with the given input arguments.
%
%      GUI_IZBKAT('Property','Value',...) creates a new GUI_IZBKAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_IzbKat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_IzbKat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_IzbKat

% Last Modified by GUIDE v2.5 06-Mar-2016 17:45:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_IzbKat_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_IzbKat_OutputFcn, ...
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


% --- Executes just before GUI_IzbKat is made visible.
function GUI_IzbKat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_IzbKat (see VARARGIN)

% Choose default command line output for GUI_IzbKat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_IzbKat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_IzbKat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in OSTALEKAT.
function OSTALEKAT_Callback(hObject, eventdata, handles)
% hObject    handle to OSTALEKAT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Podatak za obelezavanje kategorije
close()
Gui_naziv
IzbKat=3;
setappdata(0,'IzbKat', IzbKat);

% --- Executes on button press in M1.
function M1_Callback(hObject, eventdata, handles)
% hObject    handle to M1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
Gui_naziv
%Podatak za obelezavanje kategorije
IzbKat=1;
setappdata(0,'IzbKat', IzbKat);

% --- Executes on button press in N1.
function N1_Callback(hObject, eventdata, handles)
% hObject    handle to N1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
Gui_naziv
%Podatak za obelezavanje kategorije
IzbKat=2;
setappdata(0,'IzbKat', IzbKat);


% --- Executes on button press in N2.
function N2_Callback(hObject, eventdata, handles)
% hObject    handle to N2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close()
Gui_naziv
IzbKat=3;
setappdata(0,'IzbKat', IzbKat);
