function Y = rand_gen2
global num_memaccess;
% this is the case of uniform distribution memory access;

prob = ones(1, num_memaccess / 2);
prob = prob * (2 / num_memaccess);
alphabet = (1 : 2 : num_memaccess);
alphabet2 = (2 : 2 : num_memaccess);
Y(1) = randsrc(1, 1, [alphabet; prob]);
Y(2) = randsrc(1, 1, [alphabet2; prob]);
