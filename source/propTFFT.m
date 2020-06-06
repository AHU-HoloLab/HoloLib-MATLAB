function U = propTFFT(data, Lw, Lh, lambda, z)
%propagation - T-FFT approach(propTFFT) ����������-���θ���Ҷ���㷨����
%   U = propTFFT(A, Lw, Lh, lambda, z) ������ƽ��A���з��������������ع۲�ƽ�渴����ֲ�
%   A  - M��N������ƽ�����
%   Lw - ͼ���ȣ���λ����
%   Lh - ͼ��߶ȣ���λ����
%   lambda - ����Ⲩ������λ����
%   z - ����ƽ�浽�۲�ƽ����룬��λ����
% 
%   U - ����ƽ�渴����ֲ�
%

[height_Pixel, width_Pixel] = size(data);
x = linspace(-Lw/2, Lw/2, width_Pixel);
y = linspace(-Lh/2, Lh/2, height_Pixel);
k = 2*pi / lambda;
[X, Y] = meshgrid(x, y); 
F0 = exp(1j*k*z) / (1j*lambda*z);
F1 = exp(1j*k/2/z*(X.^2+Y.^2));
u1 = fft2(data);
u2 = fft2(F1);
u3 = u1 .* u2;
U = F0 .* fftshift(ifft2(u3));

end