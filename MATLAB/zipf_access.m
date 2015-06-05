function [x, y] = zipf_access()
% using this function to generate the memory access of the two apps
% the accessing pattern is zip distribution
% to generate num_memaccess random numbers, which are all integers,
% for A1, the memory access range is 0 ~ (num_memaccess - 1), for A2 the
% range is num_memaccess ~ (2 * num_memaccess);

global num_cl num_memaccess;

% n represents the total memory accessing times, which is millions;
n = 1e6;

% TODO: generating the access s.t. zipf distribution
 
if strcmp(type, 'my')
    prob1 = [0.7 0.1]; prob2 = ones(1, 98); prob2 = prob2 .* (0.2 / 98); prob = [prob1, prob2];
    s1 = zeros(1, 1e4);
    s2 = zeros(1, 1e4);
    alphabet = 1 : 100; 
    alphabet2 = 101 : 200;
    rand('seed', 0);
end


