function We= welfarefn(h,w,r,lambda,tau)
% this function computes the welfare of the representative agent
global alpha rho k
c=w*h*(1-tau)+k*r+lambda;
We=alpha/(1-rho)*(c^(1-rho))+(1-alpha)*log(1-h);
end

