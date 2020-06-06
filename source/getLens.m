function res_angle = getLens(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
%������͸����λ����
%   P = getLens(f, Lw, Lh, Pw, Ph��lambda) ��������͸������λ�ֲ�
%
%   f - ͸�����񷽽���
%   Lw  - ͸����ȣ���λ����
%   Lh - ͸���߶ȣ���λ����
%   Pw   - ͸�����������
%   Ph  - ͸���߶�������
%   lambda - ����Ⲩ������λ����
%
%   P - ���ص���λ�ֲ�����
%

k = (2*pi) / lambda;
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
phi = -1*(k/2/f) * (X.*X + Y.*Y);
C = exp(1j*phi);
res_angle = mod(angle(C), 2*pi);

end