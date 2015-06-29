clear; close all;
global num_cl;
global num_app1;
global alphabet1 alphabet2 prob1 prob2;

% this is the case when app1 and app2 have the same access
% both uniform, working set = 3 * cacheline * 0.5

sche_const = [0.01 0.1 1 5 10 20 40 50 70 100];
hits = zeros(10, 6);

for i = 1 : nuel(sche_const)
    hits(i, : ) = schedule_run(sche_const(i));
    schedule
    
    

num_workset = 3 * 0.5 * num_cl;
prob_factor = 1 / num_workset;
prob = ones(1, num_workset); prob = prob * prob_factor;
alphabet1 = (1 : 1 : num_workset); alphabet2 = (num_workset + 1 : 1 : 2 * num_workset);

