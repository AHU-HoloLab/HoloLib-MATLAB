%  ����: ������ȫϢͼ
%  ����: rlxu
%  ͨѶ: xrlin@ahu.edu.cn
%  ����: 2019/11/08
%%
clc;
clear;
close all;

m  = 1e-0; % ��
mm = 1e-3; % ����
um = 1e-6; % ΢��
nm = 1e-9; % ����

lambda_red   = 655*nm; % ��⼤����
lambda_green = 532*nm; % �̹⼤����
lambda_blue  = 473*nm; % ���⼤����
lambda       = lambda_green;

Unit_Size    = 6*um; % ��Ԫ����ߴ�

IMG_Name = 'lena.bmp'; % ����ͼ��
IMG = imread(IMG_Name);

if length(size(IMG)) > 2 % �ҶȻ�
	IMG=rgb2gray(IMG);
end

[R,C] = size(IMG);
Lw = C*Unit_Size;
Lh = R*Unit_Size;
z  = 0.5*m;

Niter = 60; % ��������
err = 1e-5; % �����ֵ

figure('name', 'ԭʼͼ', 'NumberTitle','off');imshow(IMG);
H = iterFresnel(IMG, Lw, Lh, z, lambda, Niter);
showPhase(H, '����������λȫϢͼ');
Show_Reconstructed_Image = true;    % ��ʾ����
A = recFresnel(H, Lw, Lh, z, lambda, Show_Reconstructed_Image);

% ��Ҫ��LCoS����ʾ ȡ������ע��
% MonitorID = 2;
% showLCOS(H, MonitorID, 'multiple ');
% P = repImage(H, 1920, 1080); % LCoS�ֱ���1920��1080
% savePhase(P, '����������λȫϢͼ.bmp');