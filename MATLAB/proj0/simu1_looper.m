% function simu1_looper
portion = 1 : 1 : 9; portion  = portion * 0.1;
hits1 = zeros(9, 4);
hits2 = zeros(9, 3);
hit1 = zeros(1, 9); hit1_app1 = zeros(1, 9); hit1_app2 = zeros(1, 9); hit1_cnt1 = zeros(1, 9); 
hit2 = zeros(1, 9); hit2_app1 = zeros(1, 9); hit2_app2 = zeros(1, 9);


for i = 1 : 9
    hits1(i, : ) = schedule_launcher(portion(i));
    hit1(i) = hits1(i, 1);
    hit1_app1(i) = hits1(i, 2);
    hit1_app2(i) = hits1(i, 3);
    hit1_cnt1 = hits1(i, 4);
    
    hits2(i, : ) = schedule_launcher2(portion(i));
    hit2(i) = hits2(i, 1);
    hit2_app1(i) = hits2(i, 2);
    hit2_app2(i) = hits2(i, 3);
end
    
