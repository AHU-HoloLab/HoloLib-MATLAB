clc;
clear;
close all;

m  = 1e-0;
mm = 1e-3;
um = 1e-6;
nm = 1e-9;

lambda_red   = 655*nm;
lambda_green = 532*nm;
lambda_blue  = 473*nm;
lambda    = 532.8*nm;
Unit = 5*um;

IMG_Name = 'an.jpg';
IMG = imread(IMG_Name);
if length(size(IMG)) > 2
	IMG=rgb2gray(IMG);
end
% IMG = imresize(IMG, [1080 1920]);
[M,N] = size(IMG);
M = 4096;
N = 4096;
Lx = N*Unit;
Ly = M*Unit;
z  = 0.1*m;
f  = 0.1*m;
Zg = 0.1*m;
Niter = 100;
err = 1e-5;
NStep = 40;

% H = iterFourier(IMG, Niter);
% [P, I] = stepPhase(H, NStep);
% recFourier(P);
% savePhase(P, 'an.bmp');

FL = getLens(f, Lx, Ly, N, M, lambda);
FL = stepPhase(FL, NStep);
% recFourier(FL);
savePhase(FL, 'Lens.bmp');
showPhase(FL, '·ÆÄù¶ûÍ¸¾µ');

% AL = getAxilens(f, Zg, Lx, Ly, N, M, lambda);
% AL = stepPhase(AL, NStep);
% % recFourier(AL);
% savePhase(AL, 'Öá×¶Í¸¾µ.bmp');
% showPhase(AL, 'Öá×¶Í¸¾µ');