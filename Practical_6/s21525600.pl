#!/usr/bin/perl

use strict;
use warnings;

my $input_file = $ARGV[0];
my $search_word = lc($ARGV[1]);

open my $fh, '<', $input_file or die "Cannot open file: $!\n";
my $file_content = do { local $/; <$fh> };
close $fh;

$file_content =~ s/[^a-zA-Z]//g;
$file_content = lc($file_content);

my $reversed_content = reverse $file_content;
my $count = () = $reversed_content =~ /$search_word/g;

print "Matches: $count\n";
