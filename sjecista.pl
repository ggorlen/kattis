sub binomial_coefficient {
    my $n = shift;
    my $k = shift;
    my $res = $n;

    for (my $i = 2; $i <= $k; $i++) {
        $res *= ($n - $i + 1) / $i;
    }

    return $res;
}

my $n = <>;
print binomial_coefficient $n, 4;
