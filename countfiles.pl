#!/usr/bin/perl

use File::Find;

($#ARGV == 0) or die "Usage: $0 [path]\n";

my $path = shift @ARGV;

find(\&count_files, $path);

my $file_count;
sub count_files {
	if(-f $File::Find::name) {
		$file_count = $file_count + 1;
		print $File::Find::name, "\n";
	}
}

print $file_count, "\n";
