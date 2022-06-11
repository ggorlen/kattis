order = dict(zip("ABC", sorted(input().split(), key=int)))
print(*map(order.get, input()), sep=" ")
