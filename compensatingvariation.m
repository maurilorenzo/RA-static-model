function epsilon= compensatingvariation(tau1,g1,tau2,g2)
% this function computes the compensating variation of the consumption
% under the 2nd tax policy regime to make the RA indifferent betwewn the 2
% regimes
global alpha rho 
h1=walras(tau1,g1);
w1=mplabor(h1); 
r1=mpcapital(h1); 
lambda1=(1-g1)*w1*h1*tau1;
h2=walras(tau2,g2);
w2=mplabor(h2); 
r2=mpcapital(h2); 
lambda2=(1-g2)*w2*h2*tau2; 
W1= welfarefn(h1,w1,r1,lambda1,tau1); % W1 computes the welfare under the first regime(taxrate=tau)
c2=consumption(h2,w2,r2,lambda2,tau2); % c2 computes the consumption under the second regime(taxrate=tau2)

epsilon=-1+1/c2*((W1-(1-alpha)*log(1-h2))*(1-rho)/alpha)^(1/(1-rho)); % epsilon is the compensating variation
end


