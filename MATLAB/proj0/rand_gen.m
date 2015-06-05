function Y = rand_gen
global num_memaccess;
prob1 = [0.7 0.1]; prob2 = ones(1, num_memaccess / 2 - 2); 
prob2 = prob2 * (0.2 / (num_memaccess / 2 - 2));
prob = [prob1 prob2];
alphabet = (1 : 2 : num_memaccess);
alphabet2 = (2 : 2 : num_memaccess);
Y(1) = randsrc(1, 1, [alphabet; prob]);
Y(2) = randsrc(1, 1, [alphabet2; prob]);
% Q: App1 is always accessing odd cacheline, App2 is always accessing even