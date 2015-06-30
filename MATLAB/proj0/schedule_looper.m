clear; close all;
% this is the case when app1 and app2 have the same access
% both uniform, working set = 3 * cacheline * 0.5

sche_const = [0.01 0.1 1 5 10 20 40 50 70 100];
hits1 = zeros(10, 3); hits2 = zeros(10, 3);
hit1 = zeros(1, 9); hit1_app1 = zeros(1, 9); hit1_app2 = zeros(1, 9); hit1_cnt1 = zeros(1, 9); 
hit2 = zeros(1, 9); hit2_app1 = zeros(1, 9); hit2_app2 = zeros(1, 9);

for i = 1 : numel(sche_const)
    hits1(i, : ) = sche_vary_soft(sche_const(i));
    hit1(i) = hits1(i, 1);
    hit1_app1(i) = hits1(i, 2);
    hit1_app2(i) = hits1(i, 3);
    
    hits2(i, : ) = sche_vary_hard(sche_const(i));
    hit2(i) = hits2(i, 1);
    hit2_app1(i) = hits2(i, 2);
    hit2_app2(i) = hits2(i, 3);
end
    
load handel.mat;
nBits = 16;
sound(y,Fs,nBits);

