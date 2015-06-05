clear all; close all; clc;

alphabet = 1 : 100; 
alphabet2 = 101 : 200;
cnt  = 0;
prob1 = [0.7 0.1]; prob2 = ones(1, 98); prob2 = prob2 .* (0.2 / 98); prob = [prob1, prob2];
rand('seed',0);
a = zeros(1, 1e3);
b = zeros(1, 1e3);
for i = 1 : 1e3
    a(i) = randsrc(1,1,[alphabet; prob]);
    b(i) = randsrc(1,1,[alphabet2; prob]);

end

