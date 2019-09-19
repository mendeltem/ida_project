#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jun  5 22:41:24 2019

@author: pandoora
"""

import numpy as np
import matplotlib.pyplot as plt

import pandas as pd


    
def phi(x):
    if x >= 0 and x<= 0.5:
        return 2 * x
    elif x > 0.5 and x <= 1:
        return 2 - 2 * x    
    
def g(x, n):
    temp2= 0
    for i in range(n):
        if i == 0:
            temp = phi(x)
        else:
            temp = phi(temp2)
        temp2 = temp 
    return temp2
    print(temp2)


liste = []

dx = 0.005

for i in range(1000):
    print(dx)
    liste.append(g(dx,4))
    dx += 0.005
    
plt.plot(liste)
