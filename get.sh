#!/bin/bash

for package in $@; do
    echo === download $package
    apt download $package
    if [ ! -d "test-$package" ]; then
        mkdir test-$package
        echo dpkg-deb -x ${package}_*.deb test-$package
        dpkg-deb -x ${package}_*.deb test-$package
    fi
done
