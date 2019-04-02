#!/bin/bash

for dir in test-*; do
    echo === cleaning $dir
    for file in $(ls $dir/{bin,usr/bin,sbin}/* 2>/dev/null | grep '\.out$'); do
        echo rm -f $file
        rm -f $file
    done
done
