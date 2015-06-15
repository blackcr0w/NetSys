function rand_gen3_init
% this is the case of a better performanc access pattern, 
% app1 works like zipfian, which has the memory num_memaccess = is large;
% and app2 works in uniform distribution, which has num_memaccess = is large;

global num_memaccess prob1 prob2 alphabet1 alphabet2 num_app1;
% TODO: adjusting the probability distribution function to get the best hit
% rate in this accessig pattern

prob11 = [0.8 0.1]; prob12 = ones(1, num_memaccess - 2); 
prob12 = prob12 * (0.1 / (num_memaccess - 2));
prob1 = [prob11 prob12];

prob2 = ones(1, num_memaccess);
prob2 = prob2 * (1 / (num_memaccess));

alphabet1 = (1 : 1 : num_memaccess);
alphabet2 = (num_memaccess + 1 : 1 : 2 * num_memaccess);
num_app1 = numel(alphabet1);