package libs::hash;

use strict;
use warnings;
use Data::Dumper;
use DBI;

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub makeHash
{
    # my ($self) = @_;

    # my $dbh = DBI->connect("DBI:mysql:user10:localhost", 'user10', 'tuser10');

    # my $sth = $dbh->prepare("SELECT * FROM perl");
    # $sth->execute();
    # my %hash = ();
    # while ( my $row = $sth->fetchrow_hashref()) 
    # {
    #     #print Dumper(\$row->{'key'});
    #     $hash{$row->{'key'}} = $row->{'value'};
    # }

    # return \%hash;
}

1;
