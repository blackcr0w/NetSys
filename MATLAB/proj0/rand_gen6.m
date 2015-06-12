function Y = rand_gen6
% a case that soft-isolation should work better
% in this case, app1 and app2 both have 50% of the cache
% app1 only access to a single address, app2 has workset of the size that 
% is num_cl * 0.9

global num_cl;
% num_cl is the total number of cache lines

% prob11 = [0.7 0.2]; prob12 = ones(1, num_cl * 0.5 - 2); 
% prob12 = prob12 * (0.1 / (num_cl * 0.5 - 2));
% prob1 = [prob11 prob12];

prob1 = 1;
num_app2cl = int64(num_cl * 0.9);
prob2 = ones(1, num_app2cl);
format long;
phi = sym('1 / num_app2cl');
prob2 = prob2 * phi;

alphabet1 = 1;
alphabet2 = (2 : 2 : 2 * num_app2cl);
Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet2; prob2]);
% Q: App1 is always accessing odd cacheline, App2 is always accessing even