package libs::parser;

use strict;
use warnings;
use Data::Dumper;

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}

sub pars
{
    my ($self, $file, $hash) = @_;

    $file =~ s/(REP_\d+)/$hash->{$1}/gse;

    return \$file;
}

1;
