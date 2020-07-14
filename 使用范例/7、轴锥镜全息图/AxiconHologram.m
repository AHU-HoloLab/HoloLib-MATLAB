%  ����: ��׶��ȫϢͼ
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

Niter = 60; % ��������
err = 1e-5; % �����ֵ

figure('name', 'ԭʼͼ', 'NumberTitle','off');imshow(IMG);
H = iterFourier(IMG, Niter);
showPhase(H, '����Ҷ����λȫϢͼ');


f = 0.9*m;
Zg = 0.3*m;
AL = getAxilensFR(f, Zg, Lw, Lh, C, R, lambda, 10*mm);
L = getLens(f, Lw, Lh, C, R, lambda);
showPhase(AL, '��׶����λͼ');
showPhase(L, '����λͼ');
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

% showPhase(P, '��׶��ȫϢͼ');
% U = propDOE(P, z, Lw, Lh, C, R, lambda);
% figure('name', sprintf('z=%0.2f�� �ع�ͼ', z), 'NumberTitle','off');imshow(mat2gray(abs(U)));

% ��Ҫ��LCoS����ʾ ȡ������ע��
% MonitorID = 2;
% showLCOS(P, MonitorID, 'multiple ');
% P = repImage(P, 1920, 1080); % LCoS�ֱ���1920��1080
% savePhase(P, '����Ҷ����λȫϢͼ.bmp');
