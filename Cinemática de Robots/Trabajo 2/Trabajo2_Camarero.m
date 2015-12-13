function varargout = Trabajo2_Camarero(varargin)
% TRABAJO2_CAMARERO MATLAB code for Trabajo2_Camarero.fig
%      TRABAJO2_CAMARERO, by itself, creates a new TRABAJO2_CAMARERO or raises the existing
%      singleton*.
%
%      H = TRABAJO2_CAMARERO returns the handle to a new TRABAJO2_CAMARERO or the handle to
%      the existing singleton*.
%
%      TRABAJO2_CAMARERO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRABAJO2_CAMARERO.M with the given input arguments.
%
%      TRABAJO2_CAMARERO('Property','Value',...) creates a new TRABAJO2_CAMARERO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Trabajo2_Camarero_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Trabajo2_Camarero_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Trabajo2_Camarero

% Last Modified by GUIDE v2.5 10-Dec-2015 09:32:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Trabajo2_Camarero_OpeningFcn, ...
                   'gui_OutputFcn',  @Trabajo2_Camarero_OutputFcn, ...
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


% --- Executes just before Trabajo2_Camarero is made visible.
function Trabajo2_Camarero_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Trabajo2_Camarero (see VARARGIN)

% Choose default command line output for Trabajo2_Camarero
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Trabajo2_Camarero wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Trabajo2_Camarero_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in GDL.
function GDL_Callback(hObject, eventdata, handles)
% hObject    handle to GDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns GDL contents as cell array
%        contents{get(hObject,'Value')} returns selected item from GDL


% --- Executes during object creation, after setting all properties.
function GDL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Error_Callback(hObject, eventdata, handles)
% hObject    handle to Error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Error as text
%        str2double(get(hObject,'String')) returns contents of Error as a double


% --- Executes during object creation, after setting all properties.
function Error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calcular.
function Calcular_Callback(hObject, eventdata, handles)
% hObject    handle to Calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
error = str2double(get(handles.Error,'String'));
gdl = get(handles.GDL,'Value');

ccd(handles, error, gdl);

function mouseMove (object, eventdata)
    C = get (gca, 'CurrentPoint');
    title(gca, ['(X,Y) = (', num2str(C(1,1)), ', ',num2str(C(1,2)), ')']);

function ccd(handles, error_t, N)

% axes(handles.CCDPlot);
% figure(1)
% title('Planar Robot','FontSize',12)
% axis([-11 11 -11 11])       % axis limits
% axis manual                 % set axis to exact manual value(
% hold on                     % does not erase previous graphs 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.CCDPlot);
axis([-11 11 -11 11])               % axis limits
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
[x,y] = ginput(2);
pt = [x(2);y(2)];                         % target point (in column matrix)

% initialization of data
num_of_link = N;                    % number of link
xdata = (0:10/N:10);                % x position of each joint of robot
xdata = xdata + x(1)
buff = xdata(2);
for i = 1:num_of_link+1
    ydata(i) = y(1);                   % Initializate ydata (y position) to y(1)
end
for i = 1:num_of_link
    angledata(i) = 0;               % Initializate angledata to 0 
end

axes(handles.CCDPlot);
plot_CCD(xdata, ydata)

hold on

error = dist([xdata(num_of_link+1) ydata(num_of_link+1)], pt);  % Distance error between pt and x/ydata
while (error > error_t)
    iteration = num_of_link + 1;         % Num of iteration
    while (iteration > 1) 
        % CCD Algorthm

        pe = [xdata(num_of_link+1); ydata(num_of_link+1)];          % Get last (8) joint point  *1---*2---*3---*4---*5---*6---*7---*8
        pc = [xdata(iteration-1); ydata(iteration-1)];              % Get the third last (6) joint point

        a = (pe - pc)/norm(pe-pc);                                  % Normalized vector from pc to pe
        b = (pt - pc)/norm(pt-pc);                                  % Normalized vector from pc to pt(target)
        teta = acosd(dot(a, b));                                    % Angle between previous vector in degrees
        
        direction = cross([a(1) a(2) 0],[b(1) b(2) 0]);             % Normal vector to previous vector, how these are in the XY plane, direction is a vector in Z Axis (0 0 z)
        % If negative the negative angle
        if direction(3) < 0                                         
            teta = -teta;
        end
        
        % this part can be omitted, this purpose is to make the result
        % looks more natural
        if (teta > 30)
            teta = 30;
        elseif (teta < -30)
            teta = -30;
        end
        
        angledata(iteration-1) = teta;                              % Copy the calculated angle to angledata

        iteration = iteration - 1;                                  % Reduce iteration by one

        % let's do the rotation!
        for i = 1:num_of_link-1
            R = [cosd(angledata(i)) -sind(angledata(i)); sind(angledata(i)) cosd(angledata(i))]; % rotation matrix
            % p' = R * (p - c) + c
            % Position after rotation
            temp = R * ([xdata(i+1); ydata(i+1)] - [xdata(i); ydata(i)]) + [xdata(i); ydata(i)];
            xdata(i+1) = temp(1);
            ydata(i+1) = temp(2);
            % Update angles of each joint after rotation
            angledata(i+1) = angledata(i+1) + angledata(i);
            xdata(i+2) = xdata(i+1) + buff;
            ydata(i+2) = ydata(i+1);
        end

        % end effector rotation
        i = i+1;
        R = [cosd(angledata(i)) -sind(angledata(i)); sind(angledata(i)) cosd(angledata(i))]; % rotation matrix
        % p' = R * (p - c) + c
        temp = R * ([xdata(i+1); ydata(i+1)] - [xdata(i); ydata(i)]) + [xdata(i); ydata(i)];
        xdata(i+1) = temp(1);
        ydata(i+1) = temp(2);

    end
    % Error between target point and End Effector
    error = dist([xdata(num_of_link+1) ydata(num_of_link+1)], pt);
    disp(error);
    
    plot_CCD(xdata, ydata)
end

hnd = plot(xdata, ydata,'-r', xdata, ydata, 'ob'); %update data to plot  
axis([-11 11 -11 11]) 

disp('done!');

function plot_CCD(xdata, ydata)
    hnd = plot(xdata, ydata,'-r', xdata, ydata, 'ob'); %update data to plot  
    axis([-11 11 -11 11]) 
    pause(1)
    reset(hnd)
