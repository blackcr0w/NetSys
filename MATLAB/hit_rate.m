
access = [400 500, 600, 700];
access = 2 * access;
hit = [642, 798, 956, 1113]

for i = 1 : 4
    hit_rate(i) = hit(i) / (2 * access(i));
end

plot(access, hit_rate);