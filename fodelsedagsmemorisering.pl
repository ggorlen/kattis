use strict;
use warnings;

my %memory;
<>;
while (<>) {
    my ($name, $rank, $date) = split / /, $_;

    if (!(exists $memory{$date}) || $memory{$date}{"rank"} < $rank) {
        $memory{$date} = {rank => $rank, name => $name};
    }
}

my @names = sort map {$_->{"name"}} values %memory;
print scalar @names . "\n";
print join "\n", @names;
