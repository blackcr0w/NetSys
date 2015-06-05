global cache_size cacheline_size app_mem num_cl num_memaccess n;
cache_size = 2*2^20;
cacheline_size = 64;
app_mem = 200 * cache_size;
num_cl = cache_size / cacheline_size;
num_memaccess = 100 * num_cl;
set_size = 16;
num_set = num_cl / set_size;
n = 50;
% very nice!!!!
s1 = zeros(1, n); % si is the access of app i, init to all-zero;
s2 = zeros(1, n);
rand_temp = [-1 -1];
rand('seed', 0);
for i = 1 : n
    rand_temp = rand_gen;
    s1(i) = rand_temp(1);
    s2(i) = rand_temp(2);   
end 

% prob1 = [0.7 0.1]; prob2 = ones(1, 50 - 2); 
% prob2 = prob2 * (0.2 / (50-2));
% prob = [prob1 prob2];
% alphabet = (1 : 2 : 99);
% alphabet2 = (2 : 2 : 100);
% 
% rand('seed', 0);
% ss1 = randsrc(1, n, [alphabet; prob]);
% ss2 = randsrc(1, n, [alphabet2; prob]);

