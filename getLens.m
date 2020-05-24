function res_angle = getLens(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
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
phi = -1*(k/2/f) * (X.*X + Y.*Y);
C = exp(1j*phi);
res_angle = mod(angle(C), 2*pi);

end