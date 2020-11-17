%  功能: (计算全息MATLAB变成模板)
%  作者: XXX
%  通讯: XX@XX.XXX
%  日期: 20XX/XX/XX
%%
clc;
clear;
close all;

m  = 1e-0; % 米
mm = 1e-3; % 毫米
um = 1e-6; % 微米
nm = 1e-9; % 纳米

lambda_red   = 655*nm; % 红光激光器
lambda_green = 532*nm; % 绿光激光器
lambda_blue  = 473*nm; % 蓝光激光器
lambda       = lambda_green;

Unit_Size    = 12*um; % 单元物理尺寸

IMG_Name = 'lena.bmp'; % 输入图像
IMG = imread(IMG_Name);

if length(size(IMG)) > 2 % 灰度化
	IMG=rgb2gray(IMG);
end

[R,C] = size(IMG);
Lw = C*Unit_Size;
Lh = R*Unit_Size;
z  = 0.5*m;

Niter = 60; % 迭代次数
err = 1e-5; % 误差阈值

% Start Your Code