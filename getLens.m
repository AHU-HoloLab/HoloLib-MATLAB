function res_angle = getLens(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
%����͸����λ����
%   P = getLens(f, WL, HL, W, L��lambda) ��������͸������λ�ֲ�
%
%   f - ͸�����񷽽���
%   width_Length  - ͸����ȣ���λ����
%   height_Length - ͸���߶ȣ���λ����
%   width_Pixel   - ͸�����������
%   height_Pixel  - ͸���߶�������
%   lambda - ����Ⲩ������λ����
%
%   P - ���ص���λ�ֲ�����
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-19
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

k = (2*pi) / lambda;
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
C = exp(-1j*(k/2/f) * (X.^2 + Y .^2));
res_angle = mod(angle(C), 2*pi);

end