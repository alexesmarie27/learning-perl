#!/usr/bin/perl
use strict;
use warnings;

my $string = "The big fox and the little fox played in the woods.";

# want to change the "fox"s to cat
$string =~ s/fox/cat/g;
print $string, "\n";

#replace the "the"s in front of the "fox"s
$string =~ s/The/A/;
$string =~ s/the/a/;
print $string, "\n";

# take all the spaces out of the string
# need to find the blank space and replace with nothing
$string =~ s/\s//g;
print $string, "\n";
