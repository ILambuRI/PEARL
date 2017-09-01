use strict;
use warnings FATAL => 'all';
use Data::Dumper;

use CGI::Session;


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {}, $class;
}

sub checkAuth
{
 my($self, $cgi) = @_;
 
 
}
