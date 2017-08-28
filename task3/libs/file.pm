package libs::file;

use strict;
use warnings;
use Data::Dumper;

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}

sub readFile
{
    my ($self, $file) = @_;
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

1;
