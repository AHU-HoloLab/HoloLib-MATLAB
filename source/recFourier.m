function res = recFourier(varargin)
%迭代傅里叶计算重构
%   A = recFourier(P) 傅里叶迭代全息图重构，不显示重构图像
%   A = recFourier(P, flag) 傅里叶迭代全息图重构，默认标题显示重构图像
%   A = recFourier(P, flag, title) 傅里叶迭代全息图重构，自定义标题显示重构图像
%
%   P - 全息图相位矩阵
%   flag - 是否显示标志位
%       - true	显示重构图像
%       - false	不显示重构图像
%   title - 重构图像标题
%
%   A - 返回重构振幅图
% 

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[data, show_flag, title] = parse_inputs(varargin{:});

data = mod(data, 2*pi);
I = fft2(exp(1j .* data));
I = fftshift(I);
A = mat2gray(abs(I));
if show_flag
    figure('name', title, 'NumberTitle','off');
    imshow(A);
end
res = A;

end

% Function parse_inputs
function [data, show_flag, title] = parse_inputs(varargin)

data = [];
show_flag = false;
title = '迭代傅里叶全息图重构';

if (nargin < 1 || nargin > 3)
	error('函数参数个数错误');
end

if (nargin == 1)
    data = varargin{1};
end

if (nargin == 2)
    data = varargin{1};
    show_flag = varargin{2};
end

if (nargin == 3)
    data = varargin{1};
    show_flag = varargin{2};
    title = varargin{3};
end

end