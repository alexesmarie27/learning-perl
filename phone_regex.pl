#!/usr/bin/perl
use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [phone_number]\n";

my $string = shift @ARGV;

print $string, "\n";

#checks for a phone number of the form xxx-xxx-xxxx
if($string =~ /\d{3}-\d{3}-\d{4}/) {
	print "It is a phone number\n";
}
else{
	print "It is not a phone number\n";
}

# both examples check the phone number for the form xxx-xxx-xxxx
# where the first x is not a 0 or 1
if($string =~ /[2-9]\d{2}-\d{3}-\d{4}/) {
	print "It is a phone number\n";
}
else{
	print "It is not a phone number\n";
}

#same comment as above
if($string =~ /[2-9]{1}[0-9]{2}-[0-9]{3}-[0-9]{4}/) {
	print "It is a phone number\n";
}
else{
	print "It is not a phone number\n";
}

# Allows for spaces, slashes, and periods between the sets 
# of numbers. Also, works with and without the area code
if($string =~ /([2-9]{1}[0-9]{2})?(\s|-|\.|\/)?[0-9]{3}(\s|-|\.|\/)[0-9]{4}/) {
	print "It is a phone number!\n";
}
else{
	print "It is not a phone number!\n";
}