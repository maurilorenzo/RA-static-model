function W= welfarefnmin(h,w,r,lambda,t)
% this function computes the welfare of the representative agent and change
% its sign to apply fminbnd
global alpha rho k
W=alpha/(1-rho)*((w*h*(1-t)+k*r+lambda)^(1-rho))+(1-alpha)*log(1-h);
W=-W;%switch the sign of the function for the minimization 
end
