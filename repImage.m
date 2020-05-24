function res = repImage(data, width, height)
%ͼ���ظ�ƴ��
%   M = repImage(A, W, H)
%   A - ƴ�Ӿ���
%   Pw - ��ȷֱ���
%   Ph - �߶ȷֱ���
%
%   M - ��� Pw��Ph �ֱ���ͼ��
%

[R, C] = size(data);
if R > height || C > width
    error('ͼƬ����'); 
end
M = round(height / R) + 1;
N = round(width / C) + 1;
tmp = repmat(data, M, N);
res = tmp(1:height, 1:width);

end