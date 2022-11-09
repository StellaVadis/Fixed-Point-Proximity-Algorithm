Images=imread('Cameraman.png');
Im_noisy=imread('Noisy Image20.png');
draw=1;
lambda=0.15;
mu=100/8;
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);