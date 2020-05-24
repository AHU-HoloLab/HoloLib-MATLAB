function savePhase(data, dst)
%保存相位图
%   savePhase(P, FILENAME)
%   P - 相位图
%   FILENAME - 输出文件路径
%

data = mod(data, 2*pi);
ang = mat2gray(data);
imwrite(ang, dst);

end