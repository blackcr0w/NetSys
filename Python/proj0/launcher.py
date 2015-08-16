#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation '''

__author__ = ' Mingjie Zhao '

import random

CACHE_SIZE = 512  # cache size = 512B;(should be: 2MB)
CACHELINE_SIZE = 1  # cacheline size = 1B;(64B)
NUM_CL = CACHE_SIZE / CACHELINE_SIZE  # the number of cacheline
APP_MEM = 10 * pow(2, 10)  # workingset size of every app = 5KB; (100 * cache_size)
NUM_MEMACCESS = APP_MEM / CACHELINE_SIZE
SET_SIZE = 16  # 16-way set-associated, every set has 16 cachelines
NUM_SET = NUM_CL / SET_SIZE  # number of set
N = 20000  # n: each application will access the memory for millions of times;
HIT  = 0; HIT_APP1 = 0; HIT_APP2 = 0; # hit is total hit_times, hit_app1 is the time app1 hits
CL = [0 for x in range(NUM_CL)]  # CL stores the data of all cachelines;
MAX = 5  # MAX is the isolation algorithm parameter, the surviting time
X = [MAX for x in range(NUM_CL)]  # x keeps track of the status of all cachelines
LRU = 1
LRU_STAMP = [-1 for x in range(NUM_CL)]
S1 = [0 for x in range(N)]
S2 = [0 for x in range(N)]

def rand_init():
	global NUM_CL, NUM_APP1, ALPHABET1, ALPHABET2, PROB1, PROB2
	num_app1cl1 = round(NUM_CL * 0.5)
	num_app1cl2 = round(NUM_CL * 0.5)
	prob1_factor1 = 0.9 / num_app1cl1
	prob1_factor2 = 0.1 / num_app1cl2
	prob11 = ones(1, num_app1cl1); prob11 = prob11 * prob1_factor1;
	prob12 = ones(1, num_app1cl2); prob12 = prob12 * prob1_factor2;
	prob1 = [prob11 prob12];
	
# generating random int (0.1cl: p = 0.9, 9.9cl: p = 0.9; 4cl: p = 0.9, 6cl: p = 0.1)
def get_rand():  






def launcer():
	rand_temp = [-1, -1]
	random.seed(10)
	for i in range(N):
		rand_temp = get_rand()
		S1[i] = rand_temp(0)
		s2[i] = rand_temp(1)
		replace_1(S1[i])
		replace_1(S2[i])
	hits = [HIT, HIT_APP1, HIT_APP2]

launcher()
