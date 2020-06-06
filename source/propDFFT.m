function U = propDFFT(data, Lw, Lh, lambda, z)
%propagation - D-FFT approach(propDFFT) 菲涅尔传播-两次傅里叶计算法方法
%   U = propDFFT(A, Lw, Lh, lambda, z) 对衍射平面A进行菲涅尔传播，返回观察平面复振幅分布
%   A  - M×N的衍射平面矩阵
%   Lw - 图像宽度，单位：米
%   Lh - 图像高度，单位：米
%   lambda - 入射光波长，单位：米
%   z - 衍射平面到观察平面距离，单位：米
%
%   U - 返回平面复振幅分布
% 

[height_Pixel, width_Pixel] = size(data);
k = 2*pi / lambda;
kethi = linspace(-1./2./Lw, 1./2./Lw, width_Pixel).* width_Pixel;
nenta = linspace(-1./2./Lh, 1./2./Lh, height_Pixel).* height_Pixel;
[kethi, nenta] = meshgrid(kethi, nenta);
phi = k*z .* (1-lambda.^2.*(kethi.^2 + nenta.^2)./2);
H = exp(1j*phi);
F = fft2(data);
Fuf = F.*H;
U = ifft2(Fuf);

end

