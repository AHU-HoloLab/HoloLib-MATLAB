%  功能: 轴锥镜全息图
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

Niter = 60; % 迭代次数
err = 1e-5; % 误差阈值

figure('name', '原始图', 'NumberTitle','off');imshow(IMG);
H = iterFourier(IMG, Niter);
showPhase(H, '傅里叶纯相位全息图');


f = 0.9*m;
Zg = 0.3*m;
AL = getAxilensFR(f, Zg, Lw, Lh, C, R, lambda, 10*mm);
L = getLens(f, Lw, Lh, C, R, lambda);
showPhase(AL, '轴锥镜相位图');
showPhase(L, '镜相位图');
P = mod(H+AL, 2*pi);

z = f-0.2*m : 0.05*m : f+0.5*m;
Cs = 8;
Rs = round(size(z,2)/Cs)+1;
for i = 1:1:size(z, 2)
    U = propDOE(P, z(i), Lw, Lh, C, R, lambda);
    A = mat2gray(abs(U));
    subplot(Rs, Cs, i); 
    imshow(A);
    title(sprintf('z=%0.3fm', z(i)));
end
hold off;

z = 0 : 3*f/(2*C) : 3*f;
section = zeros(R, size(z, 2)-1);
for i = 2:1:size(z, 2)
    U = propDOE(AL, z(i), Lw, Lh, C, R, lambda);
    U = fftshift(U);
    section(:, i) = U(:, C/2);
%     if i == round(f/(3*f/(2*C)))
%         section(:, i) = ones(R, 1)*0.1;
%     end
%     if i == round((f+Zg)/(3*f/(2*C)))
%         section(:, i) = ones(R, 1)*0.1;
%     end
end

CS = mat2gray(abs(section));
figure,imshow(CS);
imwrite(CS, [getenv('UserProfile') '\Desktop\' 'AL.png']);

% showPhase(P, '轴锥镜全息图');
% U = propDOE(P, z, Lw, Lh, C, R, lambda);
% figure('name', sprintf('z=%0.2f处 重构图', z), 'NumberTitle','off');imshow(mat2gray(abs(U)));

% 需要在LCoS上显示 取消以下注释
% MonitorID = 2;
% showLCOS(P, MonitorID, 'multiple ');
% P = repImage(P, 1920, 1080); % LCoS分辨率1920×1080
% savePhase(P, '傅里叶纯相位全息图.bmp');
