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

IMG_Name = 'an.jpg';
IMG = imread(IMG_Name);
if length(size(IMG)) > 2
	IMG=rgb2gray(IMG);
end
[M,N] = size(IMG);
Lx = N*LCoS_Unit;
Ly = M*LCoS_Unit;
z  = 0.5*m;
f  = 0.5*m;
Zg = 0.1*m;
Niter = 60;
err = 1e-5;
R = 0.01;
% H = iterFourier(IMG, Niter);
PH = load('PH.mat');
H = PH.H;
recFourier(H);
SL = getLens(f, Lx, Ly, N, M, lambda);
AL = getAxilens(f, Zg, Lx, Ly, N, M, lambda, R);
PSL = mod(H+SL, 2*pi);
PAL = mod(H+AL, 2*pi);
% recFourier(H);
% showPhase(AL);
P = propDOE(PAL, z, Lx, Ly, N, M, lambda);
A =mat2gray(abs(P));
imshow(A);
% w = linspace(-Lx/2, Lx/2, N); 
% h = linspace(-Ly/2, Ly/2, M);
% [X, Y] = meshgrid(w, h);
% Rsamp=sqrt(X.^2+Y.^2);
% PPF=pi/(lambda*z).*Rsamp.*Rsamp;
% H = mod(PAL+PPF, 2*pi);
% A = exp(1j*H);
% E = abs(ifft2(A));
% figure('name','ÖØ¹¹');
% imshow(mat2gray(E));




% for i = 1:1:20
%     z = 0.4+i*0.01*m;
%     PPF=pi/(lambda*z).*Rsamp.*Rsamp;
%     H = mod(PSL+PPF, 2*pi);
%     A = exp(1j*H);
%     E = abs(ifft2(A));
%     subplot(1, 20, i);
%     figure('name','·ÆÄù¶ûÍ¸¾µ');
%     imshow(mat2gray(E));
% end
% 
% figure('name','AxilensÍ¸¾µ');
% for i = 1:1:20
%     z = 0.5+i*0.01*m;
%     PPF=pi/(lambda*z).*Rsamp.*Rsamp;
%     H = mod(PAL+PPF, 2*pi);
%     A = exp(1j*H);
%     E = abs(ifft2(A));
% %     subplot(1, 20, i);
% figure;
%     imshow(mat2gray(E),'border','tight','initialmagnification','fit');
% end