function writeFDTD(data, FILENAME)
%FDTD Solutions 仿真文件数据导出
%   writeFDTD(P, FILENAME) 将索引矩阵P写入到FILENAME文件
%   FILENAME文件将被FDTD Solutions仿真文件脚本作为数据输入
%   
%   data 是stepPhase函数生成的Index索引数据矩阵
%   FILENAME 是输出文件全名 应包含路径和文件名
%

if isa(data, 'uint8') == false
    error('不是索引矩阵');
end

% 生成随机文件名
tmpName = getRandomStr();
% 为加速存取速度先将数据存放在系统临时文件夹
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
% 将数据移动到指定位
movefile([getenv('TMP') '\' tmpName '.tmp'], [FILENAME '.dat']); 

end


function s = getRandomStr()
x=['0':'9' 'a':'z','A':'Z'];
i=ceil(62*rand(1,16));
s=x(i(1:8));
s=strcat(s,datestr(now,'mmmmddyyyyHHMMSSFFF'));
s=strcat(s,x(i(9:16)));
end