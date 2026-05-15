% algorithm 16 via Box-Muller
function x = boxmuller                                                      % define function
u=rand; v=rand;                                                             % generate independent uniformly distributed random variables
x=sqrt(-2*log(u))*cos(2*pi*v);                                              % set x-value
y=sqrt(-2*log(u))*sin(2*pi*v);                                              % set y-value
end