function res = recFresnel(data, width_Length, height_Length, z, lambda)
%迭代菲涅尔计算重构
%   A = recFresnel(P, Lw, Lh, z, lambda)
%   P - 相位矩阵
%   Lw - 矩阵宽度
%   Lh - 矩阵高度
%   z - 传播距离
%   lambda - 照明光波长
%
%   A - 重构振幅图
% 
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

data = mod(data, 2*pi);
I = propDFFT(exp(1j .* data), width_Length, height_Length, lambda, -z);
figure('name', '迭代菲涅尔重构', 'NumberTitle','off');
A = mat2gray(abs(I));
imshow(A);
res = A;

end
