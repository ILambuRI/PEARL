#!/usr/bin/perl -w

use strict;
use warnings;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use Data::Dumper;
use CGI::Carp qw(fatalsToBrowser);
use CGI::Cookie;

use File::Basename qw(dirname);      # = __DIR__
use lib dirname(__FILE__) . '/libs'; # on PHP

# use CGI::Session::File;

use vars qw(%in);


print "Content-type: text/html; charset=utf-8\n\n";
print '<pre>'.Dumper(\%ENV) . '</pre>';
$|=1;
ReadParse();
print '<pre>'.Dumper(\%in) . '</pre>';
print $];
