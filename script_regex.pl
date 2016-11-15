#!/usr/bin/perl
use strict;
use warnings;

# http://perlmaven.com/here-documents

my $string = <<'END_HTML';
<html>
<head>
<title>My Web Page</title>
<script language="javascript">

function sayHello() {
	alert("Hello world!");
}

function add(num1, num2) {
	return num1 + num2;
} 

</script>
</head>
<body>
This is my web page.
</body>
</html>
END_HTML

# want to determine if page has script block
# grab and print the script block
if ($string =~  /(<script[\s\w\W]*>[\w|\W|\s|\r]*<\/script>)/) {
	print "Printing script and its contents\n";
	print $1, "\n" if defined $1;
}

# works the same as above
# ^> means anything BUT the ">"
# ^ = negates
if ($string =~  /(<script[^>]*>[\w|\W|\s|\r]*<\/script>)/) {
	print "Printing script and contents a different way\n";
	print $1, "\n" if defined $1;
}

# prints the contents of the script block
# works when language="javascript" isn't there
if ($string =~  /<script>([\w|\W|\s|\r]*)<\/script>/) {
	print "Printing only the contents of the script block\n";
	print $1, "\n" if defined $1;
}

# Prints several parts of the regular expression
if ($string =~  /<script([^>]*)>([\w|\W|\s|\r]*)<\/script>/) {
	print "Printing everything BUT the script tags\n";
	print $1, "\n" if defined $1;
	print $2, "\n" if defined $2;
}

# get language out of "language=javascript"
if ($string =~  /<script([^>]*)>([\w|\W|\s|\r]*)<\/script>/) {
	print "Prints the language of the script\n";

	if (defined $1) {
		my $language = $1;
		if ($language =~ /[\s]*language[\s]*=[\s]*"([\w]+)"/){
			print $1, "\n" if defined $1;
		}
	}
}

