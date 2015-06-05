
clear;
global cache_size cacheline_size app_mem num_cl num_memaccess n num_set cl;
global lru lru_stamp x hit MAX;
global s1 s2;

cache_size = 2 * 2^10;
cacheline_size = 2;
app_mem = 200 * 2^10; % should be: 100 * cache_size
num_cl = cache_size / cacheline_size;
num_memaccess = app_mem / cacheline_size; % shold be: 100 * num_cl
set_size = 16;
num_set = num_cl / set_size;
hit  = 0;

% sets = 1 : num : set; % sets represents all set number;
cl = zeros(1, num_cl); % cl stores the data of cacheline;
x = ones(1, num_cl); % x keeps track of the status of all cacheline;
x = -1 * x; % the original x is all -1, meaning all cacheline are empty;
MAX =40; % MAX is the parameter for the isolation algorithm;

lru = 1;
lru_stamp = ones(1, num_cl); % lru_stamp keeps track of least-used time of all cacheline;
lru_stamp = -1 * lru_stamp;

% n: each application will access the memory for millions of times;
n = 800;
% TODO: making a large outside loop, very n in a big setin, (50 or 100) and
% get series fo hit.

% TODO: using the file operation to write the real-time hit-rate in
% a file!!!!!!!
% other solution: using Java or C, mixture coding
% TODO2: using matalb OOP to simplify the code;

s1 = zeros(1, n); % si is the access of app i, init to all-zero;
s2 = zeros(1, n);
rand_temp = [-1 -1];
rand('seed', 0);
for i = 1 : n
    rand_temp = rand_gen2;
    s1(i) = rand_temp(1);
    s2(i) = rand_temp(2);
    replace_1(s1(i));
    replace_1(s2(i));
end 

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
