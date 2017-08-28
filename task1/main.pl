#!/usr/bin/perl
#use lib ('libs');
use strict;
use warnings;

use Data::Dumper;

use libs::file;
use libs::parser;
use libs::hash;

my $file = libs::file->new();
my $parser = libs::parser->new();
my $hash = libs::hash->new();

my $html = $file->readFile('doc.html');
my @pattern = $file->readFile('pattern.txt');
my $doHash = $hash->makeHash(@pattern);

my $resFile = $parser->pars($html, $doHash);

print Dumper(\$resFile);

1;
