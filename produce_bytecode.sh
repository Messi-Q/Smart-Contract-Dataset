#! /bin/sh -

path=./transorder/sourcecode/
files=$(ls $path)

for filename in $files
do
   solc --bin transorder/sourcecode/$filename | tee -a transorder/bytecode/$filename
done