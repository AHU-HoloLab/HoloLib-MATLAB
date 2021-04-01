function U = propPointSource(data, Lw, Lh, lambda, z, flag)

[m, n] = size(data);
Ui.data = data;
Ui.m = m;
Ui.n = n;
Ui.Lw = Lw;
Ui.Lh = Lh;

Uo.data = zeros(m, n);
Uo.m = m;
Uo.n = n;
Uo.Lw = Lw;
Uo.Lh = Lh;

U = propPointSourceAdvanced(Ui, Uo, lambda, z, flag);

end