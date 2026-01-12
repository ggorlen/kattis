# wrong answer
use strict;
use warnings;

while (<>) {
    if ($_ < 1) {
        print 0;
    }
    elsif ($_ == 1) {
        print 1;
    }
    else {
        print (($_ * 2 - 2) . "\n");
    }
}

# 2 2
# 3 4
# 4 6
# 5 8
# 6 10
# 
# BB
# xx
# 
# BBB
# xxx
# xBx
# 
# BBBB
# xxxx
# xxxx
# xBBx
# 
# BBBBB
# xxxxx
# xxxxx
# xxxxx
# xBBBx
# 
# BBBBBB
# xxxxxx
# xxxxxx
# xxxxxx
# xxxxxx
# xBBBBx
# 
# BBBBBBB
# xxxxxxx
# xxxxxxx
# xxxxxxx
# xxxxxxx
# xxxxxxx
# xBBBBBx
