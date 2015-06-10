function Y = rand_gen3
% this is the case of a better performanc access pattern, 
% app1 works like zipfian, which has the memory num_memaccess = is large;
% and app2 works in uniform distribution, which has num_memaccess = is large;

global num_memaccess;
% TODO: adjusting the probability distribution function to get the best hit
% rate in this accessig pattern

prob11 = [0.7 0.2]; prob12 = ones(1, num_memaccess - 2); 
prob12 = prob12 * (0.1 / (num_memaccess - 2));
prob1 = [prob11 prob12];

prob2 = ones(1, num_memaccess);
prob2 = prob2 * (1 / (num_memaccess));

alphabet1 = (1 : 2 : 2 * num_memaccess);
alphabet2 = (2 : 2 : 2 * num_memaccess);
Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet2; prob2]);
% Q: App1 is always accessing odd cacheline, App2 is always accessing even