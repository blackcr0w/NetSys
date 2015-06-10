function Y = rand_gen4
% this is the case of a worse performanc access pattern, 
% app1 and app2 works like "round robin", which has num_memaccess = num_cl + 1;

global num_cl;

prob11 = [0.7 0.2]; prob12 = ones(1, num_cl * 0.5 - 2); 
prob12 = prob12 * (0.1 / (num_cl * 0.5 - 2));
prob1 = [prob11 prob12];

prob2 = prob1;

alphabet1 = (1 : 2 : num_cl);
alphabet2 = (2 : 2 : num_cl);
Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet2; prob2]);
% Q: App1 is always accessing odd cacheline, App2 is always accessing even