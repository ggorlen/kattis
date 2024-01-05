<>;
my $allowed = <>;
my $total = <>;
my $non = 0;

while (<>) {
    if ($_ =~ /^ekki/) {
        $non++;
    }
}

print $non / $total > $allowed ? "Neibb\n" : "Jebb\n";
