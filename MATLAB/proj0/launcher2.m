clear;
global cache_size cacheline_size app_mem num_cl num_memaccess n num_set cl;
global lru lru_stamp x MAX hit2;

cache_size = 512;
cacheline_size = 1;
app_mem = 50 * 2^10; % should be: 100 * cache_size
num_cl = cache_size / cacheline_size;
num_memaccess = app_mem / cacheline_size; % shold be: 100 * num_cl
set_size = 16;
num_set = num_cl / set_size;
n = 7500;
hit2 = 0;
% sets = 1 : num : set; % sets represents all set number;
cl = zeros(1, num_cl); % cl stores the data of cacheline;
x = ones(1, num_cl); % x keeps track of the status of all cacheline;
x = -1 * x; % the original x is all -1, meaning all cacheline are empty;
% MAX = 1; % MAX is the parameter for the isolation algorithm;

lru = 1;
lru_stamp = ones(1, num_cl); % lru_stamp keeps track of least-used time of all cacheline;
lru_stamp = -1 * lru_stamp;

% n: each application will access the memory for millions of times;


s1 = zeros(1, n); % si is the access of app i, init to all-zero;
s2 = zeros(1, n);
rand_temp = [-1 -1];
rand('seed', 0);
for i = 1 : n
    rand_temp = rand_gen2;
    s1(i) = rand_temp(1);
    s2(i) = rand_temp(2);
    replace_2(s1(i));
    replace_2(s2(i));
end 