%  ����: ��ԴȫϢͼ
%  ����: rlxu
%  ͨѶ: xrlin@ahu.edu.cn
%  ����: 2021/04/01
%%
clc;
clear;
close all;

m  = 1e-0; % ��
mm = 1e-3; % ����
um = 1e-6; % ΢��
nm = 1e-9; % ����

lambda       = 532*nm;

Unit_Size    = 10*um; % ��Ԫ����ߴ�

IMG_Name = 'E:/50.png'; % ����ͼ��
IMG = imread(IMG_Name);

if length(size(IMG)) > 2 % �ҶȻ�
	IMG=rgb2gray(IMG);
end

[R,C] = size(IMG);
Lw = C*Unit_Size;
Lh = R*Unit_Size;
z  = 3*mm;
 
Niter = 60; % ��������
err = 1e-5; % �����ֵ

U = mat2gray(double(IMG));
A1 = propPointSource(U, Lw, Lh, lambda, z, true);
A2 = propDFFT(U, Lw, Lh, lambda, z);
% A = propPointSource(A, Lw, Lh, lambda, -z, true);
E1 = mat2gray(abs(A1));
E2 = mat2gray(abs(A2));
figure;imshow(E1);
figure;imshow(E2);



