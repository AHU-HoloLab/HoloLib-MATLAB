function res = recFourier(data)
%迭代傅里叶计算重构
%   A = recFourier(P) 傅里叶迭代全息图重构
%   P - 全息图相位矩阵
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
I = ifft2(exp(1j .* data));
A = mat2gray(abs(I));
figure('name', '迭代傅里叶重构', 'NumberTitle','off');
imshow(A);
res = A;

end
