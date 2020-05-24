function res_angle = getAxilens(varargin)
%��׶͸����λ����
%   P = getAxilens(f, Zg, Lw, Lh, Pw, Ph��lambda) ������׶͸������λ�ֲ�
%   P = getAxilens(f, Zg, WL, HL, WP, HP��lambda, R) ������׶͸������λ�ֲ�������͸���뾶����
%
%   f - f �� Zg �궨����׶��Ľ���ķ�Χ���� f0�� f0+Zg֮��
%   Zg - ����
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
[f, Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin{:});
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
distance_r = sqrt(X.^2 + Y.^2);
if isempty(R)
    R = max(max(distance_r));
end
phase_fenzi = (pi/lambda) * (distance_r .^2);
phase_fenmu = f + (Zg / R^2) * (distance_r .^ 2);
res_angle = -phase_fenzi ./ phase_fenmu;

end




function [f, Zg, width_Length, height_Length, width_Pixel, height_Pixel, lambda, R] = parse_inputs(varargin)

if (nargin < 7 || nargin > 8)
	error('����������������');
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