Images=imread('Cameraman.png');
imshow(Images,[])
figure(2)
NoiseLevel=20;
sigma=(NoiseLevel*NoiseLevel)/(255*255);
Im_noisy=imnoise(Images,'gaussian',0,sigma);
%Save the noisy image
imwrite(uint8(Im_noisy),'Noisy Image20.png')
imshow(im2double(Im_noisy),[]);
