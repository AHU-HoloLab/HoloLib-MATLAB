function res = recFresnel(varargin)
%���������������ع�
%   A = recFresnel(P, Lw, Lh, z, lambda) ����������ȫϢͼ�ع�������ʾ�ع�ͼ��
%   A = recFresnel(P, Lw, Lh, z, lambda, flag) ����������ȫϢͼ�ع���Ĭ�ϱ�����ʾ�ع�ͼ��
%   A = recFresnel(P, Lw, Lh, z, lambda, flag, title) ����������ȫϢͼ�ع����Զ��������ʾ�ع�ͼ��
%
%   P - ��λ����
%   Lw - ������
%   Lh - ����߶�
%   z - ��������
%   lambda - �����Ⲩ��
%   flag - �Ƿ���ʾ��־λ
%       - true	��ʾ�ع�ͼ��
%       - false	����ʾ�ع�ͼ��
%   title - �ع�ͼ�����
%
%   A - �ع����ͼ
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
title = '����������ȫϢͼ�ع�';

if (nargin < 5 || nargin > 7)
	error('����������������');
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