Images=imread('Cameraman.png');
Im_noisy=imread('Noisy Image20.png');
subplot(2,2,1)
imshow((Images),[]);
title('Original image')
subplot(2,2,2)
imshow(Im_noisy)
title('Noisy Image')
subplot(2,2,3)
imshow('Denoised Image6.png')
title('Denoised Image,{\lambda}=0.2499,\mu^{-1}=0.06')
subplot(2,2,4)
imshow('Denoised Image0.156.png')
title('Denoised Image,{\lambda}=0.15,\mu^{-1}=0.06')