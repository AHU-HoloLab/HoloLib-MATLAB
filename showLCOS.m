function showLCOS(varargin)
%����λͼ��ʾָ����Ļ��
% ע��: �Ƚ���ʾ�����ú�,�ٴ�MATLAB
%	showLCOS(P, ID) ����λ������ʾ��ָ����ʾ����
%   
%   P - ��λ����
%   MonitorID - ��ʾ��ID��
%   disp_style - ��ʾ��ʽ
%       - single ��λͼ�����ظ���������Χ���㣬���������ʵ�
%       - multiple ��λͼ�ظ�������ȫ��Ļ�����������ʸ�
%   
%   MATLAB��Windows API��Ļ����ϵ��ͬ
%   MATLAB����ϵԭ��Ϊ���½ǣ���ʼ����(1, 1)
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
	error('����������������');
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
