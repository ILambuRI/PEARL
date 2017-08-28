package libs::hash;

use strict;
use warnings;
use Data::Dumper;

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}

sub makeHash
{
    my ($self, @data) = @_;
    my %rep = ();

    while (@data)
    {
        my $line = shift @data;
        my ($key, $value) = split('=', $line);

        $rep{$key} = $value if($key);
    }

    return \%rep;
}

1;
