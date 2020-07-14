function ColorMatPhase = getColorHologram(varargin)
%获取彩色傅里叶全息图相位
%   P = getColorHologram(A, R, G, B) 
%   P = getColorHologram(A, R, G, B, N) 
%   P = getColorHologram(A, R, G, B, N, T_Align)
%
%   A - M×N×3的彩色图矩阵
%   R - 红色波长，单位：米
%   G - 绿色波长，单位：米
%   B - 蓝色波长，单位：米
%   N - 迭代次数
%   T_Align   - 对齐方式（非最终成像位置）
%
%   P - 返回M×N×3的彩色三维相位分布矩阵
%

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[data, lambda_r, lambda_g, lambda_b, n_iter, Type_Align] = parse_inputs(varargin{:});

% 依据波长调整图像大小
[R_b, C_b, ~] = size(data);

if R_b > C_b
    N = R_b;
else
    N = C_b;
end

R_r = round(R_b / (lambda_r/lambda_b));
C_r = round(C_b / (lambda_r/lambda_b));
R_g = round(R_b / (lambda_g/lambda_b));
C_g = round(C_b / (lambda_g/lambda_b));

IMG_r = data(:,:,1);
IMG_g = data(:,:,2);
IMG_b = data(:,:,3);

IMG_r = imresize(IMG_r, [R_r C_r]);
IMG_g = imresize(IMG_g, [R_g C_g]);
IMG_b = imresize(IMG_b, [R_b C_b]);

%% 红色分量
Channel_r = zeros(N, N);
switch Type_Align
    case 'center'
        Pos_r1 = round(N/2 - R_r/2)+1;
        Pos_c1 = round(N/2 - C_r/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_r + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_r + 1;
    case 'rightdown'
        Pos_r1 = N - R_r + 1;
        Pos_c1 = N - C_r + 1;
end
Pos_r2 = Pos_r1 + R_r-1;
Pos_c2 = Pos_c1 + C_r-1;
Channel_r(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_r;
%% 绿色分量
Channel_g = zeros(N, N);
switch Type_Align
    case 'center'
        Pos_r1 = round(N/2 - R_g/2)+1;
        Pos_c1 = round(N/2 - C_g/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_g + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_g + 1;
    case 'rightdown'
        Pos_r1 = N - R_g + 1;
        Pos_c1 = N - C_g + 1;
end
Pos_r2 = Pos_r1 + R_g-1;
Pos_c2 = Pos_c1 + C_g-1;
Channel_g(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_g;

%% 蓝色分量
Channel_b = zeros(N, N);
switch Type_Align
    case 'center'
        Pos_r1 = round(N/2 - R_b/2)+1;
        Pos_c1 = round(N/2 - C_b/2)+1;
    case 'leftup'
        Pos_r1 = 1;
        Pos_c1 = 1; 
    case 'leftdown'
        Pos_r1 = N - R_b + 1;
        Pos_c1 = 1;
    case 'rightup'
        Pos_r1 = 1;
        Pos_c1 = N - C_b + 1;
    case 'rightdown'
        Pos_r1 = N - R_b + 1;
        Pos_c1 = N - C_b + 1;
end
Pos_r2 = Pos_r1 + R_b-1;
Pos_c2 = Pos_c1 + C_b-1;
Channel_b(Pos_r1:Pos_r2, Pos_c1:Pos_c2) = IMG_b;

% 迭代傅里叶
Phase_r = iterFourier(Channel_r, n_iter);
Phase_g = iterFourier(Channel_g, n_iter);
Phase_b = iterFourier(Channel_b, n_iter);

Phase_r = mod(Phase_r, 2*pi);
Phase_g = mod(Phase_g, 2*pi);
Phase_b = mod(Phase_b, 2*pi);

ColorMatPhase = cat(3, Phase_r, Phase_g, Phase_b);

end

% Function parse_inputs
function [data, lambda_r, lambda_g, lambda_b, n_iter, Type_Align] = parse_inputs(varargin)

data = [];
n_iter = 60;
lambda_r = 633*1e-6;
lambda_g = 520*1e-6;
lambda_b = 450*1e-6;
Type_Align = 'leftdown';

if (nargin < 4 || nargin > 6)
	error('函数参数个数错误');
end

if (size(varargin{1}, 3) ~= 3)
	error('输入不是彩色图像');
end

if (nargin == 4)
    data = varargin{1};
    lambda_r = varargin{2};
    lambda_g = varargin{3};
    lambda_b = varargin{4};
end

if (nargin == 5)
    data = varargin{1};
    lambda_r = varargin{2};
    lambda_g = varargin{3};
    lambda_b = varargin{4};
    n_iter = varargin{5};
end

if (nargin == 6)
    data = varargin{1};
    lambda_r = varargin{2};
    lambda_g = varargin{3};
    lambda_b = varargin{4};
    n_iter = varargin{5};
    Type_Align = varargin{6};
end

end