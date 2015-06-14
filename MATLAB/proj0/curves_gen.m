% function curves_gen
% this function is uese to draw all curves 
% global s1;

% the next is drawing the Probability density function and cumulative
% distribution function of current accessing pattern
close all;
global num_memaccess;

figure, subplot(1,2,1),ecdf(s1);
title('cdf of app1');
[f, xc] = ecdf(s1);
subplot(1, 2, 2), ecdfhist(f, xc);
title('pdf of app1');
% s1min = min(s1);
% s1max = max(s1);
% xp = linspace(s1min, s1max, 20);
% f = ksdensity(s1,xp, 'bandwidth', 1);
% subplot(1,2,2), plot(xp, f, '+');
% % axis([0 200 0 1]);
% title('pdf fo app1');

figure, subplot(1,2,1), ecdf(s2);
title('cdf of app2');
[f, xc] = ecdf(s2);
subplot(1, 2, 2), ecdfhist(f, xc);
title('pdf of app2')

% m1 = [0.45, 0.5, 0.7, 0.8];
% improved_hitrate = [0.0057, 0.0057, 0.0057 0.0030];
% figure, plot(m1,improved_hitrate);
% xlabel ('probability of m1');
% ylabel ('improved overall hit rate');
% title('how hit rate improves when access pattern changes');
% axis([0.45 1 0 0.006]);



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
% 
