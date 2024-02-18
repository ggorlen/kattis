# Adapted from https://stackoverflow.com/q/78012472/6243352
from collections import Counter


def read_ints():
    return map(int, input().split())


def cmp(card):
    buy, sell, count = card
    cost_to_buy = (2 - count) * buy
    sale_profit = count * sell

    # Items with a low cost to buy (taking into account
    # owned items), or with a low profit from selling,
    # prioritize buying this item.
    #
    # Then sell everything else (high cost to buy the amount
    # needed, or earn a good profit from selling).
    return cost_to_buy + sale_profit


n, t, k = read_ints()
deck = Counter(read_ints())
prices = []

for i in range(t):
    prices.append(tuple(read_ints()) + (deck.get(i + 1, 0),))

prices.sort(key=cmp)
money = 0

for i, (buy, sell, count) in enumerate(prices):
    if i < k:
        money -= (2 - count) * buy
    else:
        money += count * sell

print(money)
