%  ����: (����ȫϢMATLAB���ģ��)
%  ����: XXX
%  ͨѶ: XX@XX.XXX
%  ����: 20XX/XX/XX
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

Unit_Size    = 12*um; % ��Ԫ����ߴ�

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

% Start Your Code