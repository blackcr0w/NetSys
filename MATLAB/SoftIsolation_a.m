function SoftIsolation_a
% using this function to generate S1, S2 and RR 


%c is the active index. c(i) = -1 means c(i) is a empty cell;
global c rr m lru t n hit MAX;

c = [-1, -1, -1, -1]; % c is the cell active index, c(i) = -1 means empty cell
rr = 1; % rr = 1 means A1, rr = 3 means A2
hit = 0;
n = 1e4;
m = [-1 -1 -1 -1]; % m stores the current memory part in cache;
%MAX = 0; % the MAX of active index
lru = 1; % this is used to recorde the lru time
t = [inf inf inf inf]; % t is the lru of each cell

% this is to generate memory accesses of 100 loactions in memory, m1~m100,
% in A1, P(m1) = 0.7, P(m2) = 0.1, P(m3+...+m100) = 0.2 
% in A2, P(m101) = 0.7, P(m102) = 0.1, P(m103+...+m200) = 0.2 
% and each application have 1000 times of memory access -- to be modified
prob1 = [0.7 0.1]; prob2 = ones(1, 98); prob2 = prob2 .* (0.2 / 98); prob = [prob1, prob2];
s1 = zeros(1, 1e4);
s2 = zeros(1, 1e4);
alphabet = 1 : 100; 
alphabet2 = 101 : 200;
rand('seed', 0);

for i = 1 : n
    s1(i) = randsrc(1,1,[alphabet; prob]);   
    replace(s1(i));
    s2(i) = randsrc(1,1,[alphabet2; prob]);
    replace(s2(i));
end

rr = 1;
global mm tt hit2 lruu;
hit2 = 0;
mm = [-1 -1 -1 -1];
tt = [inf inf inf inf];
lruu = 1;

% TODO: update s1 s2 when running
for i = 1 : n
    lrureplace(s1(i));
    lrureplace(s2(i));
end




