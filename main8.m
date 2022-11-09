%Initialisation of parameters
NoiseLevel=20;
sigma=(NoiseLevel*NoiseLevel)/(255*255);
draw=0;
mu=100/6;
lambda=0.2499;
%Cameraman
Images=imread('Cameraman.png');
Im_noisy=imnoise(Images,'gaussian',0,sigma);
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);
figure(1)
imwrite(Im_noisy,'Noisy_Cameraman.png')
imwrite(Denoised_Image,'Denoised_Cameraman.png')
subplot(1,3,1)
imshow(Images)
title('Original Image')
subplot(1,3,2)
imshow(Im_noisy)
title('Noisy Image')
subplot(1,3,3)
imshow(Denoised_Image)
title('Denoised Image')
%Lena
Images=imread('Lena.png');
Im_noisy=imnoise(Images,'gaussian',0,sigma);
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);
figure(2)
imwrite(Im_noisy,'Noisy_Lena.png')
imwrite(Denoised_Image,'Denoised_Lena.png')
subplot(1,3,1)
imshow(Images)
title('Original Image')
subplot(1,3,2)
imshow(Im_noisy)
title('Noisy Image')
subplot(1,3,3)
imshow(Denoised_Image)
title('Denoised Image')
%Pepper
Images=imread('Pepper.png');
Im_noisy=imnoise(Images,'gaussian',0,sigma);
[PSNR,Ite,Denoised_Image]=FPPAdraw...
(Images,Im_noisy,draw,lambda,mu);
figure(3)
imwrite(Im_noisy,'Noisy_Pepper.png')
imwrite(Denoised_Image,'Denoised_Pepper.png')
subplot(1,3,1)
imshow(Images)
title('Original Image')
subplot(1,3,2)
imshow(Im_noisy)
title('Noisy Image')
subplot(1,3,3)
imshow(Denoised_Image)
title('Denoised Image')