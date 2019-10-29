function res_angle = getLens(f, width_Length, height_Length, width_Pixel, height_Pixel, lambda)
%球面透镜相位生成
%   P = getLens(f, WL, HL, W, L，lambda) 生成球面透镜的相位分布
%
%   f - 透镜的像方焦距
%   width_Length  - 透镜宽度，单位：米
%   height_Length - 透镜高度，单位：米
%   width_Pixel   - 透镜宽度像素数
%   height_Pixel  - 透镜高度像素数
%   lambda - 入射光波长，单位：米
%
%   P - 返回的相位分布矩阵
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