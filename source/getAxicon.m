function res_angle = getAxicon(varargin)
%轴锥透镜相位生成
%适用于小焦比情况
%   P = getAxicon(Zg, Lw, Lh, Pw, Ph，lambda) 生成轴锥透镜的相位分布
%   P = getAxicon(Zg, WL, HL, WP, HP，lambda, R) 生成轴锥透镜的相位分布，增加透镜半径参数
%
%   Zg - 焦深，单位：米
%   Lw  - 透镜宽度，单位：米
%   Lh - 透镜高度，单位：米
%   Pw   - 透镜宽度像素数
%   Ph  - 透镜高度像素数
%   lambda  - 入射光波长，单位：米
%   R - 轴锥体半径
%
%   P - 返回的相位分布矩阵
%

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin{:});
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
distance_r = sqrt(X.^2 + Y.^2);
if isempty(R)
    R = max(max(distance_r));
end

phi = - (2*pi/lambda) * distance_r * (R / sqrt(R.^2 + Zg.^2));
res_angle = mod(phi, 2*pi);

end




function [Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin)

if (nargin < 6 || nargin > 7)
	error('函数参数个数错误');
end

if (nargin == 6)
    Zg = varargin{1};
    width_Length = varargin{2};
    height_Length = varargin{3};
    width_Pixel = varargin{4};
    height_Pixel = varargin{5};
    lambda = varargin{6};
    R = [];
end

if (nargin == 7)
    Zg = varargin{1};
    width_Length = varargin{2};
    height_Length = varargin{3};
    width_Pixel = varargin{4};
    height_Pixel = varargin{5};
    lambda = varargin{6};
    R = varargin{7};
end

end