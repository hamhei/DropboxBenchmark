#!bin/sh

files="1 5 10 20 50"

for f in $files
do
    mkfile ${f}m ${f}
done
