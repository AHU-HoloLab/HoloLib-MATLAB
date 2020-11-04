function ret = getFWHM(varargin)
%��ȡ���ȫ��
%   FWHM = getFWHM(data) 
%   FWHM = getFWHM(data, xaxis) 
%   
%   data  - ��������
%   xaxis - x ������
%       - ������������������ֵ���
%
%   FWHM - ���ȫ��
%
if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[src, xaxis] = parse_inputs(varargin{:});
[rs, cs] = size(src);
[rx, cx] = size(xaxis);
if rs > 1 && rx > 1
    error('���벻��һά����');
end
if cs ~= cx
    error('�������ά�Ȳ�ͬ');
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
	error('����������������');
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