# wrong answer, not sure what I'm missing

use strict;
use warnings;

<>;
my @eastern = split / /, <>;
my @northern = split / /, <>;

if ($eastern[0] != $northern[-1]) {
    print "impossible\n";
    exit;
}

for (@eastern) {
    if ($_ > $eastern[0]) {
        print "impossible\n";
        exit;
    }
}

for (@northern) {
    if ($_ > $northern[-1]) {
        print "impossible\n";
        exit;
    }
}

print "possible\n";
