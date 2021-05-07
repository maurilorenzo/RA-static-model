% Gift for Americans

% this script replicates the effect of the program "Gift for Americans"
% since it is assumed that increasing taxes won't affect labor supply,
% taxes have to be doubled in order to double the transfers
% the prediction will be tested with our general equilibrium model

% execute GE.m first

global alpha rho hmin hmax omega k hguess itmax 
alpha = 0.4;
rho = 1.01;
hmin=0;
hmax=0.9999;
% production function
omega= 0.3;
k=1;
% government
% public expenditures
g2=0;
% taxation
tau1 = 0.3;
% set the new tax rate
tau2=tau1*2;


% walras algorithm 
% set the maximum number of iterations
itmax=1000;
% set an initial guess
hguess=0.5;
% solve for labor supply with the new tax level
hstar2=walras(tau2,g2);
% compute the new levels of the wage, the rental rate, the transfers, the
% GDP,the consumption and the wealfare
wstar2=mplabor(hstar2);
rstar2=mpcapital(hstar2);
lambdastar2=(1-g2)*wstar2*hstar2*tau2;
outputproduced2=output(hstar2);
welfare2=welfarefn(hstar,wstar2,rstar2,lambdastar2,tau2);
consumptionstar2=consumption(hstar2,wstar2,rstar2,lambdastar2,tau2);

% check if the assumption of the polititian is correct
if hstar2==hstar % the increase of the tax rate did not affect the labor supply
    display("Gift for Americans is feasible")
    display("the increase in the tax rate did not distort the labor supply")
elseif hstar2>hstar % this command is included just for the sake of completeness even though it is improbable that the labour supply increase when taxes are increased
    display("the new fiscal regime has incentivated labor")
else % the increase of the tax rate disincentivated the labor supply
    display("the new fiscal regime has disincetivated the labor supply")
    
end

if lambdastar2<lambdastar*2 % check if the comittee was right
    display("doubling the tax rate, the transfers do not double")
    display("the new level of transfers is")
    display(lambdastar2)
else
   display("doubling taxes. the transfers double")
end   

display("the new equilibrium will be the following")
display("new labor supply")
display([hstar2])
display("new GDP")
display([outputproduced2])
display("new consumption")
display([consumptionstar2])
% the consumption should be equal to the GDP (all the resources produced are consumed when g=0)

% compute the compensating variation of the consumption under the 2nd tax policy regime to make the RA indifferent betwewn the 2 regimes
epsilon=compensatingvariation(tau1,g1,tau2,g2);
display("the compensating variation is")
display(epsilon)
% check if the change improve the wealfare of the imdividuals
if epsilon>0 % the consumer is worse off under the new regime and have to compensated to be indifferent
    display("the 2nd regime makes the individuals worse off")
elseif epsilon==0
    display("the 2 regimes are equilavent in term of utility")
else 
    display("the 2nd regime makes the individuals better off")
end


% check if the program is feasible for different levels of tax rate
% create a vector for different levels of the tax rate
taus=0:0.01:1;
% create 2 matrices to store the results
labors=zeros(77);
lambdas=zeros(77);
taus=taus(1:77);
%for tau>0.76 the algotihm is unable to find a solution
% foor loop for every level of taxrate
for t=1:77
    labors(t)=walras(taus(t),0);
    lambdas(t)=labors(t)*taus(t)*mplabor(labors(t));
end
% plot the results
plot(taus,lambdas)
xlabel("tax rate")
ylabel("transfers")
title("transfers vs tax rate")
xlim([0 0.76])

% maximum level of transfers
maxlambda=max(lambdas);
% check if the program is feasible
if maxlambda>=2*lambdastar
    display("the program is feasible")
else
    display("the Gift for Americans program is not feasible!!")
end