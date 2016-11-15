#!/usr/bin/perl
use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [filepath]\n";

my $filepath = shift @ARGV;

open(my $fh, '<:encoding(UTF-8)', $filepath) or die "Could not open file '$filepath' $!";

my $string = "";
while (my $line = <$fh>) {
	$string .= $line;
}

# find all the source contents from one of the img tags
my @images = $string =~ /<img\s+[^>]*src="([^"]*)"[^>]*>/;

print $1, "\n";
