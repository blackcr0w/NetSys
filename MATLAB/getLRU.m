function y = getLRU(base0, base)
% this function is find LRU in a set
global x;
min = inf;
for i = (base0 + base) : (base0 + base + 7) 
    if x(i) < min
        min = x(i);
        y = i;
    end
end