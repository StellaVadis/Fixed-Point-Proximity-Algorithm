Images=imread('Cameraman.png');
Im_noisy=imread('Noisy Image20.png');
draw=0;
PSNRtable=[];
Itetable=[];
for ii=1:10
    mu=100/ii;
    for lambda=0.01:0.01:0.25
        [PSNR,Ite,Denoised_Image]=FPPAdraw...
        (Images,Im_noisy,draw,lambda,mu);
        PSNRtable=[PSNRtable,PSNR];
        Itetable=[Itetable,Ite];
    end
end
PSNRtable=reshape(PSNRtable,25,10);
Itetable=reshape(Itetable,25,10);
figure(1)
h1=heatmap(PSNRtable);
h1.Colormap=bone;
h1.CellLabelFormat='%0.4g';
h1.XLabel='{\mu}^{-1}(x10^{-2})';
h1.YLabel='{\lambda(x10^{-2}})';
figure(2)
h2=heatmap(Itetable);
h2.XLabel='{\mu}^{-1}(x10^{-2})';
h2.YLabel='{\lambda(x10^{-2}})';