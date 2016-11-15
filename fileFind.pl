#!/usr/bin/perl

use File::Find;

($#ARGV == 0) or die "Usage: $0 [path]\n";

my $path = shift @ARGV;

find(\&print_if_dir, $path);

sub print_if_dir {
	print $File::Find::name. "\n" if -d;
}
