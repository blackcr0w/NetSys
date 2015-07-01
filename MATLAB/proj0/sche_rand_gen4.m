function Y = sche_rand_gen4(app_to_run)
% this function generates the access addr
% this is the case when changing the workset size of each app
% in this case, app1 = 0.5 * 0.5 * cache
% app2 = 0.75 * 0.5 * cache
global num_cl;
global num_app1;
num_workset1 = 0.25 * 0.5 * num_cl;
num_workset2 = 0.75 * 0.5 * num_cl;

prob1_factor = 1 / num_workset1; prob2_factor = 1 / num_workset2;
prob1 = ones(1, num_workset1); prob1 = prob1 * prob1_factor;
prob2 = ones(1, num_workset2); prob2 = prob2 * prob2_factor;

alphabet1 = (1 : 1 : num_workset1); alphabet2 = (num_workset1 + 1 : 1 :num_workset1 + num_workset2);
num_app1 = num_workset1;
if app_to_run == 1
    Y = randsrc(1, 1, [alphabet1; prob1]);
else
    Y = randsrc(1, 1, [alphabet2; prob2]);
end
