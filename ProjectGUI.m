function varargout = ProjectGUI(varargin)
% PROJECTGUI MATLAB code for ProjectGUI.fig
%      PROJECTGUI, by itself, creates a new PROJECTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTGUI returns the handle to a new PROJECTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI.M with the given input arguments.
%
%      PROJECTGUI('Property','Value',...) creates a new PROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjectGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjectGUI

% Last Modified by GUIDE v2.5 03-Dec-2015 21:35:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjectGUI_OutputFcn, ...
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


% --- Executes just before ProjectGUI is made visible.
function ProjectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjectGUI (see VARARGIN)

% Choose default command line output for ProjectGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

init();


% --- Outputs from this function are returned to the command line.
function varargout = ProjectGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnTrain.
function btnTrain_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global m;
    global n;
    m = str2double(get(handles.textbox1,'String'));
    cver = svm_test_fun(m);
    n = cver;
%load('1.mat');
%label=obj.predict([]);%
%labelstr=numtostr(label);
%
    set(handles.text, 'String', 'Training Finished');

% --- Executes on button press in btnTesting.
function btnTesting_Callback(hObject, eventdata, handles)
% hObject    handle to btnTesting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global n;
    global m;
    global obj;
    global Big_sift;
    
    %m = 18;
Labels = {'Basketball', 'Bike', 'Hudiejie','Car','Keyboard', 'Cup', 'Dog','Drum','Dizi','Fox','Panda','Fish','Golfball','Helmet','Jellyfish','Spone','Piano','Apnap','SeaStar','Ship'};
ry = zeros(1,20);
    num=0;
for i = 1:20
        label = predict(obj,double(Big_sift((m*(i-1)+1):m*i,:)));
        labeln = label';
        for j = 1:m
            if labeln(j) == i;
                num = num+1;
            end
            ry(i) = num/m;
        end
        num =0;
    end
%word = 'Cross Validation Error = '+ n;
    set(handles.text, 'String', n);
Labels = {'Basketball', 'Bike', 'Hudiejie','Car','Keyboard', 'Cup', 'Dog','Drum','Dizi','Fox','Panda','Fish','Golfball','Helmet','Jellyfish','Spone','Piano','Apnap','SeaStar','Ship'};
x = 1:20;
    %y = [0.8, 0.7, 0.6, 0.8];
    axes(handles.axes1)
    bar(x,ry)
ylabel('Accuracy in Percentage')
set(gca, 'XTick', 1:20, 'XTickLabel', Labels);
set(handles.uitable1,'data',ry(1:20)');


function textbox1_Callback(hObject, eventdata, handles)
% hObject    handle to textbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox1 as text
%        str2double(get(hObject,'String')) returns contents of textbox1 as a double


% --- Executes during object creation, after setting all properties.
function textbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox2_Callback(hObject, eventdata, handles)
% hObject    handle to textbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox2 as text
%        str2double(get(hObject,'String')) returns contents of textbox2 as a double


% --- Executes during object creation, after setting all properties.
function textbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global m;
    charac={'017','024','028','037','047','054','058','061','069','070','074','075','076','089','096','098','125','162','167','197'};%the 49th one in the 033 data loss.
    n = str2double(get(handles.textbox2,'String'));
% if mod(n, m)== 0
%     k = n/m;
%     i = m;
% else
%     k = floor(n/m + 1);
%     i = mod(n, m);
% end


if mod(n, 100)== 0
    k = n/100;
    i = 100;
    else
    k = floor(n/100 + 1);
    i = mod(n, 100);
    end

    d_name = char(charac(k));
    xfiles=dir(['finalProjectData\class',d_name,'\*.jpeg']);
    I = imread(['finalProjectData\class',d_name,'\',xfiles(i).name]);
    axes(handles.axes2)
    imshow(I);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global obj;
    global Big_sift;
    n = str2double(get(handles.textbox2,'String'));
    label = predict(obj,double(Big_sift(n,:)));
    if label == 1
        output ='Basketball';
    elseif label == 2
        output ='Bike';
    elseif label == 3
        output ='Hudiejie';
    elseif label == 4
        output ='car';
    elseif label == 5
        output ='Keyboard';
    elseif label == 6
        output ='Cup';
    elseif label == 7
        output ='Dog';
    elseif label == 8
        output ='Drum';
    elseif label == 9
        output ='Dizi';
    elseif label == 10
        output ='Fox';
    elseif label == 11
        output ='Panda';
    elseif label == 12
        output ='Fish';
    elseif label == 13
        output ='Golf Ball';
    elseif label == 14
        output ='Helmet';
    elseif label == 15
        output ='Jelly Fish';
    elseif label == 16
        output ='Spone';
    elseif label == 17
        output ='Piano';
    elseif label == 18
        output ='Apnapple';
    elseif label == 19
        output ='Sea Star';
    elseif label == 20
        output ='Ship';
    else
        output = 'Not recognized';
    end
    disp(label);
    set(handles.text, 'String', output);


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
