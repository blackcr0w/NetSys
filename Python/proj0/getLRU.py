#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is the funciton which get the cache line 
number which is least recently used '''

__author__ = ' Mingjie Zhao '

def getLRU(base, base0):
	global LRU_STAMP, LRU
	lru_min_replace = float('inf')
	for i in range(base0 + base, base0 +  base + 8):
		if LRU_STAMP[i] < lru_min_replace:
			lru_min_replace = LRU_STAMP[i]
			lru_ = i
	return lru_

	# min_lru = LRU_MAX
	# min_lru_place = -1
	# if app == 1:
	# 	for i in range(2):
	# 		if LRU[i] < min_lru:
	# 			min_lru = LRU[i]
	# 			min_lru_place = i
	# if app == 2:
	# 	for i in range(2, 4):
	# 		if LRU[i] < min_lru:
	# 			min_lru = LRU[i]
	# 			min_lru_place = i
	# return min_lru_place
