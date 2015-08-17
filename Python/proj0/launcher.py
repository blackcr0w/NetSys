#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation of soft isolation '''

__author__ = ' Mingjie Zhao '

from random import randint, random
import helpers import *
from operator import mod

CACHE_SIZE = 512  # cache size = 512B;(should be: 2MB)
CACHELINE_SIZE = 1  # cacheline size = 1B;(64B)
NUM_CL = CACHE_SIZE / CACHELINE_SIZE  # the number of cacheline
APP_MEM = 10 * 0.5 * CACHE_SIZE  # workingset size of every app = 5 * CL; (50 * cache_size)
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

# def rand_init():
	
# 	prob1_factor1 = 0.9 / num_app1cl1
# 	prob1_factor2 = 0.1 / num_app1cl2
# 	prob11 = ones(1, num_app1cl1); prob11 = prob11 * prob1_factor1;
# 	prob12 = ones(1, num_app1cl2); prob12 = prob12 * prob1_factor2;
# 	prob1 = [prob11 prob12];

# generating random int (0.05cl: p = 0.9, 4.95cl: p = 0.9; 4cl: p = 0.9, 6cl: p = 0.1)
def get_rand():
	global APP_MEM
	num_app1cl1 = round(APP_MEM * 0.5 * 0.1)
	num_app1cl2 = round(APP_MEM * 0.5 * 9.9) + num_app1cl1
	num_app2cl1 = round(APP_MEM * 0.5 * 2) + num_app1cl2
	num_app2cl2 = round(APP_MEM * 0.5 * 8) + num_app2cl1
	rand_num1 = random.random()
	rand_num2 = random.random()
	rand_temp = [-1, -1]
	if rand_num1 <= 0.9:
		rand_temp(0) = random.randint(0， num_app1cl1 - 1)
	else:
		rand_temp(0) = random.randint(num_app1cl1, num_app1cl2 - 1)
	if rand_num2 <= 0.9:
		rand_temp(1) = random.randint(num_app1cl2, num_app2cl1 - 1)
	else:
		rand_temp(1) = random.randint(num_app2cl1, num_app2cl2 - 1)

	return rand_temp

def replace_soft(si):
	global CL, NUM_SET
	set_num = operator.mod(si, NUM_SET)
	base0 = set_num * 16 + 1
	if si > num_app1:
		

def replace_hard(si):



def launcer():
	rand_temp = [-1, -1]
	random.seed(10)
	for i in range(N):
		rand_temp = get_rand()
		S1[i] = rand_temp(0)
		s2[i] = rand_temp(1)
		helpers.replace_soft(S1[i])
		helpers.replace_soft(S2[i])
	hits = [HIT, HIT_APP1, HIT_APP2]

launcher()
