#!/usr/bin/perl

my %person = ("name" => "Sally", "age" => "23", "gender" => "female");

my @keys = keys %person;

foreach my $key (@keys) {
	my $value = $person($key);
	print "$key = $value\n";
}
