function rand_gen7_init
global num_cl;
global num_app1;
global alphabet1 alphabet2 prob1 prob2;
% this is a case that soft-isolation works a lot better
% app1 access to only 1 addr, app2 has workset = 90% * cache
% NOTE: N choice: 8e4

num_app1cl1 = round(num_cl * 0.5 * 0.9); num_app1cl2 = round(num_cl * 0.5 * 4.1);
prob1_factor1 = 0.9 / num_app1cl1; 
prob1_factor2 = 0.1 / num_app1cl2; 
prob11 = ones(1, num_app1cl1); prob11 = prob11 * prob1_factor1;
prob12 = ones(1, num_app1cl2); prob12 = prob12 * prob1_factor2;
prob1 = [prob11 prob12];

num_app2cl1 = round(num_cl * 0.5 * 2); num_app2cl2 = round(num_cl * 0.5 * 3);
prob2_factor1 = 0.9 / num_app2cl1; prob2_factor2 = 0.1 / num_app2cl2; 
prob21 = ones(1, num_app2cl1); prob21 = prob21 * prob2_factor1;
prob22 = ones(1, num_app2cl2); prob22 = prob22 * prob2_factor2;
prob2 = [prob21 prob22];

alphabet1 = (1 : 1 : 2.5 * num_cl); 
alphabet2 = (2.5 * num_cl + 1 : 1 : 5 * num_cl);
num_app1 = numel(alphabet1); 
