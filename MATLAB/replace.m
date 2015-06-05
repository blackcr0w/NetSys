function replace(si)
% this function is to make cache cell replacement
global rr c hit MAX m lru t;
rri = 4 - rr;
%rr = 1 means we are considering A1 (i.e. S1), rr = 3 means A2
    % hit case
    for i = 1 : 4
        if m(i) == si
            c(i) = MAX;
            hit = hit + 1;
            rr = rri;
            t(i) = lru;
            lru = lru + 1;
            return;
        end 
    end
    
    % miss case 
    % if there is empty cell, fill it
    for i = rr : rr + 1
        if (c(i) == -1)
            m(i) = si;
            c(i) = MAX;
            rr = rri;
            t(i) = lru;
            lru = lru + 1;
            return;
        end 
    end
    
    % if there is a soft-isolateable cell, replace it
    % else, c(i) - 1
    for i = rri : rri + 1
        if c(i) == 0
            m(i) = si;
            c(i) = MAX;
            rr = rri;
            t(i) = lru;
            lru = lru + 1;
            return;
        else c(i) = c(i) - 1;
        end 
    end
    
    i = getLRU(rr, t);
    c(i) = MAX;
    m(i) = si;
    rr = rri;
    t(i) = lru;
    lru = lru + 1;
    return;
    
