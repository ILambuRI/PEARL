#!C:\Dwimperl\perl\bin\perl.exe -w
##!"C:\xampp\perl\bin\perl.exe"


use strict;
use warnings;
use Data::Dumper;
use locale;

use File::Basename qw(dirname);
use lib dirname(__FILE__).'/Views/';
use lib dirname(__FILE__).'/Libs/';
use lib dirname(__FILE__).'/Controllers/';
use lib dirname(__FILE__).'/Models/';
use lib dirname(__FILE__).'/Helpers/';
use CGI::Carp qw(fatalsToBrowser);
use DBI;

use Libs::Router;
use Libs::Configuration;
use Libs::Container;
use Controllers::authController;
use Models::DB;
use Libs::Session;

use vars qw($loyout $content $error $auth $user_log $user_id $_auth);





#read config
#my $config = (Libs::Configuration->new())->readConfig('webroot/config.xml');
#mysqlparams
my %dbMysql = ('dbType' => 'mysql',
               'dbName' => 'perl',
               'dbHost' => 'localhost',
               'dbUser' => 'root',
               'dbPassword'=> ''
              );
my %cookieData = ('cookieName'=>  'CamelTeam', 'dirPath' => 'webroot/tmp/');
#create container
my $container = Libs::Container->new();
#$container->set('cookieData', \%cookieData);

#save $dbh, $model in container
my $dbModel = Models::DB->instance(\%dbMysql);
$container->set('model', $dbModel);
 
my $dbh  = $dbModel->connect();
$container->set('db', $dbh);

#is user login
my $session =  Libs::Session->new('webroot/tmp/', 'CamelTeam');
$container->set('session', $session);
my $is_user = $session->check();

$auth  =  ($is_user) ? "visbl" : "displ";
$_auth = ($is_user) ?  "displ" : "visbl";
$user_log = $is_user ? $session->get('login') : "";
$user_id = $is_user ? $session->get('id') : "";

my $router = Libs::Router->new();
my $route = $router->getRoute('route','default/home');

my $controller = $route->{'controller'};
my $action = $route->{'action'};
my $params = $route->{'params'};
 
# eval
# {
    require 'ExistCheck.pl';

     require $controller.".pm";
     my $controller_class = "Controllers::$controller";
     $controller = $controller_class->new();
     $controller->setContainer($container);
    
    #if method exists
    if($controller->can($action))
    {

        $content = $controller->$action($params);

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
#      warn $@;
# };
# warn $@;
# if($@)
# {
#     print "Content-type: text/html; charset=utf-8\n\n";
#     require 'error.pl';
#     print $error;
#     print $@;
# }


