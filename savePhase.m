function savePhase(data, dst)
%������λͼ
%   savePhase(P, FILENAME)
%   P - ��λͼ
%   FILENAME - ����ļ�·��
%

data = mod(data, 2*pi);
ang = mat2gray(data);
imwrite(ang, dst);

end