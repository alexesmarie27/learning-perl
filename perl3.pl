#!/usr/bin/perl

sub check {
	my $path = shift @_;

	print "directory\n" if -d $path;
	print "file\n" if -f $path;
}

($#ARGV == 0) or die "Usage: $0 [path]\n";

check($ARGV[0]);
