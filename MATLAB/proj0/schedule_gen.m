function Y = schedule_gen(sche_const)
% this function decides which app to run.
% if Y = 1, app1 runs,
% else app2 runs.
alphabet = [1 2];
prob = [sche_const 1 - sche_const];
Y = randsrc(1, 1, [alphabet; prob]);