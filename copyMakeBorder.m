function res = copyMakeBorder(data, Rows, Cols)
%����ͼ��߽� ����ͼ��������
%	M = copyMakeBorder(A, R, C) ��ͼ��߽�����
%   
%   A - ���������
%   R - ��������
%   C - ��������
%
%   M - ���ص��������
%

[R, C, D] = size(data);
if R > Rows || C > Cols
   error('ͼƬ����'); 
end
if R == Rows && C == Cols
    res = data;
end
if R < Rows && C < Cols
    res = zeros(Rows, Cols, D);
    Pos_r1 = round(Rows/2 - R/2)+1;
    Pos_c1 = round(Cols/2 - C/2)+1;
    Pos_r2 = Pos_r1 + R-1;
    Pos_c2 = Pos_c1 + C-1;
    res(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = data;
end

end