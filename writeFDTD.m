function writeFDTD(data, FILENAME)
%FDTD Solutions �����ļ����ݵ���
%   writeFDTD(P, FILENAME) ����������Pд�뵽FILENAME�ļ�
%   FILENAME�ļ�����FDTD Solutions�����ļ��ű���Ϊ��������
%   
%   data ��stepPhase�������ɵ�Index�������ݾ���
%   FILENAME ������ļ�ȫ�� Ӧ����·�����ļ���
%

if isa(data, 'uint8') == false
    error('������������');
end

% ��������ļ���
tmpName = getRandomStr();
% Ϊ���ٴ�ȡ�ٶ��Ƚ����ݴ����ϵͳ��ʱ�ļ���
fid = fopen([getenv('TMP') '\' tmpName '.tmp'], 'w');
[R, C] = size(data);
fprintf(fid, 'Index Value\n');
fprintf(fid, '%d %d\n', R, C);
i = 1;
for r = R:-1:1
	for c = 1:1:C
		fprintf(fid,'%d %d\n', i, data(r, c));
		i = i + 1;
	end
end
fclose(fid);
% �������ƶ���ָ��λ
movefile([getenv('TMP') '\' tmpName '.tmp'], [FILENAME '.dat']); 

end


function s = getRandomStr()
x=['0':'9' 'a':'z','A':'Z'];
i=ceil(62*rand(1,16));
s=x(i(1:8));
s=strcat(s,datestr(now,'mmmmddyyyyHHMMSSFFF'));
s=strcat(s,x(i(9:16)));
end