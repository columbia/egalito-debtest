#!/bin/bash

for package in $@; do
    echo === testing $package
    for input in $(find ../cases/$package -type f 2>/dev/null); do
        exe=$(echo $input | sed "s|\.\./cases/$package/||" | xargs dirname)
        echo test-$package/$exe.out $input
        diff <(test-$package/$exe $input) <(test-$package/$exe.out $input)
        #if [ -n "$(file $file | grep -E 'ELF.*(shared object|pie executable)')" ]; then
            #echo $file
            #diff -q <($file --help) <($file.out --help | sed 's/\.out//')
        #fi
    done
done
