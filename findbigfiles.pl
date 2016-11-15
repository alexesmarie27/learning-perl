#!/usr/bin/perl
# Alexes Presswood

use File::Find;

# Checks for correct command line arguments
($#ARGV == 1) or die "Usage: $0 [path]\n";

#Gets the user entered path
my $path = $ARGV[0];

my $numFiles = $ARGV[1];

#traverses the path
find(\&find_big_files, $path);

# finds all the files in the directory and subdirectories and stores the file sizes and 
# file names into an associative array
my %fileSizes;
sub find_big_files {
	if(-f $File::Find::name) {
		my $size = -s $File::Find::name;
		$fileSizes{$File::Find::name} = $size; 
	}
}

# if the amount of files in the directory and subdirectory are less than the requested files, then the 
# program only prints the existing files
if (scalar keys %fileSizes < $numFiles) {
	print "There exists less files than requested, so only printing ", scalar keys %fileSizes, "\n";
	$numFiles = scalar keys %fileSizes;
}

# sorts the associative array and prints out only the top n files
foreach my $fname ( (sort {$fileSizes{$b} <=> $fileSizes{$a}} keys %fileSizes)[0..($numFiles-1)] ) {
	print $fname . ": " . $fileSizes{$fname} . "\n";
}
