function res = recFresnel(data, width_Length, height_Length, z, lambda)
%���������������ع�
%   A = recFresnel(P, Lw, Lh, z, lambda)
%   P - ��λ����
%   Lw - ������
%   Lh - ����߶�
%   z - ��������
%   lambda - �����Ⲩ��
%
%   A - �ع����ͼ
% 
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

data = mod(data, 2*pi);
I = propDFFT(exp(1j .* data), width_Length, height_Length, lambda, -z);
figure('name', '�����������ع�', 'NumberTitle','off');
A = mat2gray(abs(I));
imshow(A);
res = A;

end
