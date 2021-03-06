function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 08-Jan-2014 11:36:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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

% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;


% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using main.
if strcmp(get(hObject,'Visible'),'on')
    plot(rand(5));
end

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
% function pushbutton1_Callback(hObject, eventdata, handles)
% % hObject    handle to pushbutton1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)

%cla;
% 
% popup_sel_index = get(handles.codeurlist, 'Value');
% switch popup_sel_index
%     case axes1
%         plot(sin(1:0.01:25.99));
%     case axes2
%         plot(sin(1:0.01:25.99));
%     case axes3
%         plot(sin(1:0.01:25.99));
%     case axes4
%         plot(sin(1:0.01:25.99));
%     case 5
%         plot(sin(1:0.01:25.99));
% end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
handles.file = uigetfile('*.wav');
if ~isequal(handles.file, 0)
    [handles.x,handles.Fe,handles.n]=wavread(handles.file);
    subplot(2,3,3),plot(handles.x);
    set(handles.filecontainer,'String',handles.file);

end
guidata(hObject, handles);


% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in codeurlist.
function codeurlist_Callback(hObject, eventdata, handles)
% hObject    handle to codeurlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns codeurlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from codeurlist


% --- Executes during object creation, after setting all properties.
function codeurlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to codeurlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

%set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on selection change in list3.
function list3_Callback(hObject, eventdata, handles)
% hObject    handle to list3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns list3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from list3


% --- Executes during object creation, after setting all properties.
function list3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to list3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in codeur.
function codeur_Callback(hObject, eventdata, handles)
% hObject    handle to codeur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in charge.
function charge_Callback(hObject, eventdata, handles)
% hObject    handle to charge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
handles.file = get(handles.filecontainer,'String');
[handles.x,handles.Fe,handles.n]= wavread(handles.file);
subplot(2,3,3),plot(handles.x);
guidata(hObject, handles);





function filecontainer_Callback(hObject, eventdata, handles)
% hObject    handle to filecontainer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filecontainer as text
%        str2double(get(hObject,'String')) returns contents of filecontainer as a double

sound = get(hObject,'String');

%checks to see if input is empty. if so, default inputsound to zero
if (isempty(sound))
     set(hObject,'String','sound.wav')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function filecontainer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filecontainer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in app3.
function app3_Callback(hObject, eventdata, handles)
% hObject    handle to app3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in comp.
function comp_Callback(hObject, eventdata, handles)
% hObject    handle to comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in trait.
function trait_Callback(hObject, eventdata, handles)
% hObject    handle to trait (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in complist.
function complist_Callback(hObject, eventdata, handles)
% hObject    handle to complist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns complist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from complist


% --- Executes during object creation, after setting all properties.
function complist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to complist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in traitlist.
function traitlist_Callback(hObject, eventdata, handles)
% hObject    handle to traitlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns traitlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from traitlist


% --- Executes during object creation, after setting all properties.
function traitlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to traitlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in CAN.
function CAN_Callback(hObject, eventdata, handles)
% hObject    handle to CAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);

%sound = get(handles.filecontainer,'String');
%[x,Fe,n]= wavread(sound);

handles.fc=handles.Fe/2;
%wc=2*pi*fc;
opr= get(handles.canlist,'value');

if opr == 1
    [handles.M,handles.wc] = buttord(10/handles.fc,80/handles.fc,3,10); % Filtre pass bas 
    [handles.num,handles.dem]=butter(handles.M,handles.wc,'low');
elseif opr == 2
    [handles.M,handles.wc] = buttord(80/handles.fc,10/handles.fc,3,10); % Filtre pass haut 
    [handles.num,handles.dem]=butter(handles.M,handles.wc,'high');
elseif opr == 3
    
    
end;

handles.x1=filter(handles.num,handles.dem,handles.x);
subplot(2,3,4),plot(handles.x1);
guidata(hObject, handles);





% --- Executes on selection change in canlist.
function canlist_Callback(hObject, eventdata, handles)
% hObject    handle to canlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns canlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from canlist



% --- Executes during object creation, after setting all properties.
function canlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in playcan.
function playcan_Callback(hObject, eventdata, handles)
% hObject    handle to playcan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x1,handles.Fe)


% --- Executes on button press in playcod.
function playcod_Callback(hObject, eventdata, handles)
% hObject    handle to playcod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playcomp.
function playcomp_Callback(hObject, eventdata, handles)
% hObject    handle to playcomp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playtrait.
function playtrait_Callback(hObject, eventdata, handles)
% hObject    handle to playtrait (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
