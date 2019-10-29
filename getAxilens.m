function res_angle = getAxilens(varargin)
%轴锥透镜相位生成
%   P = getAxilens(f, WL, HL, W, L，lambda) 生成球面透镜的相位分布
%   
%   f - f 和 Zg 标定了轴锥体的焦距的范围，在 f0到 f0+Zg之间
%   Zg - 焦深
%   width_Length  - 透镜宽度，单位：米
%   height_Length - 透镜高度，单位：米
%   width_Pixel   - 透镜宽度像素数
%   height_Pixel  - 透镜高度像素数
%   lambda  - 入射光波长，单位：米
%   R - 轴锥体半径
%
%   P - 返回的相位分布矩阵
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-27
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University
if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[f, Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin{:});
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
distance_r = sqrt(X.^2 + Y.^2);
if isempty(R)
    R = max(max(distance_r));
end
phase_fenzi = (pi/lambda) * (distance_r .^2);
phase_fenmu = f + (Zg / R) * (distance_r .^ 1);
res_angle = -phase_fenzi ./ phase_fenmu;

end




function [f, Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin)

if (nargin < 7 || nargin > 8)
	error('函数参数个数错误');
end

if (nargin == 7)
    f = varargin{1};
    Zg = varargin{2};
    width_Length = varargin{3};
    height_Length = varargin{4};
    width_Pixel = varargin{5};
    height_Pixel = varargin{6};
    lambda = varargin{7};
    R = [];
end

if (nargin == 8)
    f = varargin{1};
    Zg = varargin{2};
    width_Length = varargin{3};
    height_Length = varargin{4};
    width_Pixel = varargin{5};
    height_Pixel = varargin{6};
    lambda = varargin{7};
    R = varargin{8};
end

end