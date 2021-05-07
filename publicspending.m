% publicspending.m

% fiscal experiment
% this script computes the outcomes (labor supply, GDP, welfare), when the 
% government uses the money raised through taxes to fund public spending
% (such as the construction of a statue)
% when the governement extracts resources for the economy the labor effort 
% will be affected by both a negative substitution effect (caused by the 
% taxes that take away some of the economy's resources) and a negative 
% income effect (caused by the reduction of resources available)
% in the final part, the outcomes under no public intervention
% (tau=0,g=0,lamda=0) are computed and the labor effort under no 
% intervention is compared to the labor effort when all the goverment 
% revenues are wasted in public spending to see which is the dominant effect
% between the SE and the IE

% parameterization

global alpha rho omega k  hguess hmin hmax itmax
% welfare function
alpha = 0.4;
rho = 1.01;
hmin=0;
hmax=0.9999;
% production function
omega= 0.3;
k=1;
% governmtent budget
% g is the fraction of taxes used to fund governement spending
gvector=0:0.01:1;
% taxation
tau1 = 0.3;

% walras algorithm
% set the maximum number of iterations
itmax=1000;
% set an initial guess
hguess=0.5;
% create a 3D matrix to store the results in
outcomes=zeros(length(gvector),3);
% for loop to consider every level of public expenditures
for i=1:length(gvector)
       outcomes(i,1)=walras(tau1,gvector(i)); % results for the labor effort
       outcomes(i,2)=output(outcomes(i,1)); % results for the GDP
       outcomes(i,3)=welfarefn(outcomes(i,1),mplabor(outcomes(i,1)),mpcapital(outcomes(i,1)),outcomes(i,1)*mplabor(outcomes(i,1))*tau1*(1-gvector(i)),tau1); % results for welfare
end


% plot the results
figure(2)
plot(gvector,outcomes(:,1))
xlabel("g")
ylabel("L")
title("labor effort vs level of government spending")
legend("t=0.3")
xlim([0 1])
ylim([0.24 0.31])

figure(3)
plot(gvector,outcomes(:,2))
xlabel("g")
ylabel("y")
title("GDP vs level of government spending")
legend("t=0.3")
xlim([0 1])


figure(4)
plot(gvector,outcomes(:,3))
xlabel("g")
ylabel("W")
title("Welfare vs level of government spending")
legend("t=0.3")
xlim([0 1])

% compute the outcomes when there is no public intervention (tau=0, g=0, lambda=0)
% the behaviour of the RA will not be distorted (no income or substituion effect)

% public expenditures
gnoint=0;
% taxation
taunoint = 0;

% walras algorithm 
% set an initial guess
hguess=0.5;
% solve for the optimal labor supply
hnoint=walras(taunoint,gnoint);  % labor effort under no intervention
wnoint=mplabor(hnoint);% wages under no intervention
rnoint=mpcapital(hnoint);% rental rate under no intervention
lambanoint=(1-gnoint)*wnoint*hnoint*taunoint; % transfers under no intervention (=0)
GDPnoint=output(hnoint); % GDP under no intervention
welfarenoint=welfarefn(hnoint,wnoint,rnoint,lambanoint,taunoint); % welfare under no intervention
consumptionnoint=consumption(hnoint,wnoint,rnoint,lambanoint,taunoint);% consumption under no intervention (=GDP)

display("Outcomes without public intervention")
display("labor supply")
display(hnoint)
display("GDP")
display(GDPnoint)
display("consumption")
display(consumptionnoint)
display("welfare")
display(welfarenoint)


% check if the income effect outweighs the substitution effect when all the
% government revenues are spent on public spending (lambda=0, g=1) and
% tau=0.3

% computes outcome when lambda=0, g=1 and tau=0.3
gnotransfers=1;
% walras algorythm
% set initial guess
hguess=0.5;
hnotransfers=walras(tau1,gnotransfers);
% display the result
display("labor effort with no transfers and tau=0.3")   
display(hnotransfers)

% check if the labor effort whether or not the I.E. dominates the S.E   
if hnotransfers > hnoint; % the I.E. dominates
    display("When tau=0.3 and lambda=0, the negative income effect outweighs the negative substitution effect, and the RA works more")
elseif hnotransfers == hnoint; % the two effecs are equal
     display("When tau=0.3 and lambda=0, the negative income effect is equal to the negative substitution effect, no change in the labor effort")    
else     % the S.E. dominates
     display("When tau=0.3 and lambda=0, the negative substitution effect outweighs the negative income effect, and the RA works less")
end   

