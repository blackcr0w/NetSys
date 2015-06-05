alphabet = 1 : 1000; 
prob1 = [0.7 0.1]; prob2 = ones(1, 998); prob2 = prob2 .* (0.2 / 998); prob = [prob1, prob2];
randsrc(100,1,[alphabet; prob]);