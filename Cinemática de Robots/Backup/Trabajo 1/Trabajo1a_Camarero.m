function varargout = Trabajo1a_Camarero(varargin)
% GUI01 MATLAB code for GUI01.fig
%      GUI01, by itself, creates a new GUI01 or raises the existing
%      singleton*.
%
%      H = GUI01 returns the handle to a new GUI01 or the handle to
%      the existing singleton*.
%
%      GUI01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI01.M with the given input arguments.
%
%      GUI01('Property','Value',...) creates a new GUI01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI01

% Last Modified by GUIDE v2.5 25-Oct-2015 12:16:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trabajo1a_Camarero_OpeningFcn, ...
                   'gui_OutputFcn',  @Trabajo1a_Camarero_OutputFcn, ...
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


% --- Executes just before GUI01 is made visible.
function Trabajo1a_Camarero_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI01 (see VARARGIN)

% Choose default command line output for GUI01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Set by default the DH Table
data_default = {'0' '0' '0' '0'; '0' '0' '0' '0'};
set(handles.DHTable,'Data',data_default);
%Set by default the Qs Table
qs_default = zeros(7,1);
set(handles.QsTable,'Data',qs_default);

pos_default = zeros(6,1);
set(handles.Position,'Data',pos_default);

grav_default = {'0'; '0'; '9.81'};
set(handles.Gravity,'Data',grav_default);

tool_default = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
set(handles.Tool,'Data',tool_default);

base_default = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
set(handles.Base,'Data',base_default);

startup_rvc;


% --- Outputs from this function are returned to the command line.
function varargout = GUI01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in DHTable.
function DHTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to DHTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function EnterGDL_Callback(hObject, eventdata, handles)
% hObject    handle to EnterGDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EnterGDL as text
%        str2double(get(hObject,'String')) returns contents of EnterGDL as a double


% --- Executes during object creation, after setting all properties.
function EnterGDL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnterGDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SetGDL.
function SetGDL_Callback(hObject, eventdata, handles)
% hObject    handle to SetGDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gdl = get(handles.EnterGDL,'String');
data = get(handles.DHTable,'Data');
dataBuff = cell(str2num(gdl), 4);
for i = 1:str2num(gdl)
    dataBuff(i,:) = {'0' '0' '0' '0'};
    if i <= size(data,1)
        dataBuff(i,:) = data(i,:);
    end
end
set(handles.DHTable,'Data',dataBuff);


% --- Executes on slider movement.
function q1_Callback(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(1) = get(handles.q1,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q2_Callback(hObject, eventdata, handles)
% hObject    handle to q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(2) = get(handles.q2,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q3_Callback(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(3) = get(handles.q3,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q4_Callback(hObject, eventdata, handles)
% hObject    handle to q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(4) = get(handles.q4,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q5_Callback(hObject, eventdata, handles)
% hObject    handle to q5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(5) = get(handles.q5,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q6_Callback(hObject, eventdata, handles)
% hObject    handle to q6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(6) = get(handles.q6,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function q7_Callback(hObject, eventdata, handles)
% hObject    handle to q7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
qsData = get(handles.QsTable,'Data');
qsData(7) = get(handles.q7,'Value');
set(handles.QsTable,'Data', qsData);

% --- Executes during object creation, after setting all properties.
function q7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when entered data in editable cell(s) in QsTable.
function QsTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to QsTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.QsTable,'Data');
set(handles.q1,'Value',data(1,1));
set(handles.q2,'Value',data(2,1));
set(handles.q3,'Value',data(3,1));
set(handles.q4,'Value',data(4,1));
set(handles.q5,'Value',data(5,1));
set(handles.q6,'Value',data(6,1));
set(handles.q7,'Value',data(7,1));


% --- Executes on button press in Calcular.
function Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gdl = get(handles.EnterGDL,'String');
qsData = get(handles.QsTable,'Data');
DHdata = get(handles.DHTable,'Data');
gravity0 = get(handles.Gravity,'Data');
tool0 = get(handles.Tool,'Data');
base0 = get(handles.Base,'Data');

angleValue = get(handles.GradRad,'Value');
anglenames = get(handles.GradRad,'String');
angles = anglenames(angleValue);
Conv2Rad = 1;

if strcmp(angles, 'Grados')
    Conv2Rad = pi/180;
end   

for i = 1:str2num(gdl)
    matchQ = regexp(char(DHdata(i,1)), 'q\d*', 'match');
    if (size(matchQ,1) == 1)
        tokens = regexp(char(DHdata(i,1)), '([\+\-\*\/]+[\s]*\w*[\s]*.*)+', 'tokens');
        if size(tokens, 1) == 0
            offset = 0;
        else 
            offset = eval(char(tokens{1}));
        end
        L(i) = Link([0 eval(char(DHdata{i,2})) eval(char(DHdata{i,3}))... 
               eval(char(DHdata{i,4}))*Conv2Rad 0 offset]);
    else
        tokens = regexp(char(DHdata(i,2)), '([\+\-\*\/]+[\s]*\w*[\s]*.*)+', 'tokens');
        if size(tokens, 1) == 0
            offset = 0;
        else 
            offset = eval(char(tokens{1}));
        end
        L(i) = Link([eval(char(DHdata{i,1}))*Conv2Rad 0 eval(char(DHdata{i,3}))...
               eval(char(DHdata{i,4}))*Conv2Rad 1 offset]);
    end   
    qs(i) = qsData(i,1) * Conv2Rad;
end

for i=1:4
    for j=1:4
        tool(i,j) = eval(char(tool0(i,j)));
        base(i,j) = eval(char(base0(i,j)));
    end
end

for i=1:3
   gravity(i,1) =  eval(char(gravity0(i,1)));
end

robot = SerialLink(L, 'name', 'robot');
robot.gravity = gravity;
robot.tool = tool;
robot.base = base;
%robot
MatrixHom = robot.fkine(qs);

CoordValue = get(handles.Coord,'Value');
Coordnames = get(handles.Coord,'String');
coord = Coordnames(CoordValue);

if (strcmp(coord, 'Coordenadas Cartesianas y Angulares'))
    posrot(1:3) = transl(MatrixHom)';
    posrot(4:6) = tr2eul(MatrixHom);
    set(handles.Position, 'Data', posrot');
elseif (strcmp(coord, 'Matriz de Transformación Homogénea del Extremo'))
    hom = mat2cell(MatrixHom,4,4);
    set(handles.Homogenea, 'Data', hom{1,1});
end
    
axes(handles.PlotRobot);
W = [-1 1 -1 1 -1 1];
robot.plot(qs, 'workspace', W);

%set(handles.figure1, 'units', 'normalized', 'position', [0.05 0.15 0.5 0.8])


% --- Executes on selection change in PredefRobots.
function PredefRobots_Callback(hObject, eventdata, handles)
% hObject    handle to PredefRobots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns PredefRobots contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PredefRobots
robotValue = get(handles.PredefRobots,'Value');
names = get(handles.PredefRobots,'String');

robotName = names(robotValue);

if strcmp(robotName,'3link3d')
    dh_data = {'q1' '1' '0' 'pi/2'; ...
               'q2' '0' '2' '0';...
               'q3' '0' '3' '0'};
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'Hyper2d')
    dh_data = {'q1' '0' '0.1' '0'; ...
               'q2' '0' '0.1' '0'; ...
               'q3' '0' '0.1' '0'; ...
               'q4' '0' '0.1' '0'; ...
               'q5' '0' '0.1' '0'; ...
               'q6' '0' '0.1' '0'; ...
               'q7' '0' '0.1' '0'; ...
               'q8' '0' '0.1' '0'; ...
               'q9' '0' '0.1' '0'; ...
               'q10' '0' '0.1' '0';};
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'Hyper3d')
    dh_data = {'q1' '0' '0.1' 'pi/2'; ...
               'q2' '0' '0.1' '0'; ...
               'q3' '0' '0.1' 'pi/2'; ...
               'q4' '0' '0.1' '0'; ...
               'q5' '0' '0.1' 'pi/2'; ...
               'q6' '0' '0.1' '0'; ...
               'q7' '0' '0.1' 'pi/2'; ...
               'q8' '0' '0.1' '0'; ...
               'q9' '0' '0.1' 'pi/2'; ...
               'q10' '0' '0.1' '0';};
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'Irb140')
    dh_data = {'q1' '0.3520' '0.07' '-pi/2'; ...
               'q2' '0' '0.36' '0'; ...
               'q3' '0' '0' 'pi/2'; ...
               'q4' '0.38' '0' '-pi/2'; ...
               'q5' '0' '0' 'pi/2'; ...
               'q6' '0.0650' '0' 'pi/2';};
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'Jaco')
    dh_data = {'q1' '0.2755' '0' 'pi/2'; ...
               'q2-pi/2' '0' '0.41' 'pi'; ...
               'q3+pi/2' '-0.0098' '0' 'pi/2'; ...
               'q4' '-0.2502' '0' 'pi/3'; ...
               'q5-pi' '-0.08579' '0' 'pi/3'; ...
               'q6+1.745' '-0.2116' '0' 'pi';};
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'KR5')
    dh_data = {'q1' '0.4' '0.18' 'pi/2'; ...
               'q2' '0.135' '0.6' 'pi'; ...
               'q3' '0.135' '0.12' '-pi/2'; ...
               'q4' '0.62' '0' 'pi/2'; ...
               'q5' '0' '0' '-pi/2'; ...
               'q6' '0' '0' '0';};
    tool = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0.115'; '0' '0' '0' '1'};
    set(handles.Tool,'Data',tool);    
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'M16')
    dh_data = {'q1' '0.524' '0.15' '-pi/2'; ...
               'q2' '0' '0.77' 'pi'; ...
               'q3' '0' '-0.1' 'pi/2'; ...
               'q4' '0.74' '0' '-pi/2'; ...
               'q5' '0' '0' 'pi/2'; ...
               'q6' '0.1' '0' 'pi';}; 
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'Mico')
    dh_data = {'q1' '0.2755' '0' 'pi/2'; ...
               'q2' '0' '0.29' 'pi'; ...
               'q3' '-0.007' '0' 'pi/2'; ...
               'q4' '-0.1661' '0' 'pi/3'; ...
               'q5' '-0.08556' '0' 'pi/3'; ...
               'q6' '-0.2028' '0' 'pi';}; 
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'OneLink')
    dh_data = {'q1' '0' '1' '0' };
    gdl = size(dh_data,1);

elseif strcmp(robotName,'P8')
    dh_data = {'0' 'q1' '0' '-pi/2'; ...
               '-pi/2' 'q2' '0' 'pi/2'; ...
               'q3' '0.762' '0' 'pi/2'; ...
               'q4' '0' '0.4318' '0'; ...
               'q5' '0.15' '0.0203' '-pi/2'; ...
               'q6' '0.4318' '0' 'pi/2'; ...
               'q7' '0' '0' '-pi/2'; ...
               'q8' '0' '0' '0';}; 
    base = {'0' '0' '1' '0'; '0' '1' '0' '0'; '-1' '0' '0' '0'; '0' '0' '0' '1'};
    set(handles.Base,'Data', base);    
    gdl = size(dh_data,1);
    
elseif strcmp(robotName,'TwoLink')
    dh_data = {'q1' '0' '1' '0';...
               'q2' '0' '1' '0'}
    base = {'1' '0' '0' '0'; '0' '0' '-1' '0'; '0' '1' '0' '0'; '0' '0' '0' '1'};
    set(handles.Base,'Data', base);    
    gdl = size(dh_data,1);
end

set(handles.EnterGDL,'String', gdl);
set(handles.DHTable,'Data',dh_data);




% --- Executes during object creation, after setting all properties.
function PredefRobots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PredefRobots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: PredefRobots controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Coord.
function Coord_Callback(hObject, eventdata, handles)
% hObject    handle to Coord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Coord contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Coord


% --- Executes during object creation, after setting all properties.
function Coord_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Coord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in GradRad.
function GradRad_Callback(hObject, eventdata, handles)
% hObject    handle to GradRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GradRad contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GradRad


% --- Executes during object creation, after setting all properties.
function GradRad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GradRad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
