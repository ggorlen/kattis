use strict;
use warnings;

my $seconds = <>;
print ~~($seconds / 3600);
print " : ";
print ~~($seconds % 3600 / 60);
print " : ";
print ~~($seconds % 60);
print "\n";
