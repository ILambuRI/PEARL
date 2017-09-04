# my $dir = opendir(my $dirh, 'webroot/tmp');
# if (!$dir)

if (! ( (-d 'webroot/tmp') and (-R 'webroot/tmp') and (-W 'webroot/tmp') and (-X 'webroot/tmp') ) )
{
    #TODO: ERROR message

    # print "Content-type: text/html; charset=utf-8\n\n";
    die our $@='No dir!';
}


if (! ( (-e 'webroot/config.xml') and (-R 'webroot/config.xml') ) )
{
    #TODO: ERROR message
    print "Content-type: text/html; charset=utf-8\n\n";
    print 'No file!';
}


1;