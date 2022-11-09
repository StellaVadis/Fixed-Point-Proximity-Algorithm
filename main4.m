Im_noisy=imread('Noisy Image20.png');
draw=0;
for lambda=[0.15,0.2499]
    for ii=[2,4,6,8,9,10]
        mu=100/ii;
        [PSNR,Ite,Denoised_Image]=FPPAdraw...
        (Images,Im_noisy,draw,lambda,mu);
        PSNR,Ite
        %Save and display the image
        if lambda==0.15
            imwrite(Denoised_Image,[...
            'Denoised Image0.15',...
            num2str(ii),'.png'])
            figure(ii)
            imshow(Denoised_Image,[])
        else
            imwrite(Denoised_Image,['Denoised Image',...
            num2str(ii),'.png'])
            figure(ii+10)
            imshow(Denoised_Image,[])
        end
    end
end