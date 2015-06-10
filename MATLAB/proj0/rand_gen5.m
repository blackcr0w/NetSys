function Y = rand_gen5
% this is the case of a worse performanc access pattern, 
% TODO: compare the different hit rate for different access pattern, but
% App1 and App2 are of the same access pattern;

global num_cl;

% prob11 = [0.7 0.2]; prob12 = ones(1, num_cl * 0.5 - 2); 
% prob12 = prob12 * (0.1 / (num_cl * 0.5 - 2));
% prob1 = [prob11 prob12];

prob2 = ones(1, num_cl * 0.5 + 1);
prob2 = prob2 * (1 / (num_cl * 0.5 + 1));
prob1 = prob2;

alphabet1 = (1 : 2 : num_cl + 2);
alphabet2 = (2 : 2 : num_cl + 2);
Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet2; prob2]);
% Q: App1 is always accessing odd cacheline, App2 is always accessing even