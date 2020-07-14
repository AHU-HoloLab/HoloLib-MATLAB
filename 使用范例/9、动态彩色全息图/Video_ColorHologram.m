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
fps = 30; %帧率

MaterialPath = '.\';
fileFolder=fullfile(MaterialPath);
dirOutput=dir(fullfile(fileFolder,'*.png'));
FileList=char({dirOutput.name}'); 
videoName = 'VideoHologram.avi';%表示将要创建的视频文件的名字

if(exist(videoName, 'file'))   
    delete(videoName);
end

%生成视频的参数设定
aviobj=VideoWriter(videoName);  %创建一个avi视频文件对象，开始时其为空
aviobj.FrameRate=fps;
open(aviobj);

for i = 1:size(FileList,1)
    disp(i);
    IMG = imread([MaterialPath FileList(i,:)]);
    [R, C, D] = size(IMG);
    IMG = IMG(1:R, C/2-N/2:C/2+N/2, : );
    IMG = imresize(IMG, [N N]);
%-------------------------------------------%
%     IMG = flipud(IMG);    % 图像上下反转
%     IMG = fliplr(IMG);    % 图像左右反转
%-------------------------------------------%    
    Holo = getColorHologram(IMG, lambda_r, lambda_g, lambda_b, iter_N);
    Holo_full = repImage(Holo, Width, Height);
    A = mat2gray(Holo_full);
    writeVideo(aviobj,A);
    writeVideo(aviobj,IMG);
end
close(aviobj);% 关闭创建视频

