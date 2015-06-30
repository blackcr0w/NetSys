function Y = sche_rand_gen(app_to_run)
% this function generates the access addr
% this is the case when app1 and app2 have the same access
% both uniform, working set = 3 * cacheline * 0.5
global num_cl;
global num_app1;
num_workset = 3 * 0.5 * num_cl;
prob_factor = 1 / num_workset;
prob = ones(1, num_workset); prob = prob * prob_factor;
alphabet1 = (1 : 1 : num_workset); alphabet2 = (num_workset + 1 : 1 : 2 * num_workset);
num_app1 = num_workset;
if app_to_run == 1
    Y = randsrc(1, 1, [alphabet1; prob]);
else
    Y = randsrc(1, 1, [alphabet2; prob]);
end
