"""
Author: Messi-Q

Date: Created on 12:39 PM 2021-04-06  
"""

import os
import shutil

# error_list = ['347.sol', '348.sol', '1044.sol', '1045.sol', '1788.sol', '1789.sol', '2025.sol', '4690.sol', '4691.sol',
#               '5259.sol', '9611.sol', '14995.sol', '15910.sol', '29376.sol', '35078.sol', '35421.sol', '39994.sol',
#               '40028.sol', '40118.sol', '40204.sol', '40205.sol', '40341.sol', '40344.sol', '40367.sol', '40469.sol',
#               '40589.sol', '40767.sol', '50004.sol']
#
# ###################################################################################################################
#
# path1 = './sourcecode/'
# target_path1 = './error_data/sourcecode/'
# path1_list = os.listdir(path1)
# print(path1_list)
#
# path2 = './source_graph_data/edges/'
# target_path2 = './error_data/source_graph_data/edges/'
# path2_list = os.listdir(path2)
# print(path2_list)
#
# path3 = './source_graph_data/nodes/'
# target_path3 = './error_data/source_graph_data/nodes/'
# path3_list = os.listdir(path3)
# print(path3_list)
#
# for i in path1_list:
#     if i in error_list:
#         print(i)
#         shutil.move(path1 + i, target_path1 + i)
#         shutil.move(path2 + i, target_path2 + i)
#         shutil.move(path3 + i, target_path3 + i)
#
# ###################################################################################################################
#
# path1 = './binarycode/'
# target_path1 = './error_data/binarycode/'
# path1_list = os.listdir(path1)
# print(path1_list)
#
# path2 = './binary_graph_data/edges/'
# target_path2 = './error_data/binary_graph_data/edges/'
# path2_list = os.listdir(path2)
# print(path2_list)
#
# path3 = './binary_graph_data/nodes/'
# target_path3 = './error_data/binary_graph_data/nodes/'
# path3_list = os.listdir(path3)
# print(path3_list)
#
# for i in path1_list:
#     if i in error_list:
#         print(i)
#         shutil.move(path1 + i, target_path1 + i)
#         shutil.move(path2 + i, target_path2 + i)
#         shutil.move(path3 + i, target_path3 + i)

###################################################################################################################

# file1 = './final_reentrancy_label.txt'
# target_file1 = './final_reentrancy_label_fixed.txt'
#
# file2 = './final_reentrancy_name.txt'
# target_file2 = './final_reentrancy_name_fixed.txt'
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
