function varargout = UlPodGUI(varargin)
% ULPODGUI MATLAB code for UlPodGUI.fig
%      ULPODGUI, by itself, creates a new ULPODGUI or raises the existing
%      singleton*.
%
%      H = ULPODGUI returns the handle to a new ULPODGUI or the handle to
%      the existing singleton*.
%
%      ULPODGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ULPODGUI.M with the given input arguments.
%
%      ULPODGUI('Property','Value',...) creates a new ULPODGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UlPodGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UlPodGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UlPodGUI

% Last Modified by GUIDE v2.5 12-Nov-2014 17:15:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UlPodGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @UlPodGUI_OutputFcn, ...
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


% --- Executes just before UlPodGUI is made visible.
function UlPodGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UlPodGUI (see VARARGIN)

% Choose default command line output for UlPodGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UlPodGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UlPodGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtbox1_Callback(hObject, eventdata, handles)
% hObject    handle to txtbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtbox1 as text
%        str2double(get(hObject,'String')) returns contents of txtbox1 as a double


% --- Executes during object creation, after setting all properties.
function txtbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pbutton1.
function pbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
