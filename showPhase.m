function fig = showPhase(varargin)
%��λ��ʾ
%   showPhase(P) ��ʾ��λ
%   showPhase(P, title) ��ʾ��λ�����ڱ���
%   
%   P - ��λ����
%   title - ���ڱ���
%
%   fig - ���ش��ھ��
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-26
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end
[data, title, style] = parse_inputs(varargin{:});
data = mod(data, 2*pi);
ang = mat2gray(data);
fig = figure('name', title, 'NumberTitle','off');
imshow(ang, 'border',style,'initialmagnification',100);

end


function [data, title, style] = parse_inputs(varargin)

style = 'loose';

if (nargin < 1 || nargin > 3)
	error('����������������');
end

if (nargin == 1)
    data = varargin{1};
    title = 'Phase Image';
end

if (nargin == 2)
    data = varargin{1};
    title = varargin{2};
    
end

if (nargin == 3)
    data = varargin{1};
    title = varargin{2};
    style = varargin{3};
end

end