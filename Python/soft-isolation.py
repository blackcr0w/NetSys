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

# these are the global variables:
N = 5  # run the program for N times
S1 = []  # S1 represents the memory access series of app1
S2 = []  # S2 represents the memory access series of app2
LRU = [-1 for _ in range(4)] # LRU keeps track of the LRU of all cachelines
LRU_CURRENT = 0  # the current time
CL = [-1 for _ in range(4)]  # init the value  to -1
LRU_MAX = float('inf')