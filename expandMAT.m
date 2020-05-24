function res = expandMAT(data, R_multiple, C_multiple, ex_style)
%������չ
%   M = expandMAT(A, RM, CM, ex_style) �Ծ���A���������������չ
%
%   A  - R��C�ľ���
%   RM - ������չ����
%   CM - ������չ����
%   ex_style - ��չ��ʽ  ���ַ�ʽ
%       'pixel' - ����������չΪ������
%       'overll'- ����������ƴ����չ ʵ��repmat��������
%
%   M - ���ص���չ����
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
