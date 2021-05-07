function hstar=walras(t,g)
% this function compute the optimal labor effort using the walras algorithm
% t is the tax rate ang g is the fraction of gov revenues used to fund public spending

global hmin hmax hguess itmax

% set initial difference (it must be greater than the tollerance)
diff=1;
% set tollerance
toll=10^-8;

% walras algorithm 
% set the counter
i=1;
% look for corner solutions
if mblabor(hmax,t,g)>mclabor(hmax) % hmax is the solution
    hstar=hmax;
elseif mblabor(hmin,t,g)<mclabor(hmin) % hmin is the solution
    hstar=hmin;
else % the solution is internal
    while diff>toll && i<itmax
      % create guesses for r and w consistent with the guess for h
      wguess=mplabor(hguess);
      rguess=mpcapital(hguess); % the rental rate equalizes the marginal product of capital
      lambdaguess=(1-g)*wguess*t*hguess; % all the taxes are transferred to individuals
      % solve the maximization problem for h
      hnew=fminbnd(@(h)welfarefnmin(h,wguess,rguess,lambdaguess,t),hmin,hmax);
      % check for convergence
      diff=abs(hnew-hguess);
      % update the guess
      hguess=(hnew+hguess)/2;
      i=i+1;
    end
    % check if the solution is correct
    if abs(hguess-hnew)>toll
        display("ATTENTION!!! the algorithm is unable to find the solution")
    end
    if i>=itmax
        display("maximum number of iteration hit!!!")
    end
end
hstar=hguess;
end