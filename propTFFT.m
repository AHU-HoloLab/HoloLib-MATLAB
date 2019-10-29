function U = propTFFT(data, width_Length, height_Length, lambda, z)
%propagation - T-FFT approach(propTFFT) 菲涅尔传播-三次傅里叶计算法方法
%   U = propTFFT(A, LW, LH, lambda, z) 对衍射平面A进行菲涅尔传播，返回观察平面复振幅分布
%   A  - M×N的衍射平面矩阵
%   LW - 图像宽度，单位：米
%   LH - 图像高度，单位：米
%   lambda - 入射光波长，单位：米
%   z - 衍射平面到观察平面距离，单位：米
% 
%   U - 返回平面复振幅分布
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