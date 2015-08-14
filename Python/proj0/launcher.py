#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation '''

__author__ = ' Mingjie Zhao '

cache_size = 512  # cache size = 512B;(2MB)
cacheline_size = 1  # cacheline size = 1B;(64B)
num_cl = cache_size / cacheline_size  # the number of cacheline
app_mem = 5 * pow(2, 10)  # workingset size of every app = 5KB;should be: 100 * cache_size
num_memaccess = app_mem / cacheline_size
set_size = 16  # 16-way set-associated, every set has 16 cachelines
num_set = num_cl / set_size  # number of set
n = 20000  # n: each application will access the memory for millions of times;
hit  = 0; hit_app1 = 0; hit_app2 = 0; # hit is total hit_times, hit_app1 is the time app1 hits
cl = zeros(1, num_cl); % cl stores the data of all cachelines;


def launcer():
