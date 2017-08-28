package libs::hash;

use strict;
use warnings;
use Data::Dumper;
use DBI;
use XML::Simple;

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub makeHash
{
    my ($self) = @_;

    my $xml = XML::Simple->new();
    my $hash = $xml->XMLin('hash.xml');
    
    # print Dumper(\$hash);
    return $hash;
}

1;
