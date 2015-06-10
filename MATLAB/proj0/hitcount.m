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

n = 20000;
hit = 3991;
n = 40000
hit = 8014;
n = 60000
hit = 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen2, n = 20,000 %%%%%%%%%%%%%%

hit = [3991]; % always;
hit2 = [3991]; % always;
hitrate  = 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen3,  %%%%%%%%%%%%%%

% n = 60,000:
MAX [5, 30];
hit = [119235, 119235, ];
hit2 = [119252, ];
hitrate = [0.9936, ];

% n = 100,000:
MAX = [3, 30];
hit = [199065, 199071]
hitrate = 0.9953, 0.9954
% MAX still does not affec the hit rate too much;

% want to ger more cases?
% making it larger num_memaccess

% using the rand_gen, the access pattern of app1 and app2 are the same, but
% the hit rate is good, about 82%, still confused.
% n = 60,000
% when the total #mem_access is doubed and other change:
% the probability distribution: [0.7, 0.2, uniforly to the rest]
% hit = 109331,  n = 60000, hitrate = 0.9111;
% test 3: distribution: [0.7, 0.25, 0.05]
% hit = 114624, n = 60000, hitrate = 0.9552;
% this is still almost the same as no-soft isolation case: hit2 = 114292
% but there is improvement in hit rate: improved 0.0028%;

% TODO with rand_gen: test the diff distribution parameter for better
% performance;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen4, n = 60,000 %%%%%%%%%%%%%%
hit = 119488;
hitrate = 0.9957;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% this is the hit rate of the rand_gen5, n = 20,000 %%%%%%%%%%%%%%



% now, it seems that rand_gen2, the all uniform distributio case is worse
% and the rand_gen and rand_gen3 are better cases;

% TODO: 
% (1)working on rand_gen3 
% first, in the current parameter, I want to see the improvement,
% second, finding the best parameter for in rand_gen3;
% the probility distribution:

% [0.45, 0.45, uniformly]
% hit  = 57345, hitrate = 0.4779, hit2 = 56668, hitrate2 = 0.4722
% improvement = 0.0057

% changing the probility distribution:
% [0.5, 0.4, uniformly]
% hit = 57345, hitrate = 0.4779, hit2 = 56668? hitrate2 = 0.4722,
% improvement = 0.0057.

% [0.7, 0.2, uniformly]
% n = 60,000, hit = 57346,  hitrate = 0.4779
% n = 60,000, hit2 = 56990, hitraet = 0.4749
% improved: 0.003

% [0.8, 0.1, uniformly]
% hit = 57345, hitrate = 0.4779, hit2 = 56989? hitrate2 = 0.4749,
% improvement = 0.0030.



% (2)working on the variation fo MAX and the effect of MAX on the hit rate.
% -----MAX does not affec the hit rate!!!

%%%%%%%% JUN.10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1. diff parameters and the rand_gen results
% MAX = 10, n = 40.000,  

% (1) pdf and cdf of rand_gen, then the the hitragte improvement when probability
% change
% (2)

% [0.45, 0.45, uniformly]:
hit = 72862; hitrate = 0.910775;
hit2 = 72456; hitrate2 = 0.9057;
improvement = 0.0051;
% [0.6, 0.3, uniformly]:
hit = 72862; hitrate = 0.910775;
hit2 = 72456; hitrate2 = 0.9057;
% [0.75, 0.15, uniformly]:
hit = 72862; hitrate = 0.910775;
hit2 = 72458; hitrate2 = 0.9057;
improvement = 0.0051;

% [0.89, 0.01, uniformly]:
hit = 72863, hitrate = 0.9108;
hit2 = 72670, hitreat2 = 0.908375;
improved = 0.0024;

% 2. diff parameter of rand_gen2
% this is the worse case
% cannot see much more
hit = 3959; hitrate = 0.049485;
hit2 = 3959; hitrate2 = 0.049485;;
improvement = ;


% 3. diff parameters for rand_gen3
% (1) pdf and cdf of rand_gen3, then the the hitragte improvement when probability
% change
% (2)



