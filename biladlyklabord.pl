use strict;
use warnings;

my $s = <>;
chomp $s;

for (my $i = 0; $i < (length $s) - 1; $i++) {
    if (substr($s, $i, 1) ne substr($s, $i + 1, 1)) {
        print substr($s, $i, 1);
    }
}

print substr($s, (length $s) - 1, 1);

# didn't pass all cases, no idea why:
# my $s = <>;
# $s =~ s/(.)\1+/$1/g;
# print $s;
