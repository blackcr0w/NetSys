function [Y X] = randtry2
prob1 = [0.7 0.1]; prob2 = ones(1, 50 - 2); 
prob2 = prob2 * (0.2 / (50-2));
prob = [prob1 prob2];
alphabet = (1 : 2 : 99);
alphabet2 = (2 : 2 : 100);
n = 1000;

Y = randsrc(1, n, [alphabet; prob]);
X = randsrc(1, n, [alphabet2; prob]);
