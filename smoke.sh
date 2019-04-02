#!/bin/bash

egalito=/home/dwk/egalito-2
etharden=$egalito/app/etharden

for package in $@; do
    echo === testing $package
    for file in $(ls test-$package/{bin,usr/bin,sbin}/* 2>/dev/null | grep -v '\.out$'); do
        if [ -n "$(file $file | grep -E 'ELF.*(shared object|pie executable)')" ]; then
            echo $file
            diff -q <($file --help) <($file.out --help | sed 's/\.out//')
        fi
    done
done
