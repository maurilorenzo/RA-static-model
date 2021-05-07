function mbl = mblabor(h,tau,g)
% this function returns the marginal benefit of labor for any given amount
% of labor h
% w is the wage, tau is the percenatage tax on labor,  r is the rental rent of capital and
% lambda is the governement transfers
% g is the fraction of gov revenues used to fund public spending
% alfa and rho are parameters of the utility function
global k rho alpha 
w=mplabor(h);
r=mpcapital(h);
lambda=(1-g)*tau*mplabor(h)*h;
mbl = alpha*(w*h+k*r+lambda)^(-rho)*w*(1-tau);
end

