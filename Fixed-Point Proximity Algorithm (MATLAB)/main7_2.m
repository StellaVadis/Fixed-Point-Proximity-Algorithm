format long g
for lambda=0.05:0.05:0.25
for ii=2:2:10
    mu=100/ii;
    v=double(Im_noisy(:));
    m=size(Im_noisy,1);
    n=size(Im_noisy,2);
    y=operatorB(v,m,n);
    ulast=v-lambda*operatorBT(operatorB(v,m,n),m,n);
    for k=1:2000
        z=operatorB(v,m,n)+y-lambda*operatorB...
        (operatorBT(y,m,n),m,n);
        y=z-prox(z,lambda,mu);
        u=double(v-lambda*operatorBT(y,m,n));
        NRMSE(k)=norm(u-double(Images(:)),2)/...
        norm(double(Images(:)),2);
        NRE(k)=norm(u-ulast,2)/norm(u,2);
        f(k)=0.5*(norm(u-v,2))^2+mu*norm...
        (operatorB(u,m,n),1);
        ulast=u;
        if NRE(k)<0.9*10^(-3)
        break
        end
    end
    [lambda,ii/100,f(k),f(k)/255^2,NRMSE(k)]
end
end