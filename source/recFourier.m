function res = recFourier(varargin)
%��������Ҷ�����ع�
%   A = recFourier(P) ����Ҷ����ȫϢͼ�ع�������ʾ�ع�ͼ��
%   A = recFourier(P, flag) ����Ҷ����ȫϢͼ�ع���Ĭ�ϱ�����ʾ�ع�ͼ��
%   A = recFourier(P, flag, title) ����Ҷ����ȫϢͼ�ع����Զ��������ʾ�ع�ͼ��
%
%   P - ȫϢͼ��λ����
%   flag - �Ƿ���ʾ��־λ
%       - true	��ʾ�ع�ͼ��
%       - false	����ʾ�ع�ͼ��
%   title - �ع�ͼ�����
%
%   A - �����ع����ͼ
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
title = '��������ҶȫϢͼ�ع�';

if (nargin < 1 || nargin > 3)
	error('����������������');
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