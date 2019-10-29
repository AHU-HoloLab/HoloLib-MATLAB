function U = propTFFT(data, width_Length, height_Length, lambda, z)
%propagation - T-FFT approach(propTFFT) ����������-���θ���Ҷ���㷨����
%   U = propTFFT(A, LW, LH, lambda, z) ������ƽ��A���з��������������ع۲�ƽ�渴����ֲ�
%   A  - M��N������ƽ�����
%   LW - ͼ���ȣ���λ����
%   LH - ͼ��߶ȣ���λ����
%   lambda - ����Ⲩ������λ����
%   z - ����ƽ�浽�۲�ƽ����룬��λ����
% 
%   U - ����ƽ�渴����ֲ�
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

[height_Pixel, width_Pixel] = size(data);
x = linspace(-width_Length/2, width_Length/2, width_Pixel);
y = linspace(-height_Length/2, height_Length/2, height_Pixel);
k = 2*pi / lambda;
[X, Y] = meshgrid(x, y); 
F0 = exp(1j*k*z) / (1j*lambda*z);
F1 = exp(1j*k/2/z*(X.^2+Y.^2));
u1 = fft2(data);
u2 = fft2(F1);
u3 = u1 .* u2;
U = F0 .* fftshift(ifft2(u3));

end