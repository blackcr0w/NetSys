% function curves_gen
% this function is uese to draw all curves 
% global s1;

% the next is drawing the Probability density function and cumulative
% distribution function of current accessing pattern
% close all;
global num_memaccess;

s1_prob = sche_const; % edited this line, sche_const is the prob of s1??
hit_app1_num = sche_const .* 60000; hit_app2_num = 60000 - hit_app1_num;
hitrate1 = hit1 / 60000 ;
hitrate2 = hit2 / 60000;
hitrate1_app1 = hit1_app1 ./ hit_app1_num;
hitrate1_app2 = hit1_app2 ./ hit_app2_num;
hitrate2_app1 = hit2_app1 ./ hit_app1_num;
hitrate2_app2 = hit2_app2 ./ hit_app2_num;
overall_improv = hitrate1 - hitrate2;
app1_improv = hitrate1_app1 - hitrate2_app1;
app2_improv = hitrate1_app2 - hitrate2_app2;
figure, plot(s1_prob, overall_improv, 'b');
grid on;
set(gca,'YMinorGrid','on');
hold on; 
plot(s1_prob, app1_improv, 'g--*');
hold on; 
plot(s1_prob, app2_improv, 'r--+');
xlabel ('changing the scheduling');
ylabel ('hit rate improvement');
title('work set size: app1 = 0.5 * cache, app2 = 0.5 * cache');
h = legend('overall improvement','app1 improvemetn', 'app2 improvement');
set(h,'Fontsize',12);


% s2_hitrate1_app1 = hit1_app1 / 60000;
% s2_hitrate1_app2 = hit1_app2 / 20000;
% s2_hitrate2_app1 = hit2_app1 / 60000;
% s2_hitrate2_app2 = hit2_app2 / 20000;
% s2_overall_improv = s2_hitrate1 - s2_hitrate2;
% s2_app1_improv = s2_hitrate1_app1 - s2_hitrate2_app1;
% s2_app2_improv = s2_hitrate1_app2 - s2_hitrate2_app2;
% figure, plot(s2_prob, s2_overall_improv, 'b');
% grid on;
% set(gca,'YMinorGrid','on');
% hold on; 
% plot(s2_prob, s2_app1_improv, 'g--*');
% hold on; 
% plot(s2_prob, s2_app2_improv, 'r--+');
% xlabel ('the partition of app1 with probabilitiy of 0.9');
% ylabel ('hit rate improvement');
% title('schedule3, the variation of hit rate when access pattern changes');
% h = legend('overall improvement','app1 improvemetn', 'app2 improvement');
% set(h,'Fontsize',12);


% s_prob_app1_part1 = [0.1 0.3 0.5 0.7 0.8 0.9];
% s_hit1 = [47625 46548 45060 42784 41344 39806];
% s_hit1_app1 = [36353 36214 35721 34338 33306 32107];
% s_hit1_app2 = [11272 10334 9339 8446 8038 7699];
% s_hit2 = [44638 44464 44197 43020 41649 39951];
% s_hit2_app1 = [36748 36574 36307 35130 33759 32061];
% s_hit2_app2 = [7890 7890 7890 7890 7890 7890];
% s_hitrate1 = s_hit1 / 60000;
% s_hitrate2 = s_hit2 / 60000;
% s_hitrate1_app1 = s_hit1_app1 / 40000;
% s_hitrate1_app2 = s_hit1_app2 / 20000;
% s_hitrate2_app1 = s_hit2_app1 / 40000;
% s_hitrate2_app2 = s_hit2_app2 / 20000;
% s_overall_improv = s_hitrate1 - s_hitrate2;
% s_app1_improv = s_hitrate1_app1 - s_hitrate2_app1;
% s_app2_improv = s_hitrate1_app2 - s_hitrate2_app2;


% prob_app1_part1 = [0.1 0.3 0.5 0.7 0.8 0.9];
% hit1 = [30599 29297 27492 25213 23904 22960];
% hit1_app1 = [18088 17858 17045 15538 14586 13832];
% hit1_app2 = [12511 11439 10447 9675 9322 9128];
% hit2 = [25760 25548 25262 24758 24044 23464];
% hit2_app1 = [18032 17784 17397 16928 16322 15646];
% hit2_app2 = [7728 7764 7865 7830 7722 7818];
% hitrate1 = hit1 / 40000;
% hitrate2 = hit2 / 40000;
% hitrate1_app1 = hit1_app1 / 20000;
% hitrate1_app2 = hit1_app2 / 20000;
% hitrate2_app1 = hit2_app1 / 20000;
% hitrate2_app2 = hit2_app2 / 20000;
% overall_improv = hitrate1 - hitrate2;
% app1_improv = hitrate1_app1 - hitrate2_app1;
% app2_improv = hitrate1_app2 - hitrate2_app2;
% figure, plot(prob_app1_part1, overall_improv, 'b');
% grid on;
% hold on; 
% plot(prob_app1_part1, app1_improv, 'g');
% hold on; 
% plot(prob_app1_part1, app2_improv, 'r');
% 
% % hold on; 
% % figure, plot(prob_app1_part1, s_overall_improv, 'b--*');
% % grid on;
% % hold on;
% % plot(prob_app1_part1, s_app1_improv, 'g--*');
% % hold on;
% % plot(prob_app1_part1, s_app2_improv, 'r--*');
% 
% xlabel ('the partition of app1 with probabilitiy of 0.9');
% ylabel ('hit rate improvement');
% title('the variation of hit rate when access pattern changes');
% h = legend('overall improvement','app1 improvemetn', 'app2 improvement');
% set(h,'Fontsize',12);
% 
% figure, subplot(1,2,1),ecdf(s1);
% title('cdf of app1');
% [f, xc] = ecdf(s1);
% subplot(1, 2, 2), ecdfhist(f, xc);
% title('pdf of app1');
% % s1min = min(s1);
% % s1max = max(s1);
% % xp = linspace(s1min, s1max, 20);
% % f = ksdensity(s1,xp, 'bandwidth', 1);
% % subplot(1,2,2), plot(xp, f, '+');
% % % axis([0 200 0 1]);
% % title('pdf fo app1');
% 
% figure, subplot(1,2,1), ecdf(s2);
% title('cdf of app2');
% [f, xc] = ecdf(s2);
% subplot(1, 2, 2), ehist(f, xc);
% title('pdf of app2')
% 
% % m1 = [0.45, 0.5, 0.7, 0.8];
% % improved_hitrate = [0.0057, 0.0057, 0.0057 0.0030];
% % figure, plot(m1,improved_hitrate);
% % xlabel ('probability of m1');
% % ylabel ('improved overall hit rate');
% % title('how hit rate improves when access pattern changes');
% % axis([0.45 1 0 0.006]);
% 
% 
% 
% % prob1 = [0.7 0.1]; prob2 = ones(1, num_memaccess / 2 - 2); 
% % prob2 = prob2 * (0.2 / (num_memaccess / 2 - 2));
% % prob = [prob1 prob2];
% % alphabet = (1 : 2 : num_memaccess);
% % figure, plot(alphabet, prob, '*')
% % title('pdf of app1');
% % axis([0 100 0 0.8]);
% % 
% % hit = 1287 * ones(1, 20);
% % hit_rate = hit / 1600;
% % hit_rate2 = hit_rate;
% % MAX = 1 : 20;
% % figure, plot(MAX, hit_rate, 'r*', 'LineWidth',0.5);
% % hold on;
% % plot(MAX, hit_rate2, 'b-', 'LineWidth',1);
% % legend('soft isolation','hard isolation');
% % title('hit rate when MX are 1->20 ')
% % axis([1 20 0 1]);
% % xlabel ('MAX');
% % ylabel ('hit rate');
% % 
% % hit = 14 * ones(1, 40);
% % hit_rate = hit / 1600;
% % hit_rate2 = hit_rate;
% % MAX = 1 : 40;
% % figure, plot(MAX, hit_rate, 'r*', 'LineWidth',0.5);
% % hold on;
% % plot(MAX, hit_rate2, 'b-', 'LineWidth',1);
% % legend('soft isolation','hard isolation');
% % title('hit rate when MX are 1->20 ')
% % axis([1 20 0 0.1]);
% % xlabel ('MAX');
% % ylabel ('hit rate');
% % 
