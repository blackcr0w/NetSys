function Y = rand_gen2
global alphabet1 alphabet2 prob;
Y(1) = randsrc(1, 1, [alphabet1; prob]);
Y(2) = randsrc(1, 1, [alphabet2; prob]);
