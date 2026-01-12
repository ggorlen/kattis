input()
s = input()

try:
    index_of_L = s.index("l")
except:
    index_of_L = -1

if "lv" in s:
    print(0)
elif index_of_L < 0 and "v" not in s:
    print(2)
else:
    print(1)
