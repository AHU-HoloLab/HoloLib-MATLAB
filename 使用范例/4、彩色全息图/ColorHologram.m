clc;
clear;
close all;

% 单位
m  = 1e-0;
mm = 1e-3;
um = 1e-6;
nm = 1e-9;

% 三色波长
lambda_r = 633*nm;
lambda_g = 520*nm;
lambda_b = 450*nm;

iter_N = 100;    % 迭代次数
Width = 1920;   % 图像宽度
Height  = 1080;   % 图像高度
N = 1080; % 边长

flag = 'leftdown'; % leftup' 'leftdown' 'rightup''rightdown' 'center'

% 图像读入
IMG = imread('.\MonaLisa.jpg');
if length(size(IMG)) ~= 3 
	error('Not Color Image');
end
[R_b, C_b, ~] = size(IMG);
if R_b > Height || C_b > Width
    IMG = imresize(IMG, [N N]);
    [R_b, C_b, ~] = size(IMG);
end

% 图像上下反转
IMG = flipud(IMG);
% 图像左右反转
% IMG = fliplr(IMG);

R_r = round(R_b / (lambda_r/lambda_b));
C_r = round(C_b / (lambda_r/lambda_b));
R_g = round(R_b / (lambda_g/lambda_b));
C_g = round(C_b / (lambda_g/lambda_b));

IMG_r = IMG(:,:,1);
IMG_g = IMG(:,:,2);
IMG_b = IMG(:,:,3);

% 依据波长调整图像大小
IMG_r = imresize(IMG_r, [R_r C_r]);
IMG_g = imresize(IMG_g, [R_g C_g]);
IMG_b = imresize(IMG_b, [R_b C_b]);

% 矩阵补零

%% 红色分量
Channel_r = zeros(N, N);
switch flag
    case 'center'
        Pos_r1 = round(N/2 - R_r/2)+1;
        Pos_c1 = round(N/2 - C_r/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_r + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_r + 1;
    case 'rightdown'
        Pos_r1 = N - R_r + 1;
        Pos_c1 = N - C_r + 1;
end
Pos_r2 = Pos_r1 + R_r-1;
Pos_c2 = Pos_c1 + C_r-1;
Channel_r(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_r;
%% 绿色分量
Channel_g = zeros(N, N);
switch flag
    case 'center'
        Pos_r1 = round(N/2 - R_g/2)+1;
        Pos_c1 = round(N/2 - C_g/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_g + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_g + 1;
    case 'rightdown'
        Pos_r1 = N - R_g + 1;
        Pos_c1 = N - C_g + 1;
end
Pos_r2 = Pos_r1 + R_g-1;
Pos_c2 = Pos_c1 + C_g-1;
Channel_g(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_g;

%% 蓝色分量
Channel_b = zeros(N, N);
switch flag
    case 'center'
        Pos_r1 = round(N/2 - R_b/2)+1;
        Pos_c1 = round(N/2 - C_b/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_b + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_b + 1;
    case 'rightdown'
        Pos_r1 = N - R_b + 1;
        Pos_c1 = N - C_b + 1;
end
Pos_r2 = Pos_r1 + R_b-1;
Pos_c2 = Pos_c1 + C_b-1;
Channel_b(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_b;
%% 

% 迭代傅里叶
Phase_r = iterFourier(Channel_r, iter_N);
Phase_g = iterFourier(Channel_g, iter_N);
Phase_b = iterFourier(Channel_b, iter_N);

Phase_r = mod(Phase_r, 2*pi);
Phase_g = mod(Phase_g, 2*pi);
Phase_b = mod(Phase_b, 2*pi);

Channel_r = mat2gray(Phase_r);
Channel_g = mat2gray(Phase_g);
Channel_b = mat2gray(Phase_b);

Channel_r = repImage(Channel_r, Width, Height);
Channel_g = repImage(Channel_g, Width, Height);
Channel_b = repImage(Channel_b, Width, Height);

H = cat(3, Channel_r, Channel_g, Channel_b);
% Holo = zeros(Height, Width, 3);
% Pos_r1 = round(Height/2 - R_b/2)+1;
% Pos_c1 = round(Width/2 - C_b/2)+1;
% Pos_r2 = Pos_r1 + R_b-1;
% Pos_c2 = Pos_c1 + C_b-1;
% Holo(Pos_r1:Pos_r2, Pos_c1:Pos_c2, :) = H;
Holo = H;

% Channel_r = copyMakeBorder(Channel_r, Width, Height);
% Channel_g = copyMakeBorder(Channel_g, Width, Height);
% Channel_b = copyMakeBorder(Channel_b, Width, Height);

% imwrite(Channel_r, '红色全息图.bmp');
% imwrite(Channel_g, '绿色全息图.bmp');
% imwrite(Channel_b, '蓝色全息图.bmp');
imwrite(Holo, '彩色全息图.bmp');
figure('name', 'Color Hologram'); imshow(Holo);

%% 彩色重构模拟
Re_r = exp(1j .* Phase_r);
Re_r = ifft2(Re_r);
Re_g = exp(1j .* Phase_g);
Re_g = ifft2(Re_g);
Re_b = exp(1j .* Phase_b);
Re_b = ifft2(Re_b);

% Re_r = flipud(Re_r);
% Re_g = flipud(Re_g);
% Re_b = flipud(Re_b);

Channel = mat2gray(abs(Re_r));
Channel = imresize(Channel, [N*lambda_r/lambda_b N*lambda_r/lambda_b]);
[MM, NN] = size(Channel);
switch flag
    case 'center'
        Pos_r1 = round(MM/2 - N/2);
        Pos_c1 = round(NN/2 - N/2);
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = MM - N + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = NN - N + 1;
    case 'rightdown'
        Pos_r1 = MM - N + 1;
        Pos_c1 = N - N + 1;
end
Pos_r2 = Pos_r1 + N - 1;
Pos_c2 = Pos_c1 + N - 1;
Channel_r = Channel(Pos_r1:Pos_r2, Pos_c1:Pos_c2);

Channel = mat2gray(abs(Re_g));
Channel = imresize(Channel, [N*lambda_g/lambda_b N*lambda_g/lambda_b]);
[MM, NN] = size(Channel);
switch flag
    case 'center'
        Pos_r1 = round(MM/2 - N/2);
        Pos_c1 = round(NN/2 - N/2);
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = MM - N + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = NN - N + 1;
    case 'rightdown'
        Pos_r1 = MM - N + 1;
        Pos_c1 = N - N + 1;
end
Pos_r2 = Pos_r1 + N-1;
Pos_c2 = Pos_c1 + N-1;
Channel_g = Channel(Pos_r1:Pos_r2, Pos_c1:Pos_c2);

Channel = Re_b;
Channel_b = mat2gray(abs(Channel));

I = cat(3, Channel_r, Channel_g, Channel_b);
Re_r = cat(3, mat2gray(abs(Re_r)), zeros(N, N), zeros(N, N));
Re_g = cat(3, zeros(N, N), mat2gray(abs(Re_g)), zeros(N, N));
Re_b = cat(3, zeros(N, N), zeros(N, N), mat2gray(abs(Re_b)));
figure('name', '彩色模拟重构');
subplot(221);imshow(Re_r);
subplot(222);imshow(Re_g);
subplot(223);imshow(Re_b);
subplot(224);imshow(flipud(I));
% imwrite(I, '彩色模拟重构.bmp');