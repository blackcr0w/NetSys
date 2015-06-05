clear;
access = [200, 300, 400 500, 600, 700];
access = 2 * access;
hit = [315, 485, 642, 798, 956, 1113];

for i = 1 : numel(hit)
    hit_rate(i) = hit(i) /  access(i);
end

figure, plot(access, hit_rate);

% n = 400
MAX = [2, 3, 4, 5, 10, 20, 30]

hit = [650 652 653 648 642 644 643]

hit2 = [233 197 190 ]

% for one APP the number of time accessing one address
i = 800;
MAX = [1 2 3
hit1 = [1287 1287 1287
hit2 = [1287


MAX = [1 2 ]
hit = [14 14 14 14(MAX = 20) ]
hit2 = [15 15 15]



% new hit count:  
% using the evenly distributed access pattern: rand_gen2
% MAX = 40
n = [1000 5000 7500 1e4]
hit1 = [14 102 158 221]
hit2 = [19 111]

% MAX = 5, n = 5000
hit1 = 102


% new parameters:
% cache_size = 512; % set cache size = 512B;(2MB)
% cacheline_size = 1; % set cache line size = 1B;(64B)
% app_mem = 5 * 2^10; % set memory accessing size = 5KB;should be: 100 * cache_size
% num_cl = cache_size / cacheline_size; % total cache line number;
% num_memaccess = app_mem / cacheline_size; % shold be: 100 * num_cl
% set_size = 16; % this is a 16-way set assiciated, every set has 16 cache lines
n = 2e4;
possible app_access = 5120;
MAX = [5 7 10 15 100];
hit = [1653 3990 3991 3991 3991];

MAX = [5 10 15]
hit2 = [3934 3934]



