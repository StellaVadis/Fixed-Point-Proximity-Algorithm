function Bx=operatorB(x,m,n)
%x is a vectorized m*n noisy image with Gaussian noise,where d=m*n.
%m is the number of rows of pre-vectorized nosiy image
%n is the number of columns of pre-vectorized nosiy image
%Reformulate the vector x to a matrix X, since we need the
%columns of X, then it is easier for us to process with a 
%matrix X
X=reshape(x,m,n);
%To construct the upper matrix
IDx=[];
for i=1:n
    IDx=[IDx;[0;diff(X(:,i))]];
end
%To construct the lower matrix
DIx(m,1)=0;
for i=2:n
    DIx=[DIx;X(:,i)-X(:,i-1)];
end
Bx=[IDx;DIx];