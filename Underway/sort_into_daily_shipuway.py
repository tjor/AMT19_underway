#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 25 15:09:04 2023
'' script to sort AMT 23 ship uway data into daily files

@author: tjor
"""

import sys
import os
import numpy as np
#from monda.sorad import access, plots, qc
import logging
import pandas as pd

import shutil

if __name__ == '__main__':


    jdays = np.arange(287,288,1)
        
    for i in range(len(jdays)):
        print(jdays[i])
        dir_i = '2012' + str(jdays[i])
        
        file_i = '/data/datasets/cruise_data/active/AMT22/OSU/Ship_data/Original/daily_' + str(jdays[i])  + '.txt'
        file_i_1 = '/data/datasets/cruise_data/active/AMT22/OSU/Ship_data/Original/daily_' + str(jdays[i]-1) + '.txt'
    
        file_t = '/data/datasets/cruise_data/active/AMT22/OSU/Ship_data/Original/total.txt'
        
        temp_t = pd.read_csv(file_t, sep="^", header=None, skiprows=2,prefix='X')
        data_t = temp_t.X0.str.split('\s+',expand=True)
            
        temp_i = pd.read_csv(file_i, sep="^", header=None, skiprows=2,prefix='X')
        data_i = temp_i.X0.str.split('\s+',expand=True)
        print(len(data_i))
        
        temp_i_1 = pd.read_csv(file_i_1, sep="^", header=None, skiprows=2,prefix='X')
        data_i_1 = temp_i_1.X0.str.split('\s+',expand=True)
        data_i_1 = data_i_1.iloc[:-1]
        print(len(data_i_1))  
        
        data_combined = pd.concat([data_i_1, data_i], axis=0)
        data_combined = data_combined.reset_index(drop=True)
            
        data_i_new = data_combined.iloc[data_combined[1].values == str(jdays[i])]
                     
      #  data_i_new = data_t.iloc[data_t[1].values == str(jdays[i])]
        
        file_i_new = '/data/datasets/cruise_data/active/AMT22/OSU/Ship_data/Original//underway_daily/' + str(dir_i) + '/daily_gps_meta.csv'
        data_i_new.to_csv(file_i_new, sep=',') 
         
    # fn = '/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/underway_data_Seatex-gga_new.txt'
    #  data = pd.read_csv(fn, sep='\t', header=None)
    #
    # fn = '/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/underway_data_Seatex-gga.txt'
    # data = pd.read_csv(fn, sep='\t', skiprows=2, header=None)
    
    # create directories
    # jdays = np.arange(295,296,1)
    # for i in range(len(jdays)):
    #     dir_i = '2013' + str(jdays[i])
    #    print(dir_i)
    #   os.mkdir('/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/seatex_daily/' + str(dir_i))
        
    #   for i in range(len(jdays)):
    #      data_i = data[np.floor(data[1])==jdays[i]]
   #     dir_i = '2013' + str(jdays[i])
    #    print(len(data_i))
     #   data_i.to_csv('/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/underway_daily/' + str(dir_i) + '/seatex-gga.csv') 
    
    #fn = '/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/underway_data_oceanlogger_new.txt'
    #data = pd.read_csv(fn, sep='\t')
    
    
    #for i in range(len(jdays)):
     #   data_i = data[np.floor(data['#julian date and decimal time'])==jdays[i]]
      #  dir_i = '2013' + str(jdays[i])
       # print(len(data_i))
        #data_i.to_csv('/data/datasets/cruise_data/active/AMT23/AMT23/underway/Ships_underway_data/underway_daily/' + str(dir_i) + '/oceanlogger.csv') 
