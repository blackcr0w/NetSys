#!/usr/bin/env python3
# -*- coding: utf-8 -*-

''' this is a launcher of the simulation '''

__author__ = ' Mingjie Zhao '

import random

def randgen():
	random.seed(10)
	a = random.random()
	b = random.random()
	c = random.random()
	d = random.random()
	e = random.random()
	f = random.random()
	g = random.random()
	print(a, b, c, d, e, f, g)

randgen()