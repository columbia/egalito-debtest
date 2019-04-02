#!/bin/bash
pkg="perl-base python2.7-minimal sed gawk"
../get.sh $pkg
../transform.sh --nop $pkg
../smoke.sh $pkg
../cases.sh $pkg
