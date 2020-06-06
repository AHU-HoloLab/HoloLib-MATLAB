%  功能: 菲涅尔透镜全息图
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

Unit_Size    = 12*um; % 单元物理尺寸

IMG_Name = 'guang.bmp'; % 输入图像
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
H = iterFourier(IMG, Niter);
showPhase(H, '傅里叶纯相位全息图');


f = 0.3*m;
L = getLens(f, Lw, Lh, C, R, lambda);
% L = getLens(0.3, 5e-3, 5e-3, 512, 512, 532e-9);
showPhase(L, '菲涅尔透镜相位图');
P = mod(H+L, 2*pi);
figure('name', '重构图像', 'NumberTitle', 'off');
U = propDOE(L, f+50*mm, Lw, Lh, C, R, lambda);
A = mat2gray(abs(U));
imshow(A);
% hold on;
% 
% z = 0.3*m : 0.02*m : 0.7*m;
% Cs = 8;
% Rs = round(size(z,2)/Cs)+1;
% for i = 1:1:size(z, 2)
%     U = propDOE(P, z(i), Lw, Lh, C, R, lambda);
%     A = mat2gray(abs(U));
%     subplot(Rs, Cs, i); 
%     imshow(A);
%     title(sprintf('z=%0.2fm', z(i)));
% end
% hold off;


% 需要在LCoS上显示 取消以下注释
% MonitorID = 2;
% showLCOS(P, MonitorID, 'multiple ');
% P = repImage(P, 1920, 1080); % LCoS分辨率1920×1080
% savePhase(P, '傅里叶纯相位全息图.bmp');