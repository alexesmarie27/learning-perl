#!/usr/bin/perl
#Alexes Presswood


use File::Find;

# Checks for correct command line arguments
($#ARGV == 0) or die "Usage: $0 [path]\n";

#Gets the user entered path
my $path = shift @ARGV;

#traverses the path
find(\&count_files, $path);

# while traversing the path, counts the number of files within the directory and the subdirectories
my $file_count;
sub count_files {
	if(-f $File::Find::name) {
		$file_count = $file_count + 1;
	}
}

# Prints the number of files found in the directory and subdirectories
print "File count for the path $path : ", $file_count, "\n";

