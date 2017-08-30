package Controllers::defaultController;

use strict;
use warnings;
use Data::Dumper;
use vars qw(%hash $text2);

use Models::Articles;

sub indexAction;


# Construct класса
sub TIESCALAR {
  my $class = shift;
  bless {}, $class;
}



# Reading the value of a bound variable
sub FETCH {
  my $self = shift;
  return $self;
}



sub indexAction
{
 my ($self) = @_;
 my $art = Models::Articles->new();
 
 %hash = $art->getAll();
 #%hash = $art->getByUserId(1);
 #$art->create(2, 'Title insert2', 'TXT insert2');

 require "html.pl";
 return $text2;
 
 #print "Content-type: text/html; charset=utf-8\n\n";
 #return "Hello from default controller";
}

1;
