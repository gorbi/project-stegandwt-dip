function varargout = watermark_gui(varargin)
% WATERMARK_GUI MATLAB code for watermark_gui.fig
%      WATERMARK_GUI, by itself, creates a new WATERMARK_GUI or raises the existing
%      singleton*.
%
%      H = WATERMARK_GUI returns the handle to a new WATERMARK_GUI or the handle to
%      the existing singleton*.
%
%      WATERMARK_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WATERMARK_GUI.M with the given input arguments.
%
%      WATERMARK_GUI('Property','Value',...) creates a new WATERMARK_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before watermark_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to watermark_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help watermark_gui

% Last Modified by GUIDE v2.5 22-Apr-2012 12:35:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @watermark_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @watermark_gui_OutputFcn, ...
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


% --- Executes just before watermark_gui is made visible.
function watermark_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to watermark_gui (see VARARGIN)

% Choose default command line output for watermark_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes watermark_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = watermark_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function path_cvr_img_Callback(hObject, eventdata, handles)
% hObject    handle to path_cvr_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_cvr_img as text
%        str2double(get(hObject,'String')) returns contents of path_cvr_img as a double


% --- Executes during object creation, after setting all properties.
function path_cvr_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_cvr_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function path_msg_img_Callback(hObject, eventdata, handles)
% hObject    handle to path_msg_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path_msg_img as text
%        str2double(get(hObject,'String')) returns contents of path_msg_img as a double


% --- Executes during object creation, after setting all properties.
function path_msg_img_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path_msg_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse_c.
function browse_c_Callback(hObject, eventdata, handles)
% hObject    handle to browse_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile('*.*', 'Pick a file');

fullfile = [pathname filename]; 

set(handles.path_cvr_img,'String',fullfile);



% --- Executes on key press with focus on browse_c and none of its controls.
function browse_c_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to browse_c (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in browse_m.
function browse_m_Callback(hObject, eventdata, handles)
% hObject    handle to browse_m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile('*.*', 'Pick a file');

fullfile = [pathname filename]; 

set(handles.path_msg_img,'String',fullfile);



function timing_Callback(hObject, eventdata, handles)
% hObject    handle to timing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timing as text
%        str2double(get(hObject,'String')) returns contents of timing as a double


% --- Executes during object creation, after setting all properties.
function timing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in watermark.
function watermark_Callback(hObject, eventdata, handles)
% hObject    handle to watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fn_cvr = get(handles.path_cvr_img,'String'); 
fn_msg = get(handles.path_msg_img,'String'); 
tic
watermarked = watermark(fn_cvr,fn_msg);
time_taken = toc;
set(handles.timing,'String',time_taken);

imwrite(watermarked,'watermarked.bmp','bmp');


% --- Executes on button press in remove_watermark.
function remove_watermark_Callback(hObject, eventdata, handles)
% hObject    handle to remove_watermark (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fn_watermarked='watermarked.bmp';
tic
rm_watermark(fn_watermarked);
time_taken = toc;
set(handles.timing,'String',time_taken);


