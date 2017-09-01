#!C:\Dwimperl\perl\bin\perl.exe -w
##!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Libs/CGI/Session/';
use lib dirname(__FILE__).'/Libs/CGI/Session/ID';
use lib dirname(__FILE__).'/Libs/CGI/Session/Serialize';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Models/';
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use CGI::Session qw/-ip-match/;
use Libs::SessionUtil;

#use CGI::Session::File;
use DBI;

use Libs::Router;
use Libs::Configuration;
use Libs::Container;
use Controllers::securityController;
use Models::DB;

use vars qw($loyout $content $error);
my $sid;

my $cgi = CGI->new();
my $session;
# $session = Libs::SessionUtil->new(1,);
# $session->set('sessionDir', "E:/OpenServer/domains/perl-camel-master/tmp");
# $session->set('sid', "748df09eed214eb639b2ce79266ea1ec");
# $session->sessionStarter();
#   print "Content-type: text/html; charset=utf-8\n\n";
#   print Dumper \$session;
if( $sid = $cgi->cookie("CGISESSID") )
{
  #$session = CGI::Session->new(); 
  # $session->load();
  # my $session = new CGI::Session(undef, $sid, {Directory=>"E:/OpenServer/domains/perl-camel-master/tmp"});
  # my $session = CGI::Session->new("driver:File", '0ee6eab8aece9396243521a5806543bc', {Directory=>"E:/OpenServer/domains/perl-camel-master/tmp"});
  # my $load = $session->load();
  # my $id = $session->id();
  # $session->expire(3600);
  print "Content-type: text/html; charset=utf-8\n\n";
  # print Dumper \$load;
}
# else
# {
#   my $session = new CGI::Session("driver:File", undef, {Directory=>"E:/OpenServer/domains/perl-camel-master/tmp"});
#   $sid = $session->id();
#   my $cookie = $cgi->cookie(CGISESSID => $sid);
#   print $cgi->header( -cookie=>$cookie );
# }

  #$session->delete();

  # print "Content-type: text/html; charset=utf-8\n\n";
  # print Dumper \$session;


# my $sid = param(SID) undef;
# print "Content-type: text/html; charset=utf-8\n\n";
# print Dumper \$sid;

my $container = Libs::Container->new();
# my $config = (Libs::Configuration->new())->readConfig('webroot/config.xml');
#save mysqlparams
# my %dbMysql = ('dbType' => $config->{'dbType'}, 'dbName'=>$config->{'dbName'}, 'dbHost'=>$config->{'dbHost'}, 'dbUser'=>$config->{'dbUser'}, 'dbPassword'=> $config->{'dbPassword'});

#save $dbh
#my $dbh = DBI->connect("DBI:mysql:$mysql{'dbName'}:$mysql{'dbHost'}", "$mysql{'dbUser'}", "$mysql{'dbPassword'}")  or die $DBI::errstr;
#my $dbh = DBI->connect("DBI:mysql:$mysql{'dbName'}:$mysql{'dbHost'}", "$mysql{'dbUser'}", "")  or die $DBI::errstr;
#$container->set('db_connect', $dbh);


# my $dbModel = Models::DB->instance(\%dbMysql);
# $container->set('model', $dbModel);

#print Dumper $container->get('model');

# my $dbh  = $dbModel->connect();
# $container->set('db', $dbh);







#test pull
  #my $security_controller = Controllers::securityController->new();
  #$security_controller->setContainer($container);
  # $security_controller->isUserAction();


my $request = Libs::Router->new();
my $route = $request->getRoute('route','default/homePage');

my $controller = $route->{'controller'};
my $action = $route->{'action'};

#eval
#{
     require $controller.".pm";
     my $controller_class = "Controllers::$controller";
     $controller = $controller_class->new();
     $controller->setContainer($container);
    
     #if method exists
     if($controller->can($action))
     {
	$content = $controller->$action($request);
	
	 require 'layout.pl';
         print "Content-type: text/html; charset=utf-8\n\n";
         print $loyout;
     }
     else
     {
	  print "Content-type: text/html; charset=utf-8\n\n";
	  require 'error.pl';
	  print $error;
      }
     
# };
 #if($@)
 #{
 #   print "Content-type: text/html; charset=utf-8\n\n";
 #   #require 'error.pl';
 #   print $error;
  
 #}
1;