#!/usr/bin/perl
###
### Alexes Presswood
###

use strict;
use warnings;

# checks for correct number of command line arguments
($#ARGV == 0) or die "Usage: $0 [date]\n";

# gets the date from the command line
my $string = shift @ARGV;

# checks for dates of the forms: 
## YYYY-MM-DD
## MM/DD/YYYY
## MM/DD/YY
## MON DD, YYYY
# if the form is correct, the date is printed to the user
if($string =~ /(\d\d\d\d)-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])/){
	print $string, " is a valid date!\n";
	print "The year is ", $1 if defined $1;
}
elsif($string =~ /(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/(\d\d\d\d)/){
	print $string, " is a valid date!\n";
	print "The year is ", $3 if defined $3;
}
elsif($string =~ /(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/(\d\d)/){
	print $string, " is a valid date!\n";
	print "The year is '", $3 if defined $3;
}
elsif($string =~ /(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s(0[1-9]|[12][0-9]|3[01]),\s(\d\d\d\d)/){
	print $string, " is a valid date!\n";
	print "The year is ", $3 if defined $3;
}
else{
	print $string, " is not a valid date\n";
}