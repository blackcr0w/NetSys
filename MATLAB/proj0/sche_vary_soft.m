function Y = sche_vary_soft(sche_const)
% schedule1 is the case when app1 is scheduled twice than app2.
global cache_size cacheline_size app_mem num_cl num_memaccess n num_set cl;
global lru lru_stamp x hit MAX hit_app1 hit_app2;
global s1 s2;
global cnt1 cnt3 cnt30;
cnt1 = 0; cnt3 = zeros(1, 10000); cnt30 = 1; 
% cnt1 tracks how many soft-isolation happens;
% cnt3 and cnt 30 tracks the number of cacheline where soft-isolation happens

cache_size = 512; % set cache size = 512B;(2MB)
cacheline_size = 1; % set cache line size = 1B;(64B)
app_mem = 5 * 2^10; % set app working set size = 5KB;should be: 100 * cache_size
num_cl = cache_size / cacheline_size; % actual cache line number;
num_memaccess = app_mem / cacheline_size; % working set size, shold be: 100 * num_cl
set_size = 16; % this is a 16-way set assiciated, every set has 16 cache lines
num_set = num_cl / set_size; % number of cache sets
n = 60000; % n: each application will access the memory for millions of times;
hit  = 0; hit_app1 = 0; hit_app2 = 0; % hit is total hit times, hit_app1 is the time app1 hits

cl = zeros(1, num_cl); % cl stores the data of all cachelines;
MAX = 5; % MAX is the parameter for the isolation algorithm;
x = ones(1, num_cl); % x keeps track of the status of all cachelines;
x = MAX * x; % the original x is all MAX;
% Question: not sure if it's good to set all x to MAX

lru = 1;
lru_stamp = ones(1, num_cl); % lru_stamp keeps track of least-used time of all cachelines;
lru_stamp = -1 * lru_stamp; % Question: original value all -1.


% TODO1: making a large outside loop, very n in a big setp-in, (50 or 100) and
% get series fo hit.---not now

% TODO: using the file operation to write the real-time hit-rate in
% a file!!!!!!!
% other solution: using Java or C, mixture coding---not now, better use
% Python

% TODO3: reducing the app_mem and num_memaccess, making the resulets not
% useless;--- done

% TODO4: thinking a way to generating the next random number very fast 
% now: every time, have to look at the seed and generate every pair is slow
% because i'm using the "seed" thing
% I HAVE TO MAKE THE LOOP NUMBER >> THE POSSIBLE NUMBER OF MEMORY THAT A
% APP CAN ACCESS TO

% TODO5: cache isolation do not affect the hit rate,
% I should think about cases of distributio that the soft isolation works
% well and when it works bad;

s1 = []; s2 = [];
rand_temp = -1; % rand_temp is the memory access of app1 and app2 in this loop

rand('seed', 0);
for i = 1 : n
    app_to_run = schedule_gen(sche_const);
    rand_temp = sche_rand_gen5(app_to_run);
    if app_to_run == 1
        s1 = [s1 rand_temp];
    else
        s2 = [s2 rand_temp];
    end
    replace_1(rand_temp);
end

Y = [hit hit_app1 hit_app2];


% the next is drawing the Probability density function and cumulative
% distribution function of current accessing pattern
% cdfplot(s1);
% 
% 
% s1min=min(s1);
% s1max=max(s1);
% xp=linspace(s1min,s1max,40);
% f=ksdensity(s1,xp);
% figure, plot(xp,f,'*');

% global hit2;
% hit2 = 0;
% s1 = zeros(1, n); % si is the access of app i, init to all-zero;
% s2 = zeros(1, n);
% rand_temp = [-1 -1];
% rand('seed', 0);
% for i = 1 : n
%     rand_temp = rand_gen;
%     s1(i) = rand_temp(1);
%     s2(i) = rand_temp(2);
%     replace_2(s1(i));
%     replace_2(s2(i));
% end 


% figure, plot()
