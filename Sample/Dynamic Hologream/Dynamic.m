clc;
clear;
close all;

MaterialPath = './Car/';
fileFolder=fullfile(MaterialPath);
dirOutput=dir(fullfile(fileFolder,'*.png'));
FileList=char({dirOutput.name}');
N = 100;

videoName = 'Car.avi';%��ʾ��Ҫ��������Ƶ�ļ�������
fps = 15; %֡��
startFrame = 1; %����һ֡��ʼ
endFrame = size(FileList,1); %��һ֡����
Width = 1280;
Hight = 1024;

if(exist('videoName','file'))   
    delete videoName.avi
end

%������Ƶ�Ĳ����趨
aviobj=VideoWriter(videoName);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
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
close(aviobj);% �رմ�����Ƶ