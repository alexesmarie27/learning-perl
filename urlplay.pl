#!/usr/bin/perl

use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [url]\n";

my $url = shift @ARGV;

print $url, "\n";

if ($url =~ /^file:\/\//){
	$url =~ s/^file:\/\///;
	print $url, "\n";
} else {
	print "Not found\n";
}









