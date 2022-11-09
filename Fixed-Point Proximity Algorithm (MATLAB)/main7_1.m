Images=imread('Cameraman.png');
Im_noisy=imread('Noisy Image20.png');
draw=0;
PSNRtable=[];
Itetable=[];
for ii=1:10
mu=100/ii;
for lambda=0.01:0.03:0.25
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);
PSNRtable=[PSNRtable,PSNR];
Itetable=[Itetable,Ite];
end
end
PSNRtable=reshape(PSNRtable,9,10);
Itetable=reshape(Itetable,9,10);
figure(1)
h1=heatmap(PSNRtable);
h1.Colormap=bone;
h1.CellLabelFormat='%0.4g';
h1.XLabel='{\mu}^{-1}';
h1.YLabel='{\lambda}';  h1.Title='PSNR';
h1.XDisplayLabels={'0.01','0.02','0.03','0.04','0.05','0.06','0.07','0.08','0.09','0.1'};
h1.YDisplayLabels={'0.01','0.04','0.07','0.1','0.13','0.16','0.19','0.22','0.25'};
figure(2)
h2=heatmap(Itetable);
h2.XLabel='{\mu}^{-1}';
h2.YLabel='{\lambda}';   h2.Title='Ite';
h1.XDisplayLabels={'0.01','0.02','0.03','0.04','0.05','0.06','0.07','0.08','0.09','0.1'};
h2.YDisplayLabels={'0.01','0.04','0.07','0.1','0.13','0.16','0.19','0.22','0.25'};