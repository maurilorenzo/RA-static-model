% generalequilibrium.m
% this script solves a general equilibrium problem with a RA, a government
% and a firm with a cobb-douglas production function

clear all
clc

% parameterization
global alpha rho hmin hmax omega k hguess itmax
% utility function
alpha = 0.4;
rho = 1.01;
hmin=0;
hmax=0.9999; % h cannot be equal to one (log(1-1) is not defined)
% production function
omega= 0.3;
k=1;
% government
% public expenditures
g1=0;
% taxation
tau1 = 0.3;
% walras algorithm 
% set an initial guess
hguess=0.5;
% set the maximum number of iterations
itmax=1000;
% solve for the optimal labor supply
hstar=walras(tau1,g1); % hstar is te solution to the RA problem when the tax rate is tau1 and g1 is the fraction of government revenues used to fund public expenditures
wstar=mplabor(hstar); % wstar is the level of wage in equilibrium (it is equal to the marginal productivity of labor)
rstar=mpcapital(hstar); % wstar is the level of rental rate in equilibrium (it is equal to the marginal productivity of capital)
lambdastar=(1-g1)*wstar*hstar*tau1; % wstar is the level of transfers in equilibrium (it is equal to the fraction (1-g) of the total gov revenues)
GDP=output(hstar); % GDP is the output produced (when g=0 it is equal to the level of consumption)
welfare1=welfarefn(hstar,wstar,rstar,lambdastar,tau1); % wealfare1 is the lebvelof wealfare under this fiscal regime
consumptionstar=consumption(hstar,wstar,rstar,lambdastar,tau1); % consumption star is the level of consumption in equilibium (since g=0 it is equal to the GDP)
display("Results of the general equilibrium problem ")
display("labor effort")
display([hstar])
display("GDP")
display([GDP])
display("level of transfers payment")
display(lambdastar)

% plot of the RA objective function

h=0:0.001:0.99999; % create a vector to compute the welfare function at different levels of labor effort
% create vectors to store results in
utility=zeros(length(h));
wages=zeros(length(h));
rates=zeros(length(h));
lambdas=zeros(length(h));
for i=1:length(h)
rates(i)=mpcapital(h(i));
wages(i)=mplabor(h(i));
lambdas(i)=wages(i)*h(i)*tau1;
utility(i)=welfarefn(h(i),wages(i),rates(i),lambdas(i),tau1);
end

figure(1)
plot(h,utility);
xlabel("time spent working")
ylabel("Welfare function")
xlim([0 1])
ylim([-43 -40])
title("Welfare vs labor")
grid on
