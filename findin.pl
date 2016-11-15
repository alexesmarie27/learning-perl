#!/usr/bin/perl
# Alexes Presswood

use strict;
use warnings;

#Checks if the user inputed the correct amount of command line args
scalar @ARGV >= 2 or die "Usage: findin.pl <file_path> <string1> <string2> ...\n";

#opens the file
my $filePath = $ARGV[0];
open my $fh, '<', $filePath or die "Could not find the filepath '$filePath'\n";

# creates an associative array to keep track of all the counters for each string the user inputed
my %counters;
for(my $counter = 1; $counter < @ARGV; $counter = $counter + 1){
	$counters{$ARGV[$counter]} = 0;
}

#for each string in the user input, check the amount of lines it appears in the file
# every time it finds a match in the file, add one to the counter in the associative array
my $numberOfARGV = @ARGV - 1;
while (my $line = <$fh>) {
	for(my $currentArg = 1; $currentArg < $numberOfARGV +1; $currentArg = $currentArg +1){
		if(index($line, $ARGV[$currentArg]) != -1){
			my $curVal = $counters{$ARGV[$currentArg]};
			$counters{$ARGV[$currentArg]} = $curVal + 1; 
		}
	}
}	

#prints out all the arguments and their counts 
while (my ($key, $value) = each %counters) {
	print "$key $value\n";
}
