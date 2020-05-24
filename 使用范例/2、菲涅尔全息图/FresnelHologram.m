%  功能: 菲涅尔全息图
%  作者: rlxu
%  通讯: xrlin@ahu.edu.cn
%  日期: 2019/11/08
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

Unit_Size    = 6*um; % 单元物理尺寸

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

figure('name', '原始图', 'NumberTitle','off');imshow(IMG);
H = iterFresnel(IMG, Lw, Lh, z, lambda, Niter);
showPhase(H, '菲涅尔纯相位全息图');
Show_Reconstructed_Image = true;    % 显示开关
A = recFresnel(H, Lw, Lh, z, lambda, Show_Reconstructed_Image);

% 需要在LCoS上显示 取消以下注释
% MonitorID = 2;
% showLCOS(H, MonitorID, 'multiple ');
% P = repImage(H, 1920, 1080); % LCoS分辨率1920×1080
% savePhase(P, '菲涅尔纯相位全息图.bmp');