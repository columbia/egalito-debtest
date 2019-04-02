#!/bin/bash

egalito=/home/dwk/egalito-2
etharden=$egalito/app/etharden

if [ -z "$1" ]; then
    echo usage: $0 mode packages...
    exit
fi

mode=$1
shift

for package in $@; do
    echo === transforming $package
    for file in $(ls test-$package/{bin,usr/bin,sbin}/* 2>/dev/null | grep -v '\.out$'); do
        if [ -n "$(file $file | grep -E 'ELF.*(shared object|pie executable)')" ]; then
            echo "--- $file -> $file.out"
            $etharden -m $file $file.out
        fi
    done
done
