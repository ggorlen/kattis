n = int(input())
printers = 1

for day in range(1, 20):
    if printers >= n:
        break

    printers *= 2

print(day)
