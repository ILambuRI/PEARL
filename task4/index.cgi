#!/usr/bin/perl -w
#use lib ('libs');
use strict;
use warnings;

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use Data::Dumper;
use CGI::Carp qw(fatalsToBrowser);
use CGI::Cookie;

use File::Basename qw(dirname);      # = __DIR__
use lib dirname(__FILE__) . '/libs'; # on PHP

use vars qw(%in);
$|=1;
ReadParse();

use libs::file;
use libs::parser;
use libs::hash;

my $file = libs::file->new();
my $parser = libs::parser->new();
my $hash = libs::hash->new();

my $html = $file->readFile('doc.html');
# my @pattern = $file->readFile('pattern.txt');
my $doHash = $hash->makeHash();

my $resFile = $parser->pars($html, $doHash);

my $text =<<HTML;
$$resFile
HTML

print "Content-type: text/html; charset=utf-8\n\n";

print $text;
#print $$resFile;
#print Dumper($resFile);

require ('replace.pl');
print $text2;

