function mpk = mpcapital(h)
% this function gives the marginal productivity of labor forn any given amount
% of labor (l) and capital (k) employed
% omega is a parameter of the CB production function
global omega k
mpk= omega*((h/k) ^(1-omega));
mpk=max(0,mpk); % the marginal productivity cannot be negative
end

