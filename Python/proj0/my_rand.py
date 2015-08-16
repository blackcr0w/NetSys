#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation '''

__author__ = ' Mingjie Zhao '

import random
import helpers

CACHE_SIZE = 512  # cache size = 512B;(should be: 2MB)
CACHELINE_SIZE = 1  # cacheline size = 1B;(64B)
NUM_CL = CACHE_SIZE / CACHELINE_SIZE  # the number of cacheline
APP_MEM = 10 * 0.5 * CACHE_SIZE  # workingset size of every app = 5 * CL; (50 * cache_size)

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
		rand_temp[0] = random.randint(0, num_app1cl1 - 1)
	else:
		rand_temp[0] = random.randint(num_app1cl1, num_app1cl2 - 1)
	if rand_num2 <= 0.9:
		rand_temp[1] = random.randint(num_app1cl2, num_app2cl1 - 1)
	else:
		rand_temp[1] = random.randint(num_app2cl1, num_app2cl2 - 1)

	return rand_temp

helpers.hello()



