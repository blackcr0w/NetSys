
% this is the function for the outside loop;
% and draw the figure;

clear all; close all; clc;

global MAX hit hit2 n;

hitrate = double(zeros(1, 500));
hitrate2 = double(zeros(1, 500));

for MAX = 1 : 10
    i = MAX;
    SoftIsolation_a;
    hitrate(i) = hit / (n*2);
    hitreate2(i) = hit2 / (n*2);
end;


figure, plot(MAX, hitrate);
axis([0 800 0 1]);
figure, plot(hitrate2, MAX);
axis([0 800 0 1]);
% next will draw the case when MAX = 0;
