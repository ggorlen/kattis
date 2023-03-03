import re

d = dict(B="K", L="H", R="S")
print(re.sub("RBL|RLB|LBR|LRB|BLR|BRL|.", lambda m: d.get(m[0], "C"), input()))
