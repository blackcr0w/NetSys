global cl;
sum = 0;
for i = 0 : 31
    for j = i * 16 + 1 : i * 16 + 8
        if cl(j) ~= 0
            sum = sum + 1;
        end
    end
end
            