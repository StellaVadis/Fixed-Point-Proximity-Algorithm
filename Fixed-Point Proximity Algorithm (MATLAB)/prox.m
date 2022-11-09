function out=prox(x,lambda,mu)
out=max(abs(x)-mu/lambda,0).*sign(x);
