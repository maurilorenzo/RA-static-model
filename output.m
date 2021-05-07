function y = output(h)
% this function compute the output for the amount of labor and capital used
% omega is a parameter of the CB prod function
global k omega
y=k^omega * h^(1-omega);
end

