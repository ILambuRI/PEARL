package Controllers::userController;

use strict;
use warnings;

use Data::Dumper;
use vars qw($content $message);

use vars qw(@ISA);
use Controller;

@ISA = qw(Controllers::Controller);

use Models::Users;
sub profilInfoAction;
use Libs::Session;


sub profilInfoAction
{
    my ($self) = @_;
    
    my $session =  $self->get('session');
    if(!$session->check())
    {
      print "Location: $ENV{'SCRIPT_NAME'}\n\n";
    }
    

    $message = "";
    require 'users/profil.pl';
    return $content; 
}

1;
