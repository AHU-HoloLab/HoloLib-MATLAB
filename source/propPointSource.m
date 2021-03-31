function U = propPointSource(Ui, Uo, lambda, z)

% (Ui, Uo, lambda, z)

[Ui.m, Ui.n] = size(Ui.data);
[Uo.m, Uo.n] = size(Uo.data);



k = 2*pi / lambda; % ²¨Êý
kethi = linspace(-1./2./Ui.Lw, 1./2./Ui.Lw, Ui.n).* width_Pixel;
nenta = linspace(-1./2./Lh, 1./2./Lh, height_Pixel).* height_Pixel;
[X, Y] = meshgrid(kethi, nenta);

for mp = 1:1:height_Pixel
   for np = 1:1:width_Pixel
       xp 
       yp
        for mi = 1:1:height_Pixel
            for ni = 1:1:width_Pixel
                
            end
        end
   end
end

end
