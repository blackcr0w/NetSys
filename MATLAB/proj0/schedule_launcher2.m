function Y = schedule_launcher2(portion)
global cache_size cacheline_size app_mem num_cl num_memaccess n num_set cl;
global lru lru_stamp hit2 hit_app1 hit_app2;
global s1 s2;

cache_size = 512;
cacheline_size = 1;
app_mem = 5 * 2^10; % should be: 100 * cache_size
num_cl = cache_size / cacheline_size;
num_memaccess = app_mem / cacheline_size; % shold be: 100 * num_cl
set_size = 16;
num_set = num_cl / set_size;
n = 20000;
hit2 = 0;
hit_app1 = 0; hit_app2 = 0;
% sets = 1 : num : set; % sets represents all set number;
cl = zeros(1, num_cl); % cl stores the data of cacheline;
% x = ones(1, num_cl); % x keeps track of the status of all cacheline;
% x = -1 * x; % the original x is all -1, meaning all cacheline are empty;
% MAX = 10; % MAX is the parameter for the isolation algorithm;

lru = 1;
lru_stamp = ones(1, num_cl); % lru_stamp keeps track of least-used time of all cacheline;
lru_stamp = -1 * lru_stamp;

% n: each application will access the memory for millions of times;

s1 = zeros(1, n); % si is the access of app i, init to all-zero;
% this is the case when app1 is scheduled twice than app2
s2 = zeros(1, n * 2);
rand_temp = [-1 -1 -1]; % rand_temp is the memory access of app1 and app2 in this loop


rand_gen7_init(portion);
rand('seed', 0);
for i = 1 : n
    rand_temp = schedule2_rand_gen_univ;
    s1(i) = rand_temp(1);
    s2(2 * i - 1) = rand_temp(2);
    s2(2 * i) = rand_temp(3);
    replace_2(s1(i));
    replace_2(s2(2 * i - 1));
    replace_2(s2(2 * i));
end 

Y = [hit2 hit_app1 hit_app2];

mybeep;