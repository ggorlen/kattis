use strict;
use warnings;

<>;
while (<>) {
    my $n = $_;
    chomp $n;
    my $most = 0;

    for (my $i = 0; $i < length $n; $i++) {
        my $bin = sprintf "%b", (substr $n, 0, $i + 1); 
        my $count = 0;

        for my $bit (split //, $bin) {
            if ($bit == 1) {
                $count++;
            }
        }

        $most = $count > $most ? $count : $most;
    }

    print "$most\n";
}
