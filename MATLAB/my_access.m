function [x, y] = my_access(s1, s2)

% this is to generate memory accesses of n times in memory
% in A1, P(m1) = 0.7, P(m2) = 0.1, P(m3 +...+ m_num_memaccess) = 0.2 
% in A2, P(m_num_memaccess + 1) = 0.7, P(m_num_memaccess + 2) = 0.1, 
% P((m_num_memaccess +3)+...+ 2 * num_memaccess) = 0.2 

% TODO: makeing the generating a real-time procedure;
global num_memaccess n;

cache_size = 2*2^20;
cacheline_size = 64;

num_cl = cache_size / cacheline_size;
num_memaccess = 100 * num_cl;
n = 5e4; % access 5M times ??????? 


prob1 = [0.7 0.1]; prob2 = ones(1, num_memaccess - 2); 
prob2 = prob2 .* (0.2 / (num_memaccess - 2)); prob = [prob1, prob2];

alphabet = 1 : num_memaccess; 
alphabet2 = num_memaccess + 1 : 2 * num_memaccess;

rand('seed', 0);
s1 = randsrc(1, n, [alphabet; prob]);
% s2 = randsrc(1, n, [alphabet2; prob]);


% x = randsrc(1, 1, [alphabet; prob]);
% y = randsrc(1, 1, [alphabet2; prob]);

% 
% 
% x = s1;
% y = s2;