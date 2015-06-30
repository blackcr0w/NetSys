function Y = sche_rand_gen2(app_to_run)
% this function generates the access addr
% this is the case when app1 is not uniform, but app2 is
% both uniform, working set = 3 * cacheline * 0.5
global num_cl;
global num_app1;
num_workset = 3 * 0.5 * num_cl;

num_app1cl1 = round(num_workset * 0.2); num_app1cl2 = round(num_workset * 0.8);
prob1_factor1 = 0.9 / num_app1cl1; prob1_factor2 = 0.1 / num_app1cl2; 
prob11 = ones(1, num_app1cl1); prob11 = prob11 * prob1_factor1;
prob12 = ones(1, num_app1cl2); prob12 = prob12 * prob1_factor2;
prob1 = [prob11 prob12];

prob2_factor = 1 / num_workset;
prob2 = ones(1, num_workset); prob2 = prob2 * prob2_factor;
alphabet1 = (1 : 1 : num_workset); alphabet2 = (num_workset + 1 : 1 : 2 * num_workset);
num_app1 = num_workset;
if app_to_run == 1
    Y = randsrc(1, 1, [alphabet1; prob1]);
else
    Y = randsrc(1, 1, [alphabet2; prob2]);
end
