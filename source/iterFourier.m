function res_angle = iterFourier(varargin)
%IFTA Iterative Fourier Transform Algorithm 迭代傅里叶算法
%   H = iterFourier(A) 对图像A进行30次FFT迭代运算，返回纯相位矩阵
%   H = iterFourier(A, N) 对图像A进行N次FFT迭代运算，返回纯相位矩阵
%   H = iterFourier(A, N, ERR) 对图像A进行N次FFF迭代运算，返回纯相位矩阵
%   当误差小于设定值ERR 则结束迭代
%
%   A - M×N的灰度图矩阵
%   N - 是迭代次数
%   ERR - 是误差阈值
%
%   H - 返回全息图相位
%

if nargin > 0
    [varargin{:}] = convertStringsToChars(varargin{:});
end

[data, n_iter, err] = parse_inputs(varargin{:});

if (isempty(err))
        err = 0;
end

data = double(data);
[heigh_Pixel, width_Pixel] = size(data);
I = data ./ max(max(data));
InitPhase = -pi + (pi + pi) * rand(heigh_Pixel, width_Pixel);
I1 = I .* exp(1j * InitPhase);
avg1=mean(mean(abs(I1)));
handle = waitbar(0,'0 %','Name','Computing...');
for n = 1 : 1 : n_iter
    H = fft2(I1);
    I2 = ifft2(exp(1j .* angle(H)));
    avg2=mean(mean(abs(I2)));
    I2=(I2./avg2).*avg1;
    rmse = (mean(mean((abs(I2)-abs(I)).^2)))^0.5;
    if (rmse <= err)
            break;
    end
     I1 = fftshift(I) .* exp(1j .* angle(I2));
    value = n/n_iter;
    waitbar(n/n_iter, handle, sprintf('%0.0f %%', value*100));
end
close(handle);
res_angle = mod(angle(H), 2*pi);

end

% Function parse_inputs
function [data, n_iter, err] = parse_inputs(varargin)

data = [];
n_iter = 30;
err = 0.0;

if (nargin < 1 || nargin > 4)
	error('函数参数个数错误');
end

if (size(varargin{1}, 3) > 1)
	error('输入不是灰度图像');
end

if (nargin == 1)
    data = varargin{1};
end

if (nargin == 2)
    data = varargin{1};
    n_iter = varargin{2};
end

if (nargin == 3)
    data = varargin{1};
    n_iter = varargin{2};
    err = varargin{3};
end

end
