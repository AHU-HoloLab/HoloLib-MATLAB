clc;
clear;
close all;

m  = 1e-0;
mm = 1e-3;
um = 1e-6;
nm = 1e-9;

% 输入路径
IMG_Path = '';
IMG_Name = 'F16';
IMG_Type = '.BMP';

% 输出路径
Data_Path = IMG_Path;
Data_Name = IMG_Name;
Data_Type = '.dat';
IMG = imread([IMG_Path IMG_Name IMG_Type]);
if length(size(IMG)) > 2
	IMG=rgb2gray(IMG);
end
[M,N] = size(IMG);

Lx = 12*um*N;
Ly = 12*um*M;
z  = 0.5*m;
lambda = 532.8 * nm;

Niter = 100;
err = 1e-5;
NStep = 4;
M = 4;
T = M;

I = fftshift(IMG);
H = iterFourier(I, Niter);
H = expandMAT(H, M, M, 'pixel');
B = getBlaze(size(H), T, 'up'); % 叠加向上闪耀光栅
P = mod(B+H, 2*pi);
A = recFourier(P);
A = ifftshift(A);
imshow(A);
[~, D] = stepPhase(P, NStep);
writeFDTD(D, [Data_Path Data_Name Data_Type]);
% 之后在FDTD Solutions中运行FDTD_Build.lsf