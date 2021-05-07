function c = consumption(h,w,r,lambda,tau)
%   this function computes the level of consumption for any given level of
%   amount of labor (h), real wage(w), capital owned(k), capital rental rate(r)
%   and transfers (lambda)
%   tau is tax rate
global k
c=w*h*(1-tau)+k*r+lambda;
end

