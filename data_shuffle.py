"""
Author: Messi-Q

Date: Created on 7:46 PM 2021-04-07  
"""
# A bug is left. Need to give the blank line in each data file.


import random


def data_shuffle(sourcecode_list, name_list, label_list):
    randnum = random.randint(0, 10000)

    # source code list
    random.seed(randnum)
    random.shuffle(sourcecode_list)

    # # byte code list
    # random.seed(randnum)
    # random.shuffle(bytecode_list)

    # name list
    random.seed(randnum)
    random.shuffle(name_list)

    # label list
    random.seed(randnum)
    random.shuffle(label_list)

    f11 = open("./tools/reentrancy/outputs/Reentrancy_AutoExtract_fullnodes.json", 'a')
    for code in sourcecode_list:
        f_code = str(code)
        f11.write(f_code)

    # f22 = open("./tools/reentrancy/outputs/Reentrancy_Bytecode.json", 'w')
    # for bytecode in bytecode_list:
    #     f_bytecode = str(bytecode)
    #     f22.write(f_bytecode)

    f33 = open("./tools/reentrancy/outputs/final_reentrancy_name.txt", 'a')
    for name in name_list:
        f_name = str(name)
        f33.write(f_name)

    f44 = open("./tools/reentrancy/outputs/final_reentrancy_label.txt", 'a')
    for label in label_list:
        f_label = str(label)
        f44.write(f_label)


if __name__ == "__main__":
    f1 = open('./tools/reentrancy/results/Reentrancy_AutoExtract_fullnodes.json', 'r')
    # f2 = open('./tools/reentrancy/results/Reentrancy_Bytecode.json', 'r')
    f3 = open('./tools/reentrancy/results/final_reentrancy_name.txt', 'r')
    f4 = open('./tools/reentrancy/results/final_reentrancy_label.txt', 'r')
    sourcecode_list = f1.readlines()
    # bytecode_list = f2.readlines()
    name_list = f3.readlines()
    label_list = f4.readlines()

    data_shuffle(sourcecode_list, name_list, label_list)
