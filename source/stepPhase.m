function varargout = stepPhase(data, step_n)
%相位分阶函数
%   [Phase] = stepPhase(P, N) 对连续相位分布P进行N阶分阶, 返回[0 2*pi]相位值
%   [Phase, Index] = stepPhase(P, N) 返回[0 2*pi]相位值和索引值
%   [Phase, Index, Table] =  返回[0 2*pi]相位值  索引值  分阶表
%   P 是M×N相位矩阵，取值范围(0, 2*pi)
%

[M, N] = size(data);
Index = zeros(M, N);
Phase = zeros(M, N);
mid_value = zeros(1, step_n-1);
data = mod(data, 2*pi);
Step_Table = (0 : 2*pi / (step_n) : 2*pi);
for i = 1:1:step_n
    mid_value(i) = (Step_Table(i) + Step_Table(i+1)) / 2;
end

for r = 1:1:M
    for c = 1:1:N
        for i = 1:1:step_n
            if (Step_Table(i) <= data(r, c) && data(r, c) <= Step_Table(i+1))
                Index(r, c) = i;
                Phase(r, c) = mid_value(i);
            end
        end
    end
end

varargout{1} = Phase;
varargout{2} = uint8(Index);
varargout{3} = Step_Table;

end
