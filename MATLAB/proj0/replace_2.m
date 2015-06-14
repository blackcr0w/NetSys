
function replace_2(si) %%
% using this function simiulating the case without soft isolation, only lru
global num_set cl lru_stamp lru hit2 hit_app1 hit_app2;
global num_app1;
set_num = mod(si, num_set);
% set_num = int32(set_num);
base0 = set_num * 16 + 1; % base0 si the starting base of the set

base = -1; % base is decided by which app is running, and used as base in repalacing
% the accessing pattern ensures A1 will access odd, A2 will access even
if si > num_app1
    base = 8;
else
    base = 0;
end
% when hit happens?
for i = base0 + base : base0 + base + 7
    if cl(i) == si;
        hit2  = hit2 + 1;
        if base == 8
            hit_app2 = hit_app2 + 1;
        else 
            hit_app1 = hit_app1 + 1;
        end
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
    end
end

% when miss happens and empty cachelien exists:
for i = base0 + base : base0 + base + 7
    if cl(i) == 0
        cl(i) = si;
        lru_stamp(i) = lru;
        lru = lru + 1;
        return;
    end
end

% % when miss happens and there is soft-isolatable cacheline
% for i = set_num : set_num + 15
%     if x(i) == 0
%         cl(i) = si;
%         x(i) = MAX;
%         lru_stamp(i) = lru;
%         lru = lru + 1;
%         return;
%     end
% end

% when miss happens, using LRU and hard-isolation
ii = getLRU(base0, base);
cl(ii) = si;
lru_stamp(ii) = lru;
lru = lru + 1;


% for i = (set_num + base) : (set_num + base + 7)
%     if i ~= ii
%         x(i) = x(i) - 1;
%     else continue;
%     end 
% end

% seg_num = 8 - base;
% for i = (seg_num + base) : (seg_num + base + 7)
%     x(i) = x(i) * 0.5;
%     x(i) = int32(x(i));
% end 



    
    

            
