function mpl = mplabor(h)
% this function gives the marginal productivity of labor forn any given amount
% of labor (l) and capital (k) employed
% omega is a parameter of the CB production function
global omega k
mpl= (1-omega) * ((k*h^(-1))^omega);
mpl= max(mpl,0); % the marginal productivity cannot be negative
end

