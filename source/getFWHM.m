function ret = getFWHM(varargin)
%获取半峰全宽
%   FWHM = getFWHM(data) 
%   FWHM = getFWHM(data, xaxis) 
%   
%   data  - 波形数据
%   xaxis - x 轴坐标
%       - 若不给出，则以索引值差返回
%
%   FWHM - 半峰全宽
%
if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[src, xaxis] = parse_inputs(varargin{:});
[rs, cs] = size(src);
[rx, cx] = size(xaxis);
if rs > 1 && rx > 1
    error('输入不是一维矩阵');
end
if cs ~= cx
    error('输入矩阵维度不同');
end

data = mat2gray(src);

[~, I] = max(data);

for i = I:-1:1
   if data(i) < 0.5
       pos1 = i;
       break;
   end
end

for i = I : 1 : cs
   if data(i) < 0.5
       pos2 = i;
       break;
   end
end

ret = xaxis(pos2) - xaxis(pos1);

end

function [src, xaxis] = parse_inputs(varargin)

if (nargin < 1 || nargin > 2)
	error('函数参数个数错误');
end

if (nargin == 1)
    src = varargin{1};
    xaxis = 1:1:size(src, 2);
end

if (nargin == 2)
    src = varargin{1};
    xaxis = varargin{2};
end

end