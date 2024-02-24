use strict;
use warnings;

my $s = <>;
$s =~ s/[^a-z]//ig;
$s = lc $s;
chomp $s;

for my $i (0..length($s) - 1) {
    if (
        $i < length($s) - 1 &&
        substr($s, $i, 1) eq substr($s, $i + 1, 1)
    ) {
        print "Palindrome\n";
        exit;
    }

    my $l = $i - 1;
    my $r = $i + 1;
    
    while ($l >= 0 && $r < length($s)) {
        my $ll = substr($s, $l, 1);
        my $rr = substr($s, $r, 1);

        if ($ll eq $rr) {
            print "Palindrome\n";
            exit;
        }
        else {
            last;
        }
    }
}

print "Anti-palindrome\n";
