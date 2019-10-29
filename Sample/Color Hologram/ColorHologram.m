clc;
clear;
close all;

% 单位
m  = 1e-0;
mm = 1e-3;
um = 1e-6;
nm = 1e-9;

% 三色波长
lambda_r = 638*nm;
lambda_g = 520*nm;
lambda_b = 450*nm;

iter_N = 100;    % 迭代次数
Width = 1920;   % 图像宽度
High  = 1080;   % 图像高度

% 图像读入
IMG = imread('Philips PM5544.JPG');
if length(size(IMG)) ~= 3 
	error('Not Color Image');
end
[R_b, C_b, ~] = size(IMG);
if R_b > High || C_b > Width
    IMG = imresize(IMG, [High Width]);
    [R_b, C_b, ~] = size(IMG);
end
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
Channel_r = zeros(High, Width);
Pos_r1 = round(High/2 - R_r/2)+1;
Pos_c1 = round(Width/2 - C_r/2)+1;
Pos_r2 = Pos_r1 + R_r-1;
Pos_c2 = Pos_c1 + C_r-1;
Channel_r(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_r;

Channel_g = zeros(High, Width);
Pos_r1 = round(High/2 - R_g/2)+1;
Pos_c1 = round(Width/2 - C_g/2)+1;
Pos_r2 = Pos_r1 + R_g-1;
Pos_c2 = Pos_c1 + C_g-1;
Channel_g(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_g;

Channel_b = zeros(High, Width);
Pos_r1 = round(High/2 - R_b/2)+1;
Pos_c1 = round(Width/2 - C_b/2)+1;
Pos_r2 = Pos_r1 + R_b-1;
Pos_c2 = Pos_c1 + C_b-1;
Channel_b(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_b;

% IFTA
Phase_r = iterFourier(Channel_r, iter_N);
Phase_g = iterFourier(Channel_g, iter_N);
Phase_b = iterFourier(Channel_b, iter_N);

Phase_r = mod(Phase_r, 2*pi);
Phase_g = mod(Phase_g, 2*pi);
Phase_b = mod(Phase_b, 2*pi);

Channel_r = mat2gray(Phase_r);
Channel_g = mat2gray(Phase_g);
Channel_b = mat2gray(Phase_b);

Holo = cat(3, Channel_r, Channel_g, Channel_b);
imwrite(Channel_r, 'RedHologram.bmp');
imwrite(Channel_g, 'GreenHologram.bmp');
imwrite(Channel_b, 'BlueHologram.bmp');
imwrite(Holo, 'ColorHologram.bmp');
figure('name', 'Color Hologram'); imshow(Holo);

%% 彩色重构模拟
Re_r = exp(1j .* Phase_r);
Re_r = ifft2(Re_r);
Re_g = exp(1j .* Phase_g);
Re_g = ifft2(Re_g);
Re_b = exp(1j .* Phase_b);
Re_b = ifft2(Re_b);

Channel = mat2gray(abs(Re_r));
Channel = imresize(Channel, [High*lambda_r/lambda_b Width*lambda_r/lambda_b]);
[M, N] = size(Channel);
Pos_r1 = round(M/2 - High/2)+1;
Pos_c1 = round(N/2 - Width/2)+1;
Pos_r2 = Pos_r1 + High-1;
Pos_c2 = Pos_c1 + Width-1;
Channel_r = Channel(Pos_r1:Pos_r2, Pos_c1:Pos_c2);

Channel = mat2gray(abs(Re_g));
Channel = imresize(Channel, [High*lambda_g/lambda_b Width*lambda_g/lambda_b]);
[M, N] = size(Channel);
Pos_r1 = round(M/2 - High/2)+1;
Pos_c1 = round(N/2 - Width/2)+1;
Pos_r2 = Pos_r1 + High-1;
Pos_c2 = Pos_c1 + Width-1;
Channel_g = Channel(Pos_r1:Pos_r2, Pos_c1:Pos_c2);

Channel = Re_b;
Channel_b = mat2gray(abs(Channel));

I = cat(3, Channel_r, Channel_g, Channel_b);
Re_r = cat(3, mat2gray(abs(Re_r)), zeros(High, Width), zeros(High, Width));
Re_g = cat(3, zeros(High, Width), mat2gray(abs(Re_g)), zeros(High, Width));
Re_b = cat(3, zeros(High, Width), zeros(High, Width), mat2gray(abs(Re_b)));
figure('name', '彩色模拟重构');
subplot(221);imshow(Re_r);
subplot(222);imshow(Re_g);
subplot(223);imshow(Re_b);
subplot(224);imshow(I);
imwrite(I, 'ReColorHologram.bmp');