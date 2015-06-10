% function curves_gen
% this function is uese to draw all curves 
% global s1;

% the next is drawing the Probability density function and cumulative
% distribution function of current accessing pattern
close all;
global num_memaccess;
figure, ecdf(s1);
title('cdf of app1');



% s1min = min(s1);
% s1max = max(s1);
% xp = linspace(s1min, s1max, 20);
% f = ksdensity(s1,xp);
% figure, plot(xp, f, '+');
% title('pdf fo app1');
% 
% prob1 = [0.7 0.1]; prob2 = ones(1, num_memaccess / 2 - 2); 
% prob2 = prob2 * (0.2 / (num_memaccess / 2 - 2));
% prob = [prob1 prob2];
% alphabet = (1 : 2 : num_memaccess);
% figure, plot(alphabet, prob, '*')
% title('pdf of app1');
% axis([0 100 0 0.8]);
% 
% hit = 1287 * ones(1, 20);
% hit_rate = hit / 1600;
% hit_rate2 = hit_rate;
% MAX = 1 : 20;
% figure, plot(MAX, hit_rate, 'r*', 'LineWidth',0.5);
% hold on;
% plot(MAX, hit_rate2, 'b-', 'LineWidth',1);
% legend('soft isolation','hard isolation');
% title('hit rate when MX are 1->20 ')
% axis([1 20 0 1]);
% xlabel ('MAX');
% ylabel ('hit rate');
% 
% hit = 14 * ones(1, 40);
% hit_rate = hit / 1600;
% hit_rate2 = hit_rate;
% MAX = 1 : 40;
% figure, plot(MAX, hit_rate, 'r*', 'LineWidth',0.5);
% hold on;
% plot(MAX, hit_rate2, 'b-', 'LineWidth',1);
% legend('soft isolation','hard isolation');
% title('hit rate when MX are 1->20 ')
% axis([1 20 0 0.1]);
% xlabel ('MAX');
% ylabel ('hit rate');

