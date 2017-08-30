package Models::Articles;

use strict;
use warnings;
use Data::Dumper;
use DBI;

sub getAll;
sub getByUserId;
sub update;
sub delete;
sub create;

my $dbh = DBI->connect("DBI:mysql:perl:localhost", 'root', '');
#our $dbh = DBI->connect("DBI:mysql:user10:localhost", 'user10', 'tuser10');

sub new
{
    my $class = ref($_[0]) || $_[0];
    return bless {}, $class;
}


sub getAll
{
    my ($self) = @_;

    # my $dbh = DBI->connect("DBI:mysql:perl:localhost", 'root', '');

    # my $sth = $dbh->prepare("SELECT * FROM articles");
    my $sth = $dbh->prepare("SELECT u.login, a.id, a.title, a.txt, a.date
                            FROM articles as a
                            JOIN users as u
                            ON u.id = a.user_id
                            ORDER BY a.date DESC");
    $sth->execute();
    my %hash = ();
    #my $cnt = 0;
    
    #print "Content-type: text/html; charset=utf-8\n\n";
    while ( my $row = $sth->fetchrow_hashref()) 
    {
        #print Dumper(\$row);
        #print Dumper(\$row->{'key'});
        my $date = localtime($row->{'date'});

        while (my ($key, $value) = each $row)
        {
            $hash{$row->{'id'}}{$key} = $value;
        }

        $hash{$row->{'id'}}{'date'} = $date;

        # $hash{$cnt}{'date'} = $date;
        # $hash{$cnt}{'id'} = $row->{'id'};
        # $hash{$cnt}{'login'} = $row->{'login'};
        # $hash{$cnt}{'title'} = $row->{'title'};
        # $hash{$cnt}{'txt'} = $row->{'txt'};
        # $cnt++;
    }

    $sth->finish();
    #print Dumper(%hash);
    return %hash;
}

sub getByUserId
{
    my ($self, $id) = @_;
    my $sth = $dbh->prepare("SELECT u.login, a.id, a.title, a.txt, a.date
                            FROM articles as a
                            JOIN users as u
                            ON u.id = a.user_id
                            WHERE a.user_id = $id
                            ORDER BY a.date DESC");
    $sth->execute();
    my %hash = ();
    
    while ( my $row = $sth->fetchrow_hashref()) 
    {
        my $date = localtime($row->{'date'});

        while (my ($key, $value) = each $row)
        {
            $hash{$row->{'id'}}{$key} = $value;
        }

        $hash{$row->{'id'}}{'date'} = $date;

        # $hash{$cnt}{'id'} = $row->{'id'};
        # $hash{$cnt}{'login'} = $row->{'login'};
        # $hash{$cnt}{'title'} = $row->{'title'};
        # $hash{$cnt}{'txt'} = $row->{'txt'};
        # $hash{$cnt}{'date'} = $date;
    }

    $sth->finish();
    return %hash;
}

sub update
{
    my ($self) = @_;
}

sub delete
{
    my ($self) = @_;
}

sub create
{
    my ($self, $u_id, $title, $txt) = @_;
    my $date = time;
    my $sql = "INSERT INTO articles (user_id, title, txt, date) 
              VALUES ($u_id, '$title', '$txt', $date)";
    my $sth = $dbh->do($sql);

    #print "Content-type: text/html; charset=utf-8\n\n";
    #print Dumper($sth);
    
    return $sth;
}

1;