#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation of soft isolation '''

__author__ = ' Mingjie Zhao '

# TODO: 
# 1. Transform everything to OOP
# 2. Use the logging to debug
# 3. seperate it in different files, call functions and variables in diff files
# 4. Use PyPlot to draw
# 5. how to cleare the frame??

from random import randint, random, seed
# import helpers
from operator import mod
from math import floor

CACHE_SIZE = 512  # cache size = 512B;(should be: 2MB)
CACHELINE_SIZE = 1  # cacheline size = 1B;(64B)
NUM_CL = round(CACHE_SIZE / CACHELINE_SIZE)  # the number of actual cacheline
APP_MEM = 5 * 0.5 * CACHE_SIZE  # workingset size of every app = 5 * CL; (50 * cache_size)
NUM_MEMACCESS = APP_MEM / CACHELINE_SIZE  # the possible number of cache access one app can
SET_SIZE = 16  # 16-way set-associated, every set has 16 cachelines
NUM_SET = NUM_CL / SET_SIZE  # number of set
N = 1  # n: each application will access the memory for millions of times;
HIT1 = 0; HIT2 = 0; HIT_APP1 = 0; HIT_APP2 = 0; # hit is total hit_times, hit_app1 is the time app1 hits
CL = [-1 for x in range(NUM_CL)]  # CL stores the data of all cachelines; 
# CL[i] = -1 means empty cacheline
MAX = 5  # MAX is the isolation algorithm parameter, the surviting time
X = [MAX for x in range(NUM_CL)]  # x keeps track of the status of all cachelines
LRU = 1
LRU_STAMP = [-1 for x in range(NUM_CL)]
S1 = [0 for x in range(N)]  # S1 is the memory accessing addresses of app1
S2 = [0 for x in range(N)]  # S2 is the memory accessing addresses of app2

# def rand_init():
	
# 	prob1_factor1 = 0.9 / num_app1cl1
# 	prob1_factor2 = 0.1 / num_app1cl2
# 	prob11 = ones(1, num_app1cl1); prob11 = prob11 * prob1_factor1;
# 	prob12 = ones(1, num_app1cl2); prob12 = prob12 * prob1_factor2;
# 	prob1 = [prob11 prob12];

# generating random int (0.05cl: p = 0.9, 4.95cl: p = 0.9; 4cl: p = 0.9, 6cl: p = 0.1)
def get_rand():
	global NUM_CL, num_app1cl2
	num_app1cl1 = round(NUM_MEMACCESS * 0.01)
	num_app1cl2 = round(NUM_MEMACCESS * 0.99) + num_app1cl1
	num_app2cl1 = round(NUM_MEMACCESS * 0.4) + num_app1cl2
	num_app2cl2 = round(NUM_MEMACCESS * 0.6) + num_app2cl1
	print('this is num_app1cl1 ', num_app1cl1)
	print('this is num_app1cl2 ', num_app1cl2)
	print('this is num_app2cl1 ', num_app2cl1)

	rand_num1 = random()
	rand_num2 = random()
	rand_temp = [-1, -1]
	if rand_num1 < 0.9:
		# print(num_app1cl1)
		rand_temp[0] = randint(0, num_app1cl1 - 1)
	else:
		rand_temp[0] = randint(num_app1cl1, num_app1cl2 - 1)
	if rand_num2 < 0.9:
		rand_temp[1] = randint(num_app1cl2, num_app2cl1 - 1)
	else:
		rand_temp[1] = randint(num_app2cl1, num_app2cl2 - 1)

	return rand_temp

def getLRU(base, base0):
	global LRU_STAMP, LRU
	lru_ = float('inf')
	for i in range(base0 + base, base0 +  base + 8):
		if  LRU_STAMP[i] < lru_:
			lru_ = LRU_STAMP[i]
			_lru = i
	return _lru

def replace_soft(si):
	# TODO: modify this part, and make the LRU and return a sigle, 
	# non-repeatingpart of code
	global CL, X, NUM_SET, HIT1, HIT_APP1, HIT_APP2, LRU_STAMP, LRU, MAX, num_app1cl2
	set_num = mod(si, NUM_SET)
	base0 = round(set_num * 16)  # base0 is the starting point within cacheline set
	if si >= num_app1cl2:  # not sure
		base = 8
	else:
		base = 0
	base0 = round(base0)
	base = round(base)
	
	# when hit happens: check the whole set to see if hit.
	for i in range(base0, base0 + 16):
		if CL[i] == si:
			#** print('hit ', i, ' ', si)
			HIT1 = HIT1 + 1
			if base == 8:
				HIT_APP2 = HIT_APP2 + 1
			else:
				HIT_APP1 = HIT_APP1 + 1			
			X[i] = MAX
			lru_update(i)
			return

	# when miss happens and empty cache line exists:
	# only check half of the whole set which belongs to current app
	for i in range(base0 + base, base0 + base + 8):
		if CL[i] == -1:
			CL[i] = si
			lru_update(i)
			X[i] = MAX
			return
	# when miss happens and there is soft-isolatable cacheline:
	# check the whole set to see
	for i in range(base0, base0 + 16):
		if X[i] == 0:
			#**print('soft-siolation: ' + i)
			# cnt3[cnt30] = i
			# cnt30 = cnt30 + 1
			# cnt1 = cnt1 + 1
			CL[i] = si
			X[i] = MAX
			lru_update(i)
			return

	# when miss happens: using LRU and hard-isolation
	# check half of the set
	ii = getLRU(base0, base)
	CL[ii] = si
	X[ii] = MAX
	lru_update(ii)
	# for the half of set belongs to the current app:
	# using linear Dying Algorithm to shorten their lives
	for i in range(base0 + base, base0 + base + 8):
		if i != ii:
			X[i] = X[i] - 1
			X[i] = floor(X[i])

	# for the half of set belongs to the other app:
	# using multiply-Dying Algorithm to shorten their lives
	seg_num = 8 - base
	for i in range(base0 + seg_num, base0 + seg_num + 8):
		X[i] = X[i] * 0.5
		X[i] = floor(X[i])

	
def replace_hard(si):
	global NUM_SET, num_app1cl2, HIT2, HIT_APP1, HIT_APP2, CL
	set_num = mod(si, NUM_SET)
	base0 = set_num * 16  # base0 is the starting point of the base
	base = -1  # base is the offset of different apps
	if si >= num_app1cl2:
		base = 8
	else:
		base = 0
	base0 = round(base0)
	base = round(base)

	# when hit happens
	for i in range(base0 + base, base0 + base + 8):
		if CL[i] == si:
			HIT2 = HIT2 + 1
			if base == 8:
				HIT_APP2 = HIT_APP2 + 1
			else:
				HIT_APP1 = HIT_APP1 + 1
			lru_update(i)
			return

	# when miss happens and there exists empty cacheline
	for i in range(base0 + base, base0 + base + 8):
		if CL[i] == -1:
			CL[i] = si
			lru_update(i)
			return

	# if there is no more room, using LRU
	ii = getLRU(base0, base)
	CL[ii] = si
	lru_update(ii)


def lru_update(ii):
	global LRU, LRU_STAMP
	LRU_STAMP[ii] = LRU
	LRU = LRU + 1


def launcher_soft():
	global S1, S2, N, HIT1, HIT_APP1, HIT_APP2
	rand_temp = [-1, -1]
	seed(5)
	for i in range(N):
		rand_temp = get_rand()
		S1[i] = rand_temp[0]
		S2[i] = rand_temp[1]
		replace_soft(S1[i])
		replace_soft(S2[i])
	hits = [HIT1, HIT_APP1, HIT_APP2]

	print(hits)
	# print(S1)
	# print(S2)
	# print(CL)

def launcher_hard():
	global S1, S2, N, HIT2, HIT_APP1, HIT_APP2
	rand_temp = [-1, -1]
	seed(5)
	for i in range(N):
		rand_temp = get_rand()
		S1[i] = rand_temp[0]
		S2[i] = rand_temp[1]
		replace_hard(S1[i])
		replace_hard(S2[i])
	hits = [HIT2, HIT_APP1, HIT_APP2]
	print(hits)
	# print(S1)
	# print(S2)
	# print(CL)

