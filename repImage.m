function res = repImage(data, width, height)
%图像重复拼接
%   M = repImage(A, W, H)
%   A - 拼接矩阵
%   Pw - 宽度分辨率
%   Ph - 高度分辨率
%
%   M - 输出 Pw×Ph 分辨率图像
%

[R, C] = size(data);
if R > height || C > width
    error('图片过大'); 
end
M = round(height / R) + 1;
N = round(width / C) + 1;
tmp = repmat(data, M, N);
res = tmp(1:height, 1:width);

end