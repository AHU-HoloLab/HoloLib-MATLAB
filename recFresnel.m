function res = recFresnel(varargin)
%迭代菲涅尔计算重构
%   A = recFresnel(P, Lw, Lh, z, lambda) 菲涅尔迭代全息图重构，不显示重构图像
%   A = recFresnel(P, Lw, Lh, z, lambda, flag) 菲涅尔迭代全息图重构，默认标题显示重构图像
%   A = recFresnel(P, Lw, Lh, z, lambda, flag, title) 菲涅尔迭代全息图重构，自定义标题显示重构图像
%
%   P - 相位矩阵
%   Lw - 矩阵宽度
%   Lh - 矩阵高度
%   z - 传播距离
%   lambda - 照明光波长
%   flag - 是否显示标志位
%       - true	显示重构图像
%       - false	不显示重构图像
%   title - 重构图像标题
%
%   A - 重构振幅图
% 

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[data, width_Length, height_Length, z, lambda, show_flag, title] = parse_inputs(varargin{:});

data = mod(data, 2*pi);
I = propDFFT(exp(1j .* data), width_Length, height_Length, lambda, -z);
A = mat2gray(abs(I));
if show_flag
    figure('name', title, 'NumberTitle','off');    
    imshow(A);
end
res = A;

end

% Function parse_inputs
function [data, width_Length, height_Length, z, lambda, show_flag, title] = parse_inputs(varargin)

data = [];
width_Length = 0;
height_Length = 0;
z = 0;
lambda = 0;
show_flag = false;
title = '迭代菲涅尔全息图重构';

if (nargin < 5 || nargin > 7)
	error('函数参数个数错误');
end

if (nargin == 5)
    data = varargin{1};
    width_Length = varargin{2};
    height_Length = varargin{3};
    z = varargin{4};
    lambda = varargin{5};
end

if (nargin == 6)
    data = varargin{1};
    width_Length = varargin{2};
    height_Length = varargin{3};
    z = varargin{4};
    lambda = varargin{5};
    show_flag = varargin{6};
end

if (nargin == 7)
    data = varargin{1};
    width_Length = varargin{2};
    height_Length = varargin{3};
    z = varargin{4};
    lambda = varargin{5};
    show_flag = varargin{6};
    title = varargin{7};
end
end