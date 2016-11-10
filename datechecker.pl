#!/usr/bin/perl
use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [date]\n";

my $string = shift @ARGV;

if($string =~ /[19|20]\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|[3[01])/){
	print $string, " is a valid date!\n";
}
else{
	print $string, " is not a valid date\n";
}

