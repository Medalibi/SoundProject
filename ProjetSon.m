function varargout = ProjetSon(varargin)
% PROJETSON MATLAB code for ProjetSon.fig
%      PROJETSON, by itself, creates a new PROJETSON or raises the existing
%      singleton*.
%
%      H = PROJETSON returns the handle to a new PROJETSON or the handle to
%      the existing singleton*.
%
%      PROJETSON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJETSON.M with the given input arguments.
%
%      PROJETSON('Property','Value',...) creates a new PROJETSON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjetSon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjetSon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjetSon

% Last Modified by GUIDE v2.5 09-Jan-2014 14:47:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjetSon_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjetSon_OutputFcn, ...
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

% --- Executes just before ProjetSon is made visible.
function ProjetSon_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjetSon (see VARARGIN)

% Choose default command line output for ProjetSon
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using ProjetSon.
if strcmp(get(hObject,'Visible'),'on')
    plot(rand(5));
end

% UIWAIT makes ProjetSon wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjetSon_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
%function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%axes(handles.axes1);
%cla;

%popup_sel_index = get(handles.popupmenu1, 'Value');
%switch popup_sel_index
%    case 1
 %       plot(rand(5));
%   case 2
%        plot(sin(1:0.01:25.99));
%    case 3
%         bar(1:.5:10);
%     case 4
%         plot(membrane);
%     case 5
%         surf(peaks);
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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
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

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function filecontainer_Callback(hObject, eventdata, handles)
% hObject    handle to filecontainer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filecontainer as text
%        str2double(get(hObject,'String')) returns contents of filecontainer as a double
handles = guidata(hObject);
handles.file = get(hObject,'String');
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

% --- Executes on selection change in filterlist.
function filterlist_Callback(hObject, eventdata, handles)
% hObject    handle to filterlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filterlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filterlist


% --- Executes during object creation, after setting all properties.
function filterlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filterlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
handles.fc=handles.Fe/2;
opr= get(handles.filterlist,'value');
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


% --- Executes on button press in coder.
function coder_Callback(hObject, eventdata, handles)
% hObject    handle to coder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
opr= get(handles.coderlist,'value');
if opr == 1
    %handles.x4=zeros(size(handles.x3));
    handles.x4=[];
    for i=1:length(handles.x3);
        d=dec2bin(handles.x3(i),handles.n);
        handles.x4=[handles.x4 double(d)-48];
    end;
elseif opr == 2
     handles.x4=zeros(size(handles.x3));
     handles.x4(1)=handles.x3(1);
     for k=2:length(handles.x3)
         handles.x4(k)=handles.x4(k-1)+handles.x3(k);
     end;

elseif opr == 3
    IndexTable = [-1, -1, -1, -1, 2, 4, 6, 8, -1, -1, -1, -1, 2, 4, 6, 8]; 
          
    StepSizeTable = [7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 19, 21, 23, 25, 28, 31, 34, 37, 41, 45, 50, 55, 60, 66, 73, 80, 88, 97, 107, 118, 130, 143, 157, 173, 190, 209, 230, 253, 279, 307, 337, 371, 408, 449, 494, 544, 598, 658, 724, 796, 876, 963, 1060, 1166, 1282, 1411, 1552, 1707, 1878, 2066, 2272, 2499, 2749, 3024, 3327, 3660, 4026, 4428, 4871, 5358, 5894, 6484, 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899, 15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767]; 
 
    prevsample = 0; 
    previndex = 1; 
 
    Ns = length(handles.x3); 
    i = 1; 
 
    raw_y = 32767 * handles.x3;          % 16-bit operation 
 
while (i <= Ns) 
    predsample = prevsample; 
    index = previndex; 
    step = StepSizeTable(index); 
 
    diff = raw_y(i) - predsample; 
    if (diff >= 0) 
        code = 0; 
    else 
        code = 8; 
        diff = -diff; 
    end 
 
    tempstep = step; 
    if (diff >= tempstep) 
        code = bitor(code, 4); 
        diff = diff - tempstep; 
    end 
    tempstep = bitshift(tempstep, -1); 
    if (diff >= tempstep) 
        code = bitor(code, 2); 
        diff = diff - tempstep; 
    end 
    tempstep = bitshift(tempstep, -1); 
    if (diff >= tempstep) 
        code = bitor(code, 1); 
    end 
 
    diffq = bitshift(step, -3); 
    if (bitand(code, 4)) 
        diffq = diffq + step; 
    end 
    if (bitand(code, 2)) 
        diffq = diffq + bitshift(step, -1); 
    end 
    if (bitand(code, 1)) 
        diffq = diffq + bitshift(step, -2); 
    end 
 
    if (bitand(code, 8)) 
        predsample = predsample - diffq; 
    else 
        predsample = predsample + diffq; 
    end 
 
    if (predsample > 32767) 
        predsample = 32767; 
    elseif (predsample < -32768) 
        predsample = -32768; 
    end 
 
    index = index + IndexTable(code+1); 
 
    if (index < 1) 
        index = 1; 
    end 
    if (index > 89) 
        index = 89; 
    end 
 
    prevsample = predsample; 
    previndex = index; 
 
    handles.x4(i) = bitand(code, 15); 
     
    i = i + 1; 
end
end;
%subplot(2,3,6),plot(handles.x4);
figure(2), plot(handles.x4);
guidata(hObject, handles);

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


% --- Executes on button press in comp.
function comp_Callback(hObject, eventdata, handles)
% hObject    handle to comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
opr= get(handles.complist,'value');
if opr == 1
    handles.A=87.56;
    handles.xmax=max(handles.x);
    handles.x2=(1+log10(handles.A*abs(handles.x/handles.xmax)))/(1+log10(handles.A));
elseif opr == 2
    handles.u=255;
    handles.x2=sign(handles.x).*((log(1+handles.u.*abs(handles.x)))/log(1+handles.u));
    
end;
subplot(2,3,5),plot(handles.x2);
guidata(hObject, handles);

% --- Executes on selection change in coderlist.
function coderlist_Callback(hObject, eventdata, handles)
% hObject    handle to coderlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns coderlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from coderlist


% --- Executes during object creation, after setting all properties.
function coderlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coderlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in can.
function can_Callback(hObject, eventdata, handles)
% hObject    handle to can (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
opr= get(handles.canlist,'value');
if opr == 1
    handles.Mc=length(handles.x2);
    handles.xmin=min(handles.x);
    q=(handles.xmax-handles.xmin)/(2^handles.n);
    for i=1:handles.Mc
        if handles.x2(i)<=handles.xmin
            handles.x3(i)=0;
        elseif handles.x2(i)>=handles.xmax
            handles.x3(i)=(2^handles.n)-1;
        else
            handles.x3(i)=(handles.x2(i)-handles.xmin)/q;
        end;
    end;
elseif opr == 2
    pow=2;
    mi=min(handles.x2);
    ma=max(handles.x2+abs(mi));
    sig1=(handles.x2+abs(mi))/ma;
    sig2=(sig1*(2^pow-1)-2^(pow-1))*25;
    %handles.x3=[];
    handles.x3(1)=round(sig2(1));
    predict=0;
    for k=2:length(sig2)
        predict=handles.x3(k-1)+predict;
        handles.x3(k)=round(sig2(k)-predict);
        if handles.x3(k)>2^(pow-1)-1; handles.x3(k)=2^(pow-1)-1; end;
        if handles.x3(k)<-2^(pow-1); handles.x3(k)=-2^(pow-1); end;
    end;
elseif opr == 3
    A = 2;
    handles.x2=handles.x1+A;
    handles.x2=handles.x2/(2*A);
    L=(-1+2^handles.n) ;
    handles.x2=L*handles.x2;
    handles.x3=round(handles.x2);
elseif opr == 4
    handles.xmin=min(handles.x2); 
    handles.xmax=max(handles.x2);
    Q=(handles.xmax-handles.xmin)/handles.n;
    handles.x3=sign(handles.x2).*(floor((abs(handles.x2)+Q/2)/Q)*Q);
    %handles.x3=floor((handles.x2-handles.xmin)/Q)*Q+Q/2+handles.xmin;
elseif opr == 5
    handles.xmin=min(handles.x2); 
    handles.xmax=max(handles.x2);
    magmax=max(abs(handles.x2));
    handles.xmin=-magmax;
    handles.xmax=magmax;
    Q=(handles.xmax-handles.xmin)/handles.n;
    y=handles.xmax*log10(1+abs(handles.x2)*(8/handles.xmax))/log10(1+8);
    yq=floor((y-handles.xmin)/Q)*Q+Q/2+handles.xmin;
    handles.x3=(handles.xmax/8)*(10.^((log10(1+8)/handles.xmax)*yq)-1).*sign(handles.x2);

end;
subplot(2,3,6),plot(handles.x3);
guidata(hObject, handles);

% --- Executes on button press in canplay.
function canplay_Callback(hObject, eventdata, handles)
% hObject    handle to canplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x3,handles.Fe)

% --- Executes on button press in coderplay.
function coderplay_Callback(hObject, eventdata, handles)
% hObject    handle to coderplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x4,handles.Fe)

% --- Executes on button press in compplay.
function compplay_Callback(hObject, eventdata, handles)
% hObject    handle to compplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x2,handles.Fe)

% --- Executes on button press in filterplay.
function filterplay_Callback(hObject, eventdata, handles)
% hObject    handle to filterplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x1,handles.Fe)


% --- Executes on button press in ecouter.
function ecouter_Callback(hObject, eventdata, handles)
% hObject    handle to ecouter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
handles.Fe=44100;
handles.n=2;
handles.rec = audiorecorder(44100, 16, handles.n-1);
recordblocking(handles.rec, 5);
handles.x=getaudiodata(handles.rec);
subplot(2,3,3),plot(handles.x);
guidata(hObject, handles);


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
sound(handles.x,handles.Fe)
