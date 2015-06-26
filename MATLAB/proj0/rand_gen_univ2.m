function rand_gen_univ2
global alphabet1 alphabet2 prob1 prob2;

Y(1) = randsrc(1, 1, [alphabet1; prob1]);
Y(2) = randsrc(1, 1, [alphabet1; prob1]);
Y(3) = randsrc(1, 1, [alphabet2; prob2]);

% question: how will the new scheduling be?
% A1->A1->A2 or A1->A2->A1??