clc;
clear;
close all;

% ��λ
m  = 1e-0;
mm = 1e-3;
um = 1e-6;
nm = 1e-9;

% ��ɫ����
lambda_r = 633*nm;
lambda_g = 520*nm;
lambda_b = 450*nm;

iter_N = 100;    % ��������
Width = 1920;   % ͼ����
Height  = 1080;   % ͼ��߶�
N = 1080; % �߳�
fps = 30; %֡��

MaterialPath = '.\';
fileFolder=fullfile(MaterialPath);
dirOutput=dir(fullfile(fileFolder,'*.png'));
FileList=char({dirOutput.name}'); 
videoName = 'VideoHologram.avi';%��ʾ��Ҫ��������Ƶ�ļ�������

if(exist(videoName, 'file'))   
    delete(videoName);
end

%������Ƶ�Ĳ����趨
aviobj=VideoWriter(videoName);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
aviobj.FrameRate=fps;
open(aviobj);

for i = 1:size(FileList,1)
    disp(i);
    IMG = imread([MaterialPath FileList(i,:)]);
    [R, C, D] = size(IMG);
    IMG = IMG(1:R, C/2-N/2:C/2+N/2, : );
    IMG = imresize(IMG, [N N]);
%-------------------------------------------%
%     IMG = flipud(IMG);    % ͼ�����·�ת
%     IMG = fliplr(IMG);    % ͼ�����ҷ�ת
%-------------------------------------------%    
    Holo = getColorHologram(IMG, lambda_r, lambda_g, lambda_b, iter_N);
    Holo_full = repImage(Holo, Width, Height);
    A = mat2gray(Holo_full);
    writeVideo(aviobj,A);
    writeVideo(aviobj,IMG);
end
close(aviobj);% �رմ�����Ƶ

