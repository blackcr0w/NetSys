#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is the funciton which get the cache line 
number which is least recently used '''

__author__ = ' Mingjie Zhao '

def getLRU(base, base0):
	global LRU_STAMP, LRU, LRU_MAX
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
