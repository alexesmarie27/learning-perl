#!/usr/bin/perl

sub Average{
	my $numArgs= scalar (@_);

	print $numArgs, "\n";

	my $numbers = shift @_;

	my $n = scalar @$numbers;

	my $total = 0;
	foreach my $num (@$numbers) {
		$total += $num;
	}

	my $average = $total / $n;

	print ("Average is $average\n");
}

my @numbers1 = (5,4,3,2,1);
my @numbers2 = (5, 4, 6, 7, 8);

Average(\@numbers1);
