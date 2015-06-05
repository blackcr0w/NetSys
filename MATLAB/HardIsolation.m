%using this class to generate S1, S2 and RR 

% CNT_number = 10000;  
% Mu = 5;
% a=exprnd(Mu, 1, CNT_number);  
% plot(a);  
% mean = sum(a) /CNT_number 

% c is the active index. c(i) = -1 means c(i) is a empty cell;
global c rr hit m MAX lru t;

c = [-1, -1, -1, -1]; % c is the cell active index, c(i) = -1 means empty cell
rr = 1; % rr = 1 means A1, rr = 3 means A2
hit = 0;
m = [-1 -1 -1 -1]; % m stores the current memory part in cache;
MAX = 5; % the MAX of active index
lru = 1; % this is used to recorde the lru time
t = [inf inf inf inf]; % t is the lru of each cell

% this is to generate memory accesses of 100 loactions in memory, m1~m100,
% in A1, P(m1) = 0.7, P(m2) = 0.1, P(m3+...+m100) = 0.2 
% in A2, P(m101) = 0.7, P(m102) = 0.1, P(m103+...+m200) = 0.2 
% and each application have 1000 times of memory access -- to be modified
alphabet = 1 : 100; 
prob1 = [0.7 0.1]; prob2 = ones(1, 98); prob2 = prob2 .* (0.2 / 98); prob = [prob1, prob2];
s1 = randsrc(1e3,1,[alphabet; prob]);
alphabet = 101 : 200;
s2 = randsrc(1e3,1,[alphabet; prob]);
for i = 1 : 1e3
    replace(s1(i));
    replace(s2(i));
end


