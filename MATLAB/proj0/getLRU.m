function y = getLRU(base0, base)
% this function is find LRU in a set
global lru_stamp;
min = inf;
% y = base0 + base;
for i = (base0 + base) : (base0 + base + 7) 
    if lru_stamp(i) < min
        min = lru_stamp(i);
        y = i;
    end
end