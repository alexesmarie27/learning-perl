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

# finds the title of the page
if ($string =~  /<title>([^<]*)<\/title>/) {
	print "The title of the page:\n";
	print $1, "\n\n" if defined $1;
}

# finds the strongs tag contents of the page
print "The strong tags of the page:\n";
my @strongs = $string =~  /<strong>([^<]*)<\/strong>/g;
for my $strong (@strongs) {
	print $strong, "\n";
}
print "Num strong tags found = ", $#strongs + 1, "\n";
print "\n";

# finds the header tag contents of the page
print "The header titles found in header tags of the page:\n";
my @headers = $string =~  /<h[1-6]\s*[^>]*>(.*)<\/h[1-6]>/g;
for my $header (@headers) {
	print $header, "\n";
}
print "Num header tags found = ", $#headers + 1, "\n";



