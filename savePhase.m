function savePhase(data, dst)
%保存相位图
%   savePhase(P, FILENAME)
%   P - 相位图
%   FILENAME - 输出文件路径
%
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

data = mod(data, 2*pi);
ang = mat2gray(data);
imwrite(ang, dst);

end