function [psnr,k,Denoised_Image]=FPPAdraw(Images,Im_noisy,draw,lambda,mu)
%Input 1: If we do not have original images,then 
%input []. Else input the original Images 
%Input 2: Input the noisy images
%Input 3: If you want to draw the pictures, then
%input 1. Else input 0.
%Input 4: lambda
%Input 5: mu
%Output 1: PSNR
%Output 2: Iteration times
%Output 3: Denoised Image
format long g
%Vectorize the Im_noisy matrix and convert it to double
v=double(Im_noisy(:));
m=size(Im_noisy,1);
n=size(Im_noisy,2);
%Initialize y0 and u0
y=operatorB(v,m,n);
ulast=v-lambda*operatorBT(operatorB(v,m,n),m,n);
%This is the first terminal condition, maximum iteration
%times limitation, if k>2000, then the algorithm terminates
for k=1:2000
z=operatorB(v,m,n)+y-lambda*operatorB...
    (operatorBT(y,m,n),m,n);
y=z-prox(z,lambda,mu);
u=double(v-lambda*operatorBT(y,m,n)); 
if (~isempty(Images))
    NRMSE(k)=norm(u-double(Images(:)),2)/...
    norm(double(Images(:)),2);
end
NRE(k)=norm(u-ulast,2)/norm(u,2);
f(k)=0.5*(norm(u-v,2))^2+mu*norm...
    (operatorB(u,m,n),1);
ulast=u;
%NRE is the second terminal condition, if NRE is less than
% 0.9*10^(-3), then break out the loop
if NRE(k)<0.9*10^(-3)
    break
end
end
Denoised_Image=uint8(reshape(u,m,n));

if (draw==1)&&(~isempty(Images))
    subplot(1,3,1)
    imshow((Images),[]);
    title('Original image')
    A=(double(Images(:))-u)/255;
    psnr=20/log(10)*(log(255)-log(norm(A,2)));
elseif (draw==0)&&(~isempty(Images))
    A=(double(Images(:))-u)/255;
    psnr=20/log(10)*(log(255)-log(norm(A,2)));
else
    psnr=('PSNR does not exists without Original Image');
end

if (draw==1)
    Im_noisy=double(Im_noisy); 
    subplot(1,3,2)
    imshow(im2double(Im_noisy),[]);
    title('Nosiy image')
    subplot(1,3,3)
    imshow(reshape(u,m,n),[])
    title('Denoised imaged')
end

if (draw==1)&&(~isempty(Images))
    figure(3)
    plot(NRMSE(1:k),'Color',[48 151 164]/255)
    title('NRMSE')
    xlabel('Iteration times')
end

if (draw==1)
    figure(2)
    plot(f(1:k),'Color',[0,70,222]/255)
    title('Objective value [0,255]')
    xlabel('Iteration times')
    figure(4)
    plot(f(1:k)/(255^2),'Color',[0,70,222]/255)
    title('Objective value [0,1]')
    xlabel('Iteration times')
    figure(5)
    plot(NRE(1:k),'r')
    title('NRE')
    xlabel('Iteration times')
end