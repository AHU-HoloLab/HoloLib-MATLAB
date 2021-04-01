%  功能: 点源全息图
%  作者: rlxu
%  通讯: xrlin@ahu.edu.cn
%  日期: 2021/04/01
%%
clc;
clear;
close all;

m  = 1e-0; % 米
mm = 1e-3; % 毫米
um = 1e-6; % 微米
nm = 1e-9; % 纳米

lambda       = 532*nm;

Unit_Size    = 10*um; % 单元物理尺寸

IMG_Name = 'E:/50.png'; % 输入图像
IMG = imread(IMG_Name);

if length(size(IMG)) > 2 % 灰度化
	IMG=rgb2gray(IMG);
end

[R,C] = size(IMG);
Lw = C*Unit_Size;
Lh = R*Unit_Size;
z  = 3*mm;
 
Niter = 60; % 迭代次数
err = 1e-5; % 误差阈值

U = mat2gray(double(IMG));
A1 = propPointSource(U, Lw, Lh, lambda, z, true);
A2 = propDFFT(U, Lw, Lh, lambda, z);
% A = propPointSource(A, Lw, Lh, lambda, -z, true);
E1 = mat2gray(abs(A1));
E2 = mat2gray(abs(A2));
figure;imshow(E1);
figure;imshow(E2);



