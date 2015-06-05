function lrureplace(si)
% this funciton is to make replacement of hard isolation (strict LRU)
global rr mm tt hit2 lruu;
rri = 4 - rr;

%rr = 1 means we are considering A1 (i.e. S1), rr = 3 means A2
% hit case
for i = rr : (rr + 1)
    if mm(i) == si
        tt(i) = lruu;
        lruu = lruu + 1;
        hit2 = hit2 + 1;
        rr = rri;
        return;
    end
end

% miss case
% if there is empty cell, fill it
for i = rr : rr + 1
    if (mm(i) == -1)
            mm(i) = si;
            rr = rri;
            tt(i) = lruu;
            lruu = lruu + 1;
            return;
    end      
end

% if there is no empty cell, usting lru
i = getLRU(rr, tt);
mm(i) = si;
rr = rri;
tt(i) = lruu;
lruu = lruu + 1;
return;    
    
