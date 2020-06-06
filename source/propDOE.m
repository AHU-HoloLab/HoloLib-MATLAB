function U = propDOE(data, z, Lw, Lh, width, height, lambda)
%DOEԪ���������������ͼ��
%   U = propDOE(P, z, Lw, Lh, width, height, lambda)
%   P - ��λͼ
%   z - ����ƽ�浽�۲�ƽ����룬��λ����
%   Lw - ͼ���ȣ���λ����
%   Lh - ͼ��߶ȣ���λ����
%   lambda - ����Ⲩ������λ����
%
%   U - ����ƽ�渴����ֲ�
%

w = linspace(-Lw/2, Lw/2, width); 
h = linspace(-Lh/2, Lh/2, height);
[X, Y] = meshgrid(w, h);
Rsamp = sqrt(X.^2+Y.^2);
PPF = pi / (lambda*z).*Rsamp.*Rsamp;
H = mod(data+PPF, 2*pi);
U = ifft2(exp(1j*H));

end