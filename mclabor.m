function mcl = mclabor(h)
% this function return the margianl cost of labor for any given level of
% labour h
% alfa is parameter of the utitlity function
global alpha
mcl=(1-alpha)/(1-h);
end

