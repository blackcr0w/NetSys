#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation '''

__author__ = ' Mingjie Zhao '

import random

def get_rand():
	global NUM_CL, NUM_APP1, ALPHABET1, ALPHABET2, PROB1, PROB2
	num_app1cl1 = round(APP_MEM * 0.5 * 0.1)
	num_app1cl2 = round(APP_MEM * 0.5 * 10)
	num_app2cl1 = round(10 * APP_MEM * 0.4)
	num_app2cl2 = round(APP_MEM * 0.6)
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