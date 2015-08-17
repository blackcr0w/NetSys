#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation of soft isolation '''

__author__ = ' Mingjie Zhao '

from random import randint, random
import helpers import *
from operator import mod
from getLRU import getLRU
from math import floor

CACHE_SIZE = 512  # cache size = 512B;(should be: 2MB)
CACHELINE_SIZE = 1  # cacheline size = 1B;(64B)
NUM_CL = CACHE_SIZE / CACHELINE_SIZE  # the number of actual cacheline
APP_MEM = 10 * 0.5 * CACHE_SIZE  # workingset size of every app = 5 * CL; (50 * cache_size)
NUM_MEMACCESS = APP_MEM / CACHELINE_SIZE  # the possible number of cache access one app can
SET_SIZE = 16  # 16-way set-associated, every set has 16 cachelines
NUM_SET = NUM_CL / SET_SIZE  # number of set
N = 20000  # n: each application will access the memory for millions of times;
HIT  = 0; HIT_APP1 = 0; HIT_APP2 = 0; # hit is total hit_times, hit_app1 is the time app1 hits
CL = [-1 for x in range(NUM_CL)]  # CL stores the data of all cachelines;
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
	global NUM_CL
	num_app1cl1 = round(NUM_CL * 0.5 * 0.1)
	num_app1cl2 = round(NUM_CL * 0.5 * 9.9) + num_app1cl1
	num_app2cl1 = round(NUM_CL * 0.5 * 2) + num_app1cl2
	num_app2cl2 = round(NUM_CL * 0.5 * 8) + num_app2cl1
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
	# TODO: modify this part, and make the LRU and return a sigle, 
	# non-repeatingpart of code
	global CL, NUM_SET
	set_num = operator.mod(si, NUM_SET)
	base0 = set_num * 16 + 1
	if si > num_app1:
		base = 8
	else:
		base = 0
	for i in range(base, base + 16):
		if cl(i) == si:
			if base == 8:
				HIT_APP2 = HIT_APP2 + 1
			else:
				HIT_APP1 = HIT_APP1 + 1
			hit = hit + 1
			X(i) = MAX
			LRU_STAMP(i) = LRU
			LRU = LRU + 1
			return
	for i in range(base0 + base, base0 + base + 8):
		if cl(i) == 0:
			cl(i) = si
			LRU_STAMP(i) = LRU
			LRU = LRU + 1
			X(i) = MAX
			return
	for i in range(base0, base0 + 16):
		if x(i) == 0:		
			cnt3(cnt30) = i
	        cnt30 = cnt30 + 1
	        cnt1 = cnt1 + 1
	        cl(i) = si
	        X(i) = MAX
	        LRU_STAMP(i) = LRU
	        LRU = LRU + 1
	ii = getLRU(base0, base)
	CL(ii) = si
	X(ii) = MAX

	for i in range(base0 + base, base0 + base + 8):
		if i != ii:
			X(i) = X(i) - 1
			X(i) = floor(X(i))
	LRU_STAMP(ii) = LRU
	LRU = LRU + 1


def replace_hard(si):
	return

def launcer():
	rand_temp = [-1, -1]
	random.seed(10)
	for i in range(N):
		rand_temp = get_rand()
		S1[i] = rand_temp(0)
		s2[i] = rand_temp(1)
		replace_soft(S1[i])
		replace_soft(S2[i])
	hits = [HIT, HIT_APP1, HIT_APP2]

launcher()
