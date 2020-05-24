function fig = showPhase(varargin)
%相位显示
%   fig = showPhase(P) 显示相位
%   fig = showPhase(P, title) 显示相位，窗口标题
%   
%   P - 相位矩阵
%   title - 窗口标题
%
%   fig - 返回窗口句柄
%

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[data, title, style] = parse_inputs(varargin{:});
data = mod(data, 2*pi);
ang = mat2gray(data);
fig = figure('name', title, 'NumberTitle','off');
imshow(ang, 'border',style,'initialmagnification',100);

end


function [data, title, style] = parse_inputs(varargin)

style = 'loose';

if (nargin < 1 || nargin > 3)
	error('函数参数个数错误');
end

if (nargin == 1)
    data = varargin{1};
    title = 'Phase Image';
end

if (nargin == 2)
    data = varargin{1};
    title = varargin{2};
    
end

if (nargin == 3)
    data = varargin{1};
    title = varargin{2};
    style = varargin{3};
end

end