function res_angle = getLensExact(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
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
phi = - k * (sqrt(X.^2 + Y.^2 + f.^2) - f); % Ϊʲô�Ǹ�ֵ: ��ǰҪ���˵ľ���(��λ�ӳ�)
C = exp(1j*phi);
res_angle = mod(phi, 2*pi);

end