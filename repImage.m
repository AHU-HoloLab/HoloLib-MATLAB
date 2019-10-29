function res = repImage(data, width, height)
%图像重复拼接
%   M = repImage(A, width, height)
%   A - 拼接矩阵
%   width - 宽度
%   height - 高度
%
%   M - 输出width × height分辨率图像
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University
[R, C] = size(data);
if R > height || C > width
    error('图片过大'); 
end
M = round(height / R) + 1;
N = round(width / C) + 1;
tmp = repmat(data, M, N);
res = tmp(1:height, 1:width);

end