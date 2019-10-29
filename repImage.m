function res = repImage(data, width, height)
%ͼ���ظ�ƴ��
%   M = repImage(A, width, height)
%   A - ƴ�Ӿ���
%   width - ���
%   height - �߶�
%
%   M - ���width �� height�ֱ���ͼ��
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University
[R, C] = size(data);
if R > height || C > width
    error('ͼƬ����'); 
end
M = round(height / R) + 1;
N = round(width / C) + 1;
tmp = repmat(data, M, N);
res = tmp(1:height, 1:width);

end