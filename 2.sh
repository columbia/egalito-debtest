#!/bin/bash
#pkg="perl-base python2.7-minimal sed gawk"
pkg="upower rc biosquid"
../get.sh $pkg
../transform.sh --nop $pkg
../makedeb.sh $pkg
../autopkgtest.sh $pkg
