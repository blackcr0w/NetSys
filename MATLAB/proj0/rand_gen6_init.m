function rand_gen6_init
global num_cl;
global num_app1;
global alphabet1 alphabet2 prob1 prob2;
% this is a case that soft-isolation works a lot better
% app1 access to only 1 addr, app2 has workset = 90% * cache
% NOTE: N choice: 8e4

prob1 = 1;
num_app2cl = round(num_cl * 0.9);
prob2 = ones(1, num_app2cl);
phi = 1 / num_app2cl;
prob2 = prob2 * phi;

alphabet1 = 1; alphabet2 = (2 : 1 : num_app2cl + 1);
num_app1 = numel(alphabet1); 
% num_app2 = numel(alphabet2);