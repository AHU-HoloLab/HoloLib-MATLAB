%  ����: ������͸��ȫϢͼ
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

Unit_Size    = 12*um; % ��Ԫ����ߴ�

IMG_Name = 'guang.bmp'; % ����ͼ��
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
H = iterFourier(IMG, Niter);
showPhase(H, '����Ҷ����λȫϢͼ');


f = 0.3*m;
L = getLens(f, Lw, Lh, C, R, lambda);
% L = getLens(0.3, 5e-3, 5e-3, 512, 512, 532e-9);
showPhase(L, '������͸����λͼ');
P = mod(H+L, 2*pi);
figure('name', '�ع�ͼ��', 'NumberTitle', 'off');
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


% ��Ҫ��LCoS����ʾ ȡ������ע��
% MonitorID = 2;
% showLCOS(P, MonitorID, 'multiple ');
% P = repImage(P, 1920, 1080); % LCoS�ֱ���1920��1080
% savePhase(P, '����Ҷ����λȫϢͼ.bmp');