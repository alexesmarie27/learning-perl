#!/usr/bin/perl
# Alexes Presswood

use File::Find;

# Checks for correct command line arguments
($#ARGV == 1) or die "Usage: $0 [path]\n";

#Gets the user entered path
my $path = $ARGV[0];

#traverses the path
find(\&find_by_size, $path);

# while traversing the path, it checks the size of all the files in the directory and subdirectories
# if the file size is less than or equal to the min file size, then the full file path is printed to the user
sub find_by_size {
	if(-f $File::Find::name) {
		my $size = -s $File::Find::name;
		if($size >= $ARGV[1]){
			print $File::Find::name, "\n";
		}
	}
}

