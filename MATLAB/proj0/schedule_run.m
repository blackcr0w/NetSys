function Y = schedule_run(sche_const)
app_to_run = 0;
for i = 1 : 60000
    app_to_run = schedule_gen(sche_const);
    if app_to_run = 1
        s1 = sche_rand_gen(1);
        replace1(s1);
               

Y = [hit1 hit1_app1 hit1_app2 hit2 hit2_app1 hit2_app2];