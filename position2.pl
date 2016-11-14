#!/usr/bin/perl

use strict;
use warnings;

my $string = "toy='truck' color='red' cat='purrdy' dog='beagle' car='toyota' dog='mut' apple='delicious' dog='shepherd' color='blue'";
my @properties = ("dog", "color", "toy", "apple");

#searches the string for the contents in the array "properties"
foreach (@properties){
	my $search_string = $_;
	while($string =~ /[^$search_string]?($search_string)='(\w+)'/g){
		print "$1 at $-[1]-", $+[1]-1, " type $2 at $-[2]-", $+[2]-1, "\n";
	}
}
