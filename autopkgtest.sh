#!/bin/bash

for package in $@; do
    echo
    echo === autopkgtest $package
    sourcepackage=$(apt-get source $package | perl -ne '/Picking .(.*). as source package instead of/ && print "$1\n"')
    if [ -z "$sourcepackage" ]; then
        sourcepackage=$package
    fi
    #../rewrite.sh ${package}_*.deb
    autopkgtest gen/$package_*.deb $sourcepackage-*/ -- schroot pkgtest | tee gen/$package.run
    code=$?
    echo autopkgtest result = $code >> gen/$package.run
    echo autopkgtest result = $code
done

