#!/usr/bin/perl

use strict;
use warnings;

my $string = "toy='truck' color='red' cat='purrdy' dogs='beagle' car='toyota' doggy='mut' apple='delicious' dog='shepherd' colour='blue'";

while($string =~ /[^(dog)](dog|doggy|dogs)='(\w+)'/g){
	print $1, " at ", $-[0]+1, "-", $+[1]-1, " type ", $2, " at ", $-[2], "-", $+[2]-1, "\n";
}

while($string =~ /[^(col)](color|colour)='(\w+)'/g){
	print $1, " at ", $-[0]+1, "-", $+[1]-1, " type ", $2, " at ", $-[2], "-", $+[2]-1, "\n";
}
