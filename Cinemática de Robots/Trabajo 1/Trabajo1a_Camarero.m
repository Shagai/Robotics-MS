function varargout = Trabajo1a_Camarero(varargin)
% Trabajo1a_Camarero MATLAB code for Trabajo1a_Camarero.fig
%      Trabajo1a_Camarero, by itself, creates a new Trabajo1a_Camarero or raises the existing
%      singleton*.
%
%      H = Trabajo1a_Camarero returns the handle to a new Trabajo1a_Camarero or the handle to
%      the existing singleton*.
%
%      Trabajo1a_Camarero('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Trabajo1a_Camarero.M with the given input arguments.
%
%      Trabajo1a_Camarero('Property','Value',...) creates a new Trabajo1a_Camarero or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trabajo1a_Camarero_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trabajo1a_Camarero_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trabajo1a_Camarero

% Last Modified by GUIDE v2.5 29-Nov-2015 23:14:46

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


% --- Executes just before Trabajo1a_Camarero is made visible.
function Trabajo1a_Camarero_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trabajo1a_Camarero (see VARARGIN)

% Choose default command line output for Trabajo1a_Camarero
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Trabajo1a_Camarero wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Set by default the DH Table
data_default = {'0' '0' '0' '0'; '0' '0' '0' '0'};
set(handles.DHTable,'Data',data_default);
%Set by default the Qs Table
qs_default = zeros(7,1);
set(handles.QsTable,'Data',qs_default);
%Set by default the position
pos_default = zeros(6,1);
set(handles.Position,'Data',pos_default);
%Set by default the gravity
grav_default = {'0'; '0'; '9.81'};
set(handles.Gravity,'Data',grav_default);
%Set by default the origin of the tool
tool_default = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
set(handles.Tool,'Data',tool_default);
%Set by default the origin of the base
base_default = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
set(handles.Base,'Data',base_default);
% Start the Peter Corke Toolbox
startup_rvc;
% Start Parallel Computing
%myCluster = parcluster('local');
%myCluster.NumWorkers = 12;
%saveProfile(myCluster);
%POOL = parpool('local',12);


% --- Outputs from this function are returned to the command line.
function varargout = Trabajo1a_Camarero_OutputFcn(hObject, eventdata, handles) 
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
gdl = get(handles.EnterGDL,'String');           % Get Grades Of Freedom 
data = get(handles.DHTable,'Data');             % Get Data from Denavit-Hatenberg table
jacob = get(handles.JacobTable, 'Data');        % Get Data from Jacobian table
dataBuff = cell(str2num(gdl), 4);               % Initialize a buffer
clearJacob = cell(6,str2num(gdl));              % Initialize Jacobian
namesCol = cell(str2num(gdl),1);
% Update the Denavit-Hatenberg Table
for i = 1:str2num(gdl)
    dataBuff(i,:) = {'0' '0' '0' '0'};
    if i <= size(data,1)
        dataBuff(i,:) = data(i,:);
    end
    
    namesCol(i,1) = {strcat('J',num2str(i))};
end
% Set the update data in DHTable and JacobTable
set(handles.DHTable,'Data',dataBuff);
set(handles.JacobTable, 'Data', clearJacob);
set(handles.JacobTable, 'ColumnName', namesCol);


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

% Get Robot variable and articular position
[robot, qs, prismatic] = GetRobot(handles);

% Calculate Forward Kinematic Matrix
MatrixHom = robot.fkine(qs);

% Choose if represent position and rotation as 'Coordenadas Cartesianas y Angulares'
% or as 'Matriz de Transformación Homogénea del Extremo'
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
    
% Plot the robot's squeme at the choosen rotation
axes(handles.PlotRobot);
if prismatic == true
    W = [-2 2 -2 2 -2 2];
else
    W = [];
end
robot.plot(qs, 'workspace', W);

Jacobian(robot, qs, handles);           
yoshikawa = robot.maniplty(qs, 'yoshikawa');        % Calculate yoshikawa index for this articular position
set(handles.Yoshikawa,'String', yoshikawa);

handles.robot = robot;

% Update handles structure
guidata(hObject, handles);

% Get the robot variable of Robotics toolbox
function [robot, qs, prismatic] = GetRobot(handles)
gdl = get(handles.EnterGDL,'String');               % Degrees Of Freedom
qsData = get(handles.QsTable,'Data');               % Articular Values
DHdata = get(handles.DHTable,'Data');               % Denavit-Hatenberg
gravity0 = get(handles.Gravity,'Data');             % Gravity
tool0 = get(handles.Tool,'Data');                   % Tool
base0 = get(handles.Base,'Data');                   % Base
angleValue = get(handles.GradRad,'Value');          % Degrees or Radians
anglenames = get(handles.GradRad,'String');
angles = anglenames(angleValue);
Conv2Rad = 1;

% If Degrees convert to radians
if strcmp(angles, 'Grados')
    Conv2Rad = pi/180;
end   

% There aren't prismatic variables
prismatic = false;

% Convert DH-Table values to parameters for Robotics Toolbox
for i = 1:str2num(gdl)          % For each degree of freedom
    matchQ = regexp(char(DHdata(i,1)), 'q\d*', 'match');
    if (size(matchQ,1) == 1)
        tokens = regexp(char(DHdata(i,1)), '([\+\-\*\/]+[\s]*\w*[\s]*.*)+', 'tokens');
        if size(tokens, 1) == 0
            offset = 0;
        else 
            offset = eval(char(tokens{1}));
        end
        % Set Link angular parameter
        L(i) = Link([0 eval(char(DHdata{i,2})) eval(char(DHdata{i,3}))... 
               eval(char(DHdata{i,4}))*Conv2Rad 0 offset]);
    else
        tokens = regexp(char(DHdata(i,2)), '([\+\-\*\/]+[\s]*\w*[\s]*.*)+', 'tokens');
        if size(tokens, 1) == 0
            offset = 0;
        else 
            offset = eval(char(tokens{1}));
        end
        % Set Link prismatic parameter
        L(i) = Link([eval(char(DHdata{i,1}))*Conv2Rad 0 eval(char(DHdata{i,3}))...
               eval(char(DHdata{i,4}))*Conv2Rad 1 offset]);
           
        prismatic = true;
    end   
    
    % TODO: Introduce more than 7 rotations
    if i < 8
        qs(i) = qsData(i,1) * Conv2Rad;
    else
        qs(i) = 0;
    end
end

% Set origin of tool and base
for i=1:4
    for j=1:4
        tool(i,j) = eval(char(tool0(i,j)));
        base(i,j) = eval(char(base0(i,j)));
    end
end

for i=1:3
   gravity(i,1) =  eval(char(gravity0(i,1)));
end

% Create the robot variable
robot = SerialLink(L, 'name', 'robot');
robot.gravity = gravity;
robot.tool = tool;
robot.base = base;

% Calculate Jacobian and plot its vectors
function Jacob = Jacobian(robot, qs, handles)
gdl = get(handles.EnterGDL,'String');           % Degree of freedom
Jacob = robot.jacob0(qs);                       % Jacobian
set(handles.JacobTable, 'Data', Jacob);

axes(handles.JacobVel);
cla reset;
grid on
hold all
% Get names of each vector to show in legend
for i = 1:str2num(gdl)
    nameJv(i) = {strcat('Jv',num2str(i))};
    nameJw(i) = {strcat('Jw',num2str(i))};
end
% Plot for each Degree of freedom
for i = 1:str2num(gdl)
    plot3([0 Jacob(1,i)], [0 Jacob(2,i)], [0 Jacob(3,i)], '-')
    legend(nameJv(1:i));
end
view(45,45)
xlabel('X') % x-axis label
ylabel('Y') % y-axis label
zlabel('Z') % z-axis label
hold off

% The same but with angular jacobian's vectors
axes(handles.JacobRot);
cla reset;
grid on
hold all
for i = 1:str2num(gdl)
    plot3([0 Jacob(4,i)], [0 Jacob(5,i)], [0 Jacob(6,i)], '-')
    legend(nameJw(1:i));
end
view(45,45)
xlabel('X') % x-axis label
ylabel('Y') % y-axis label
zlabel('Z') % z-axis label
hold off
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

base = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
tool = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};

% 3link3d Robot
if strcmp(robotName,'3link3d')
    dh_data = {'q1' '1' '0' 'pi/2'; ...
               'q2' '0' '2' '0';...
               'q3' '0' '3' '0'};
    gdl = size(dh_data,1);
% Hyper2d Robot
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
% Hyper3d Robot   
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
% Irb140 Robot    
elseif strcmp(robotName,'Irb140')
    dh_data = {'q1' '0.3520' '0.07' '-pi/2'; ...
               'q2' '0' '0.36' '0'; ...
               'q3' '0' '0' 'pi/2'; ...
               'q4' '0.38' '0' '-pi/2'; ...
               'q5' '0' '0' 'pi/2'; ...
               'q6' '0.0650' '0' 'pi/2';};
    gdl = size(dh_data,1);
% Jaco Robot   
elseif strcmp(robotName,'Jaco')
    dh_data = {'q1' '0.2755' '0' 'pi/2'; ...
               'q2-pi/2' '0' '0.41' 'pi'; ...
               'q3+pi/2' '-0.0098' '0' 'pi/2'; ...
               'q4' '-0.2502' '0' 'pi/3'; ...
               'q5-pi' '-0.08579' '0' 'pi/3'; ...
               'q6+1.745' '-0.2116' '0' 'pi';};
    gdl = size(dh_data,1);
% KR5 Robot    
elseif strcmp(robotName,'KR5')
    dh_data = {'q1' '0.4' '0.18' 'pi/2'; ...
               'q2' '0.135' '0.6' 'pi'; ...
               'q3' '0.135' '0.12' '-pi/2'; ...
               'q4' '0.62' '0' 'pi/2'; ...
               'q5' '0' '0' '-pi/2'; ...
               'q6' '0' '0' '0';};
    base = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};
    tool = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0.115'; '0' '0' '0' '1'};       
    gdl = size(dh_data,1);
% M16 Robot    
elseif strcmp(robotName,'M16')
    dh_data = {'q1' '0.524' '0.15' '-pi/2'; ...
               'q2' '0' '0.77' 'pi'; ...
               'q3' '0' '-0.1' 'pi/2'; ...
               'q4' '0.74' '0' '-pi/2'; ...
               'q5' '0' '0' 'pi/2'; ...
               'q6' '0.1' '0' 'pi';}; 
    gdl = size(dh_data,1);
% Mico Robot    
elseif strcmp(robotName,'Mico')
    dh_data = {'q1' '0.2755' '0' 'pi/2'; ...
               'q2' '0' '0.29' 'pi'; ...
               'q3' '-0.007' '0' 'pi/2'; ...
               'q4' '-0.1661' '0' 'pi/3'; ...
               'q5' '-0.08556' '0' 'pi/3'; ...
               'q6' '-0.2028' '0' 'pi';};
    gdl = size(dh_data,1);
% OneLink Robot    
elseif strcmp(robotName,'OneLink')
    dh_data = {'q1' '0' '1' '0' };
    gdl = size(dh_data,1);
% P8 Robot   
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
    tool = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};  
    gdl = size(dh_data,1);
% Two Link Robot    
elseif strcmp(robotName,'TwoLink')
    dh_data = {'q1' '0' '1' '0';...
               'q2' '0' '1' '0'}
    base = {'1' '0' '0' '0'; '0' '0' '-1' '0'; '0' '1' '0' '0'; '0' '0' '0' '1'};
    tool = {'1' '0' '0' '0'; '0' '1' '0' '0'; '0' '0' '1' '0'; '0' '0' '0' '1'};  
    gdl = size(dh_data,1);
end
% Set the choosen robot parameters
set(handles.Base,'Data', base);  
set(handles.Tool,'Data',tool);

set(handles.EnterGDL,'String', gdl);
set(handles.DHTable,'Data',dh_data);
set(handles.GradRad, 'value', 2);




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


% --- Executes when entered data in editable cell(s) in JacobTable.
function JacobTable_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to JacobTable (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



function Yoshikawa_Callback(hObject, eventdata, handles)
% hObject    handle to Yoshikawa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yoshikawa as text
%        str2double(get(hObject,'String')) returns contents of Yoshikawa as a double


% --- Executes during object creation, after setting all properties.
function Yoshikawa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yoshikawa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Show Yoshikawa's values in a 3D plot
% --- Executes on button press in Mostrar.
function Mostrar_Callback(hObject, eventdata, handles)
% hObject    handle to Mostrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

robot = handles.robot;

[yoshikawa, X] = Yoshikawa_W(hObject, handles, robot);

% Calculate Yoshikawa indices around all work space
function [yoshikawa, X] = Yoshikawa_W(hObject, handles, robot)
gdl = str2double(get(handles.EnterGDL,'String'));       % GDL
set = sobolset(gdl);                                    % Construct Sobol quasi-random point set           
N = str2double(get(handles.NumPoints,'String'));        % Number of Points in the 3D Space
qs = net(set,N);                                        % Retrieve N first numbers
qs = qs.*(2*pi);                                        % Adjust to our values [0-1]*(2*pi)
X = zeros(N, 3);                                        % Initialize vector of points [X Y Z]
yoshikawa = zeros(1,N);                                 % Initialize vector of Yoshikawa indices
% Parallel For Loop along all Points
parfor i = 1:N
    MatrixHom = robot.fkine(qs(i,:));                           % Calculate Homogeneus Matrix
    X(i,:) = transl(MatrixHom)';                                % Calculate Point of space from Homogeneus Matrix
    yoshikawa(1,i) = robot.maniplty(qs(i,:), 'yoshikawa');      % Calculate Yoshikawa index
end

handles.Dimensions = [min(X(:,1)), max(X(:,1)), min(X(:,2)), max(X(:,2)) ,min(X(:,3)), max(X(:,3))];    % Save Dimensions of space
handles.yoshikawa = yoshikawa;                                  % Save Yoshikawa Indice
handles.X = X;                                                  % Save Points
% Update handles structure
guidata(hObject, handles);
% Show Yoshikawa Indices in a 3D scatter
ShowYoshikawa(handles);

% Plot in a 3D scatter the calculated points
function ShowYoshikawa(handles)
plane = get(handles.planeYoshi,'Value');                      % Plane
N = str2double(get(handles.NumPoints,'String'));              % Number of Points in 3D Space
value = get(handles.sliderYoshi, 'Value');                    % Value of Slider
thickness = str2double(get(handles.thickness, 'String'));     % Thicknes of the plane
index = 1;                                                    % Axis by defaul
% If XY Plane
if (plane == 1)
    index = 3;      % Z Axis
end
% If XZ Plane
if (plane == 2)
    index = 2;      % Y Axis
end
% If YZ Plane
if (plane == 3)
    index = 1;      % X Axis
end
X = handles.X;                                              % Points of Space
yoshikawa = handles.yoshikawa;                              % Yoshikawa Indices
dimensions = handles.Dimensions;                            % Dimensions
set(handles.sliderYoshi, 'Min', dimensions(2*index-1))      % Set Max value to slider
set(handles.sliderYoshi, 'Max', dimensions(2*index))        % Set Min value to slider
h = 0;
O = 0;
% For loop along N points
for i = 1:N
    % If vector of points is inside of the plane save the vector
    if ((value - thickness) < X(i,index) && X(i,index) < (value + thickness))
        h = h + 1;
        Points(h,1) =  X(i,1);          % X Coord
        Points(h,2) =  X(i,2);          % Y Coord 
        Points(h,3) =  X(i,3);          % Z Coord
        yos(h) = abs(yoshikawa(i));     % Save Yoshikawa index
    end
end

%Plot the 3D scatter
axes(handles.YoshiPlot);
scatter3(Points(:,1),Points(:,2),Points(:,3), 40, yos(:), 'filled')     % 3D Scatter
ax = gca;
ax.XDir = 'reverse';
% X Y Z Labels
xlabel('x')
ylabel('y')
zlabel('z')
% Size of the plot box
xlim([dimensions(1) dimensions(2)]);
ylim([dimensions(3) dimensions(4)]);
zlim([dimensions(5) dimensions(6)]);

% Change the camera view in function of the selected plane
if (plane == 1)
    view(0,90)  % XY
end
if (plane == 2)
    view(0,0)   % XZ
end
if (plane == 3)
    view(90,0)  % YZ
end
% Color of the colorbar
cb = colorbar;                                     % create and label the colorbar
cb.Label.String = 'Yoshikawa Index';

% --- Executes on selection change in planeYoshi.
function planeYoshi_Callback(hObject, eventdata, handles)
% hObject    handle to planeYoshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns planeYoshi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from planeYoshi


% --- Executes during object creation, after setting all properties.
function planeYoshi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to planeYoshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderYoshi_Callback(hObject, eventdata, handles)
% hObject    handle to sliderYoshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

% Show Yoshikawa indice every time slider moves
ShowYoshikawa(handles);

% --- Executes during object creation, after setting all properties.
function sliderYoshi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderYoshi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function thickness_Callback(hObject, eventdata, handles)
% hObject    handle to thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of thickness as text
%        str2double(get(hObject,'String')) returns contents of thickness as a double


% --- Executes during object creation, after setting all properties.
function thickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to thickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumPoints_Callback(hObject, eventdata, handles)
% hObject    handle to NumPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumPoints as text
%        str2double(get(hObject,'String')) returns contents of NumPoints as a double


% --- Executes during object creation, after setting all properties.
function NumPoints_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
