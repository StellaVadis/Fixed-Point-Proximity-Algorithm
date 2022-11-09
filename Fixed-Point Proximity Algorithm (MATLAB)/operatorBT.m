function BTz=operatorBT(z,m,n)
%z is a column vector,with dimension tp be 2d=2*m*n.
%m is the number of rows of pre-vectorized nosiy image
%n is the number of columns of pre-vectorized nosiy image
p=z(1:m*n);
q=z(m*n+1:2*m*n);
P=reshape(p,m,n);
Q=reshape(q,m,n);
%To construct the left-hand-side matrix
IDTp=[];
for i=1:n
    %The following is a procedure that can construct new columns and append
    %it to the original columns
    temp=-diff(P(:,i));
    temp(1)=-P(2,i);
    IDTp=[IDTp;[temp;P(m,i)]];
end
%To construct the right-hand-side matrix
DITq(1:m,1)=-Q(:,2);
for i=2:n-1
    DITq=[DITq;Q(:,i)-Q(:,i+1)];
end
DITq=[DITq;Q(:,n)];
BTz=IDTp+DITq;