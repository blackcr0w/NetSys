#!/usr/bin/env python3
# -*- coding: utf-8 -*-

' a test module '  # this is the comment for the doc(docstring)

__author__ = 'Mingjie Zhao'

import sys

def test():
	global K
    # args = sys.argv
    # if len(args)==1:
    #         print('Hello, world!')
    # # elif len(args)==2:
    #     print('Hello, %s!' % args[1])
    # else:
    #     print('Too many arguments!')
    K = 1
    print(k)

def bar():
	global K
	print(K)
	K = 2
	print(K)


if __name__=='__main__':
    test()
    bar()