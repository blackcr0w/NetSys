function Y = rand_gen7
global alphabet1 alphabet2 prob1 prob2;
Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet2; prob2]);
