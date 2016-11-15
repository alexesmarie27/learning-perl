#!/usr/bin/perl
##
## Alexes Presswood
##

use strict;
use warnings;

# Checks if the correct amount of arguments were entered
($#ARGV == 0) or die "Usage: $0 [filepath]\n";

# grabs the argument (filepath) from the command line
my $filepath = shift @ARGV;

# opens the file
open(my $fh, '<:encoding(UTF-8)', $filepath) or die "Could not open file '$filepath' $!";

# looks at each line in the file
my $string = "";
while (my $line = <$fh>) {
	$string .= $line;
}

# checks for the entered regular expression
# in this case, it is looking for the "a href" contents
my @images = $string =~ /<a\s+[^>]*href="([^"]*)"[^>]*>/g;

#prints each href contents
for my $image (@images) {
	print $image, "\n";
}

#prints the number of images found from the regular expression
print "Num images found = ", $#images + 1, "\n";
