#!/usr/bin/perl

print "Hello World!\n";
for my $i (0..10) {
    print $i**2, "\n";
}

eval {
    print "eval\n";
    3 / 0;
    print "eval???\n";
};

print "exiting\n";
