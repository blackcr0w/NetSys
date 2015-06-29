function Y = schedule_gen(sche_const)

alphabet = [1 2];
prob = [sche_const 1 - sche_const];
Y = randsrc(1, 1, [alphabet; prob]);