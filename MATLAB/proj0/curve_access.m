clear; close all;

addr = load('addrDec.txt');
freq = load('freq.txt');
freq = freq / 55203696;
[a,b]=hist(freq);
plot(b,a/sum(a));

% [y,x]=hist(freq,100);         %??100??????(???????????)
% y=y/length(freq)/mean(diff(x));   %?????? ??????????????
% bar(x,y,1);
% axis([0 0.01 0 1400]);


% cdfplot(freq);
% 
% cdf = cumsum(freq);
% figure, plot(addr,cdf,'b-','LineWidth',6); hold on
% figure, plot(addr,normcdf(addr,0,1),'r-','LineWidth',2);
% figure, plot(addr, freq);
% figure, stem(addr, freq);
