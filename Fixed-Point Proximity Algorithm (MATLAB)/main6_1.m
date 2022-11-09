Images=imread('Cameraman.png');
Im_noisy=imread('Noisy Image20.png');
draw=1;
lambda=0.2499;
mu=100/2;
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);