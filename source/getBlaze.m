function res_angle = getBlaze(varargin)
%闪耀光栅相位分布
%   P = getBlaze(R, C, T, ori) 生成闪耀光栅相位分布图
%   P = getBlaze([R C], T, ori) 
%   
%   R - 矩阵行数
%   C - 矩阵列数
%   T - 闪耀光栅周期
%   ori - 闪耀方向
%       - 'up'          上
%       - 'down'        下
%       - 'left'        左
%       - 'right'       右
%       - 'leftup'      左上
%       - 'leftdown'    左下
%       - 'rightup'     右上
%       - 'rightdown'   右下
%
%   P - 返回的相位分布矩阵
%

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[Rows, Cols, T, ori] = parse_inputs(varargin{:});


switch ori
    case 'up',       x_axis =  1; y_axis =  0;
    case 'down',     x_axis = -1; y_axis =  0;
    case 'left',     x_axis =  0; y_axis =  1;
    case 'right',    x_axis =  0; y_axis = -1;
    case 'leftup',   x_axis =  1; y_axis =  1;
    case 'leftdown', x_axis = -1; y_axis =  1;
    case 'rightup',  x_axis =  1; y_axis = -1;
    case 'rightdown',x_axis = -1; y_axis = -1;
    otherwise,       x_axis =  0; y_axis =  0;
end
fi = zeros(Rows, Cols);
for r = 1:Rows
    for c = 1:Cols
        Equ = (-abs(x_axis)) * r + (-abs(y_axis)) * c;
        fi(r, c) = ( mod(Equ, T) );%得到闪耀光栅的表达式
    end
end

if x_axis == 1
    fi = flipud(fi);
end

if y_axis == 1
    fi = fliplr(fi);
end

fi = fi * 2*pi/T;
fi = mod(fi,2*pi);
res_angle = wrapTo2Pi(fi);
% res_angle = fi;

end




% Function parse_inputs
function [Rows, Cols, T, ori] = parse_inputs(varargin)

Rows = 0;
Cols = 0;
T = 0;
ori = '';

if (nargin < 3 || nargin > 4)
	error('函数参数个数错误');
end


if (nargin == 3)
    Rows = varargin{1}(1,1);
    Cols = varargin{1}(1,2);
    T = varargin{2};
    ori = varargin{3};
end

if (nargin == 4)
    Rows = varargin{1};
    Cols = varargin{2};
    T = varargin{3};
    ori = varargin{4};
end



end
