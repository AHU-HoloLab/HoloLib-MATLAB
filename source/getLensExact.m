function res_angle = getLensExact(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
%菲涅尔透镜相位生成
%   P = getLens(f, Lw, Lh, Pw, Ph，lambda) 生成球面透镜的相位分布
%
%   f - 透镜的像方焦距
%   Lw  - 透镜宽度，单位：米
%   Lh - 透镜高度，单位：米
%   Pw   - 透镜宽度像素数
%   Ph  - 透镜高度像素数
%   lambda - 入射光波长，单位：米
%
%   P - 返回的相位分布矩阵
%

k = (2*pi) / lambda;
w = linspace(-width_Length/2, width_Length/2, width_Pixel); 
h = linspace(-height_Length/2, height_Length/2, height_Pixel);
[X, Y] = meshgrid(w, h);
phi = - k * (sqrt(X.^2 + Y.^2 + f.^2) - f); % 为什么是负值: 提前要倒退的距离(相位延迟)
C = exp(1j*phi);
res_angle = mod(phi, 2*pi);

end