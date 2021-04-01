function U = propPointSourceAdvanced(Ui, Uo, lambda, z, flag)

[Ui.m, Ui.n] = size(Ui.data);
[Uo.m, Uo.n] = size(Uo.data);

k = 2*pi / lambda; % ²¨Êý
Uix = linspace(-1./2./Ui.Lw, 1./2./Ui.Lw, Ui.n);
Uiy = linspace(-1./2./Ui.Lh, 1./2./Ui.Lh, Ui.m);

Uox = linspace(-1./2./Uo.Lw, 1./2./Uo.Lw, Uo.n);
Uoy = linspace(-1./2./Uo.Lh, 1./2./Uo.Lh, Uo.m);
[Uix, Uiy] = meshgrid(Uix, Uiy);
[Uox, Uoy] = meshgrid(Uox, Uoy);
U = zeros(Uo.m, Uo.n);

AUi = abs(Ui.data);
PUi = wrapTo2Pi(angle(Ui.data));

if flag == true
    handle = waitbar(0,'0 %','Name','Computing...');
end

for om = 1:1:Uo.m
   for on = 1:1:Uo.n
        Ox = Uox(om, on);
        Oy = Uoy(om, on);
        A = 0;
        for im = 1:1:Ui.m
            for in = 1:1:Ui.n
                Ix = Uix(im, in);
                Iy = Uiy(im, in);
                r = sqrt((Ox-Ix).^2 + (Oy-Iy).^2 + z.^2);
                D = AUi(im, in) * exp(1j*k*r)/(1j*lambda*z);
                A = A + D;
            end
        end
        U(om, on) = A;
   end

if flag == true   
    value = om/Uo.m;
    waitbar(om/Uo.m, handle, sprintf('%0.0f %%', value*100));
end

end

if flag == true
    close(handle);
end

Uo.data = U;

end
