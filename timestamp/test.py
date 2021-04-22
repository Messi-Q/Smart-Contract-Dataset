"""
Author: Messi-Q

Date: Created on 12:39 PM 2021-04-06  
"""

import os
import shutil

error_list = ['129.sol', '130.sol', '237.sol', '1030.sol', '2315.sol', '2391.sol', '2405.sol', '2506.sol', '2529.sol',
              '2575.sol', '2736.sol', '3106.sol', '3125.sol', '3190.sol', '5400.sol', '5580.sol', '5909.sol',
              '6251.sol',
              '8502.sol', '10297.sol', '11191.sol', '11329.sol', '11448.sol', '11566.sol', '12395.sol', '12991.sol',
              '13178.sol', '14696.sol', '15351.sol', '15941.sol', '15991.sol', '16028.sol', '16673.sol', '18465.sol',
              '22428.sol', '31223.sol', '35790.sol', '39688.sol', '39700.sol', '40129.sol', '40529.sol', '40544.sol',
              '40562.sol', '40566.sol', '40596.sol', '40729.sol', '40730.sol', '40731.sol', '40732.sol', '40734.sol',
              '40749.sol', '40752.sol', '40758.sol', '50211.sol', '50218.sol', '50220.sol']

###################################################################################################################

path1 = './sourcecode/'
target_path1 = './error_data/sourcecode/'
path1_list = os.listdir(path1)
print(path1_list)

path2 = './source_graph_data/edges/'
target_path2 = './error_data/source_graph_data/edges/'
path2_list = os.listdir(path2)
print(path2_list)

path3 = './source_graph_data/nodes/'
target_path3 = './error_data/source_graph_data/nodes/'
path3_list = os.listdir(path3)
print(path3_list)

for i in path1_list:
    if i in error_list:
        print(i)
        shutil.move(path1 + i, target_path1 + i)
        shutil.move(path2 + i, target_path2 + i)
        shutil.move(path3 + i, target_path3 + i)

###################################################################################################################

path1 = './binarycode/'
target_path1 = './error_data/binarycode/'
path1_list = os.listdir(path1)
print(path1_list)

path2 = './binary_graph_data/edges/'
target_path2 = './error_data/binary_graph_data/edges/'
path2_list = os.listdir(path2)
print(path2_list)

path3 = './binary_graph_data/nodes/'
target_path3 = './error_data/binary_graph_data/nodes/'
path3_list = os.listdir(path3)
print(path3_list)

for i in path1_list:
    if i in error_list:
        print(i)
        shutil.move(path1 + i, target_path1 + i)
        shutil.move(path2 + i, target_path2 + i)
        shutil.move(path3 + i, target_path3 + i)

###################################################################################################################

# file1 = './final_timestamp_label.txt'
# target_file1 = './final_timestamp_label_fixed.txt'
#
# file2 = './final_timestamp_name.txt'
# target_file2 = './final_timestamp_name_fixed.txt'
#
# f1 = open(file1, 'r')
# f11 = open(target_file1, 'a')
# lines1 = f1.readlines()
#
# f2 = open(file2, 'r')
# f22 = open(target_file2, 'a')
# lines2 = f2.readlines()
#
# for i in range(len(lines2)):
#     if lines2[i].strip() not in error_list:
#         f11.write(str(lines1[i].strip()) + '\n')
#         f22.write(str(lines2[i].strip()) + '\n')
