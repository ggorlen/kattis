use strict;
use warnings;

my ($n, $t) = split / /, <>;
my $line = <>;
chomp $line;
my @a = split / /, $line;

if ($t == 1) {
    my %seen;

    for my $e (@a) {
        if (exists $seen{7777 - $e}) {
            print "Yes\n";
            exit;
        }

        $seen{$e} = 1;
    }

    print "No\n";
}
elsif ($t == 2) {
    my %seen;

    for my $e (@a) {
        if (exists $seen{$e}) {
            print "Contains duplicate\n";
            exit;
        }

        $seen{$e} = 1;
    }

    print "Unique\n";
}
elsif ($t == 3) {
    my %seen;

    for my $e (@a) {
        if (not(exists $seen{$e})) {
            $seen{$e} = 0;
        }

        $seen{$e} += 1;
        my $count = $seen{$e};

        if ($seen{$e} > (scalar @a / 2)) {
            print $e . "\n";
            exit;
        }
    }

    print "-1\n";
}
elsif ($t == 4) {
    @a = sort {$a <=> $b} @a;
    my $len = scalar @a;

    if ($len % 2 == 0) {
        my $x = $a[$len / 2 - 1];
        my $y = $a[$len / 2];
        print "$x $y\n";
    }
    else {
        my $x = $a[$len / 2];
        print "$x\n";
    }
}
elsif ($t == 5) {
    my @r;

    for my $e (@a) {
        if ($e >= 100 && $e < 1000) {
            push @r, $e;
        }
    }

    for my $e (sort {$a <=> $b} @r) {
        print "$e ";
    }

    print "\n";
}
