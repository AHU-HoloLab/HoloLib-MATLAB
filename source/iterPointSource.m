function U = iterPointSource(data, Lw, Lh, lambda, z, N_iter)

data = double(data);
[m, n] = size(data);
InitPhase = 2*pi * rand(m, n);
Ui.data = data.*exp(1j*InitPhase);
Ui.m = m;
Ui.n = n;
Ui.Lw = Lw;
Ui.Lh = Lh;

Uo.data = zeros(m, n);
Uo.m = m;
Uo.n = n;
Uo.Lw = Lw;
Uo.Lh = Lh;

for i = 1:1:N_iter
    U = propPointSourceAdvanced(Ui, Uo, lambda, z, false);
    U = ones(m,n) .* exp(1i*angle(U));
    Ui.data = U;
    U = propPointSourceAdvanced(Ui, Uo, lambda, -z, false);
    U = data .* exp(1i*angle(U));
    Ui.data = U;
end

U = wrapTo2Pi(angle(U));

end