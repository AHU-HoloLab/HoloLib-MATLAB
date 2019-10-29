function savePhase(data, dst)
%������λͼ
%   savePhase(P, FILENAME)
%   P - ��λͼ
%   FILENAME - ����ļ�·��
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