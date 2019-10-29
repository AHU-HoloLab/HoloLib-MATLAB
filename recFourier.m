function res = recFourier(data)
%��������Ҷ�����ع�
%   A = recFourier(P) ����Ҷ����ȫϢͼ�ع�
%   P - ȫϢͼ��λ����
%
%   A - �ع����ͼ
% 
%   Author Information
%   -----------------------
%   Author : rlxu
%   Update Date : 2019-10-15
%
%   Copyright 2019 Key Laboratory of ICSP Anhui University

data = mod(data, 2*pi);
I = ifft2(exp(1j .* data));
A = mat2gray(abs(I));
figure('name', '��������Ҷ�ع�', 'NumberTitle','off');
imshow(A);
res = A;

end
