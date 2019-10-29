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
LCoS_Unit = 12*um;

IMG_Name = 'lena.bmp';
IMG = imread(IMG_Name);
if length(size(IMG)) > 2
	IMG=rgb2gray(IMG);
end
[M,N] = size(IMG);
Lx = N*LCoS_Unit*um;
Ly = M*LCoS_Unit*um;
z  = 0.5*m;

Niter = 60;
err = 1e-5;