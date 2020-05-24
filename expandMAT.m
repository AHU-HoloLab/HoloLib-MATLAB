function res = expandMAT(data, R_multiple, C_multiple, ex_style)
%矩阵扩展
%   M = expandMAT(A, RM, CM, ex_style) 对矩阵A进行行向和列向扩展
%
%   A  - R×C的矩阵
%   RM - 行向扩展倍数
%   CM - 列向扩展倍数
%   ex_style - 扩展方式  两种方式
%       'pixel' - 单个像素扩展为宏像素
%       'overll'- 整体做复制拼接扩展 实现repmat函数功能
%
%   M - 返回的扩展矩阵
%

[R, C] = size(data);
switch ex_style
    case 'pixel'
        for i = 1 : R
            tmp((i-1)*R_multiple+1:i*R_multiple,:) = repmat(data(i,:),R_multiple,1);
        end
        for i = 1 : C
            res(:,(i-1)*C_multiple+1:i*C_multiple) = repmat(tmp(:,i),1,C_multiple);
        end
    case 'overall'
        res = repmat(data, R_multiple, C_multiple);
    otherwise
        for i = 1 : R
            tmp((i-1)*R_multiple+1:i*R_multiple,:) = repmat(data(i,:),R_multiple,1);
        end
        for i = 1 : C
            res(:,(i-1)*C_multiple+1:i*C_multiple) = repmat(tmp(:,i),1,C_multiple);
        end    
end

end
