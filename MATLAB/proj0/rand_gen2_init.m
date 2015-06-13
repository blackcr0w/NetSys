function rand_gen2_init
global num_app1;
global num_memaccess alphabet1 alphabet2 prob;
% this is the case of uniform distribution memory access;

prob = ones(1, num_memaccess);
prob = prob * (1 / num_memaccess);
alphabet1 = (1 : 1 : num_memaccess);
alphabet2 = (num_memaccess + 1 : 1 : 2 * num_memaccess);
num_app1 = numel(alphabet1); 