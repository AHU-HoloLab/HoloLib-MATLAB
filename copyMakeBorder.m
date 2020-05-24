function res = copyMakeBorder(data, Rows, Cols)
%À©³äÍ¼Ïñ±ß½ç ³¬¹ýÍ¼ÏñÇøÓò²¹Áã
%	M = copyMakeBorder(A, R, C) ½«Í¼Ïñ±ß½çÀ©³ä
%   
%   A - ´ý´¦Àí¾ØÕó
%   R - À©³äÐÐÊý
%   C - À©³äÁÐÊý
%
%   M - ·µ»ØµÄÀ©³ä¾ØÕó
%

[R, C, D] = size(data);
if R > Rows || C > Cols
   error('Í¼Æ¬¹ý´ó'); 
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