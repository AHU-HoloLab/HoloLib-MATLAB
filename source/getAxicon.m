function res_angle = getAxicon(varargin)
%��׶͸����λ����
%������С�������
%   P = getAxicon(Zg, Lw, Lh, Pw, Ph��lambda) ������׶͸������λ�ֲ�
%   P = getAxicon(Zg, WL, HL, WP, HP��lambda, R) ������׶͸������λ�ֲ�������͸���뾶����
%
%   Zg - �����λ����
%   Lw  - ͸����ȣ���λ����
%   Lh - ͸���߶ȣ���λ����
%   Pw   - ͸�����������
%   Ph  - ͸���߶�������
%   lambda  - ����Ⲩ������λ����
%   R - ��׶��뾶
%
%   P - ���ص���λ�ֲ�����
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
	error('����������������');
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