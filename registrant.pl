#!/usr/bin/perl

use strict;
use warnings;

($#ARGV == 0) or die "Usage: $0 [domain]\n";

my $domain = shift @ARGV;

my $result = `whois $domain`;

while($result =~ /(Registrant\sName):\s+(\w+\s+\w+)|(Registrant\sEmail):([^@]+@[^\.]+\.\w+)|(Registrant\sPhone):\s+(\+?\d?\.?\w+)/g){	    
	if(defined $1) {print "$1: $2\n" if defined $2;}
	if(defined $3) {print "$3: $4\n" if defined $4;}
	if(defined $5) {print "$5: $6\n" if defined $6;}
}
