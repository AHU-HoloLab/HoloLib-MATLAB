function showLCOS(varargin)
%将相位图显示指定屏幕上
% 注意: 先将显示器配置好,再打开MATLAB
%	showLCOS(P, ID) 将相位矩阵，显示在指定显示器上
%   
%   P - 相位矩阵
%   MonitorID - 显示器ID号
%   disp_style - 显示方式
%       - single 相位图不做重复，对其周围补零，像素利用率低
%       - multiple 相位图重复，铺满全屏幕，像素利用率高
%   
%   MATLAB与Windows API屏幕坐标系不同
%   MATLAB坐标系原点为左下角，开始坐标(1, 1)
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-26
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[data, MonitorID, disp_style] = parse_inputs(varargin{:});

screeninfo = get(0, 'MonitorPositions');
left = screeninfo(MonitorID, 1);
bottom = screeninfo(MonitorID, 2);
width = screeninfo(MonitorID, 3);
height = screeninfo(MonitorID, 4);
switch disp_style
    case 'single'
        data = copyMakeBorder(data, height, width);
    case 'multiple'
        data = repImage(data, width, height);
    otherwise
        data = copyMakeBorder(data, height, width);
end

fig = showPhase(data, 'LCOS', 'tight');
fig.WindowState = 'fullscreen';   
fig.MenuBar = 'none';
fig.Color = 'k';
fig.ToolBar = 'none';
fig.Position = [left bottom width height];
end

% Function parse_inputs
function [data, MonitorID, disp_style] = parse_inputs(varargin)

data = [];
MonitorID = 1;
disp_style = 'single';

if (nargin < 2 || nargin > 3)
	error('函数参数个数错误');
end

if (nargin == 2)
    data = varargin{1};
    MonitorID = varargin{2};
end

if (nargin == 3)
    data = varargin{1};
    MonitorID = varargin{2};
    disp_style = varargin{3};
end

end
