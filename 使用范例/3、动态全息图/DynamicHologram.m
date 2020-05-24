clc;
clear;
close all;

MaterialPath = './Car/';
fileFolder=fullfile(MaterialPath);
dirOutput=dir(fullfile(fileFolder,'*.png'));
FileList=char({dirOutput.name}');
N = 100;

videoName = 'Car.avi';%表示将要创建的视频文件的名字
fps = 15; %帧率
startFrame = 1; %从哪一帧开始
endFrame = size(FileList,1); %哪一帧结束
Width = 1280;
Hight = 1024;

if(exist('videoName','file'))   
    delete videoName.avi
end

%生成视频的参数设定
aviobj=VideoWriter(videoName);  %创建一个avi视频文件对象，开始时其为空
aviobj.FrameRate=fps;
open(aviobj);%Open file for writing video data

for i = 1:size(FileList,1)
    i
    IMG = imread([MaterialPath FileList(i,:)]);
    if length(size(IMG)) > 2
        IMG=rgb2gray(IMG);
    end
    H = iterFourier(IMG, N);
    H = repImage(H, Width, Hight);
    A = mat2gray(abs(H));
    writeVideo(aviobj,A);
    % savePhase(H, [int2str(i) '.png']); 
end
close(aviobj);% 关闭创建视频