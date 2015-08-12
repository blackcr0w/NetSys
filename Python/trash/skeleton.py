#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a simple skeleton code for the 
simulation, which implements a hard isolation.
cacheline number: 4
app number: 2
working set size per app: 32 * cacheline 
for cacheline, 0 - 1 is assigned to app1
2 - 3 is assigned to app2 '''

__author__ = ' Mingjie Zhao '

import random
import matplotlib.pyplot as plt

# these are the global variables:
N = 5  # run the program for N times
S1 = []  # S1 represents the memory access series of app1
S2 = []  # S2 represents the memory access series of app2
LRU = [-1 for _ in range(4)] # LRU keeps track of the LRU of all cachelines
LRU_CURRENT = 0  # the current time
CL = [-1 for _ in range(4)]  # init the value  to -1
LRU_MAX = float('inf')


def replace(cl_to_update, rand_temp):
	global CL, LRU_CURRENT
	CL[cl_to_update] = rand_temp
	LRU[cl_to_update] = LRU_CURRENT
	LRU_CURRENT = LRU_CURRENT + 1
	print('lru', LRU)


def rand_gen(app):
	if app == 1:
		return random.randint(0, 3)
	elif app == 2:
		return random.randint(4, 7)

def getLRU(app):
	global LRU_MAX, LRU 
	min_lru = LRU_MAX
	min_lru_place = -1
	if app == 1:
		for i in range(2):
			if LRU[i] < min_lru:
				min_lru = LRU[i]
				min_lru_place = i
	if app == 2:
		for i in range(2, 4):
			if LRU[i] < min_lru:
				min_lru = LRU[i]
				min_lru_place = i
	return min_lru_place

def main():	
	global S1, S2, CL
	random.seed( 10 )  # seed的位置需要试验一下
	for _ in range(N):
		app = 1
		rand_temp = rand_gen(app)
		print('app1 rand num', rand_temp)
		S1 = S1 + [rand_temp]
		cl_to_update = getLRU(app)
		replace(cl_to_update, rand_temp)
		
		app = 2
		rand_temp = rand_gen(app)
		print('app2 rand num', rand_temp)
		S2 = S2 + [rand_temp]
		cl_to_update = getLRU(app)
		replace(cl_to_update, rand_temp)

		print('s1', S1)
		print('s2', S2)
		print('cl', CL)

main()



