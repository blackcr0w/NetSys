x = [3 4 5 9 3 4 5 9 10];
% a(x) = zeros(1, pow2(1, 48));
a(x) = zeros(1, 2^48);
for i = 1 : numel(x)
    xx = x(i);
    if a(xx) == 1
        a(xx) = a(xx) + 1;
    else
        a(x) = 1;
    end
end