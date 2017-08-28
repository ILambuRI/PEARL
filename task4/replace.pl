#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $patt = 'pattern.txt';
my $html = 'doc.html';

sub readFile
{
    my ($file)= @_;
    my @data = ();
    open my $fh, "< $file";
    binmode($fh);
    while (<$fh>)
    {
        chomp($_);
        push @data, $_;
    }
    close $fh;

    unless(wantarray)
    {
        return join("\n", @data);
    }
    else
    {
        return @data;
    }
}

sub makeHash
{
    my @data = @_;
    my %rep = ();

    while (@data)
    {
        my $line = shift @data;
        my ($key, $value) = split('=', $line);

        $rep{$key} = $value if($key);
    }

    return \%rep;
}

#$html = readFile($html);
 my @arr = readFile($patt);
 my $hash = makeHash(@arr);


my $file = readFile($html);

$file =~ s/(REP_\d+)/$hash->{$1}/gse;

# print Dumper(\$file);
my $text2 =<<HTML;
$$resFile
HTML
