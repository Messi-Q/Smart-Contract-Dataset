#!/usr/bin/env python
# coding:utf8

import os
import re
import shutil

regtxt = r'.+?\.sol'  # .sol
regcontent = r'block.timestamp'  # key word: 'block.timestamp'


class FileException(Exception):
    pass


def getDirList(filepath):
    txtlist = []
    txtre = re.compile(regtxt)
    needfile = []
    for parent, listdir, listfile in os.walk(filepath):
        for files in listfile:
            istxt = re.findall(txtre, files)
            filecontext = os.path.join(parent, files)
            if istxt:
                txtlist.append(filecontext)
                needfile.append(readFile(filecontext))

    if needfile == []:
        raise FileException("no file can be find!")
    else:
        validatedata = getValidData(needfile)
        print(validatedata)

        for i in range(len(validatedata)):
            copyFile(validatedata[i])

        print('total file %s , validate file %s.' % (len(txtlist), len(validatedata)))


def getValidData(filelist=[]):
    valifile = []
    for fp in filelist:
        if fp != None:
            valifile.append(fp)
    return valifile


def readFile(filepath):
    print(filepath)
    contentre = re.compile(regcontent)
    fp = open(filepath)
    lines = fp.readlines()
    flines = len(lines)
    for i in range(flines):
        iscontent = re.findall(contentre, lines[i])
        if iscontent:
            fp.close()
            return filepath


def copyFile(src_file):
    dst = "./tmp/"
    shutil.copy(src_file, dst)


if __name__ == "__main__":
    contract_dataset_path = './contract_data'
    dirs = os.listdir(contract_dataset_path)
    for dir in dirs:
        if 'contract' in dir:
            getDirList("./contract_data/" + str(dir))
