"""
Author: Messi-Q

Date: Created on 12:39 PM 2021-04-06  
"""

import os
import shutil

# data_list = os.listdir('./data')
#
#
# path2 = './source_graph_data/edges/'
# target_path2 = './data1/source_graph_data/edges/'
# path2_list = os.listdir(path2)
# print(path2_list)
#
# path3 = './source_graph_data/nodes/'
# target_path3 = './data1/source_graph_data/nodes/'
# path3_list = os.listdir(path3)
# print(path3_list)
#
# for i in path2_list:
#     if i in data_list:
#         print(i)
#         shutil.copy(path2 + i, target_path2 + i)
#         shutil.copy(path3 + i, target_path3 + i)
#
data_list1 = os.listdir('./data')
data_list2 = os.listdir('./data1/source_graph_data/edges/')
data_list3 = os.listdir('./data1/source_graph_data/nodes/')

for i in range(len(data_list1)):
    print(data_list1[i])
    os.rename('./data/' + data_list1[i], './data/' + str(i + 1) + '.sol')

for i in range(len(data_list2)):
    print(data_list2[i])
    os.rename('./data1/source_graph_data/edges/' + data_list2[i], './data1/source_graph_data/edges/' + str(i + 1) + '.sol')

for i in range(len(data_list3)):
    print(data_list3[i])
    os.rename('./data1/source_graph_data/nodes/' + data_list3[i], './data1/source_graph_data/nodes/' + str(i + 1) + '.sol')
