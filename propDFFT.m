function U = propDFFT(data, width_Length, height_Length, lambda, z)
%propagation - D-FFT approach(propDFFT) ����������-���θ���Ҷ���㷨����
%   U = propDFFT(A, Lw, Lh, lambda, z) ������ƽ��A���з��������������ع۲�ƽ�渴����ֲ�
%   A  - M��N������ƽ�����
%   Lw - ͼ���ȣ���λ����
%   Lh - ͼ��߶ȣ���λ����
%   lambda - ����Ⲩ������λ����
%   z - ����ƽ�浽�۲�ƽ����룬��λ����
%
%   U - ����ƽ�渴����ֲ�
% 

[height_Pixel, width_Pixel] = size(data);
k = 2*pi / lambda;
kethi = linspace(-1./2./width_Length, 1./2./width_Length, width_Pixel).* width_Pixel;
nenta = linspace(-1./2./height_Length, 1./2./height_Length, height_Pixel).* height_Pixel;
[kethi, nenta] = meshgrid(kethi, nenta);
phi = k*z .* (1-lambda.^2.*(kethi.^2 + nenta.^2)./2);
H = exp(1j*phi);
F = fft2(data);
Fuf = F.*H;
U = ifft2(Fuf);

end

