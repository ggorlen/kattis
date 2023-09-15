def count_ways(G, n):
    dp = [[0] * n for _ in range(n)]

    for i in range(0, len(G)):
        if G[i][0] == "#":
            break

        dp[i][0] = 1

    for i in range(0, len(G[0])):
        if G[0][i] == "#":
            break

        dp[0][i] = 1

    for i in range(1, len(G)):
        for j in range(1, len(G[i])):
            if G[i][j] != "#":
                dp[i][j] += dp[i - 1][j] + dp[i][j - 1]

    return dp[-1][-1] % (2**31 - 1)


def reachable(G, n):
    dirs = (1, 0), (0, 1), (-1, 0), (0, -1)
    seen = [[False] * n for _ in range(n)]
    stack = [(0, 0)]

    while stack:
        tile = stack.pop()
        x, y = tile

        if x == n - 1 and y == n - 1:
            return True
        elif (
            x < 0 or x >= n or y < 0 or y >= n or
            seen[x][y] or G[x][y] == "#"
        ):
            continue

        seen[x][y] = tile

        for xx, yy in dirs:
            stack.append((x + xx, y + yy))

    return False


def main():
    n = int(input())
    G = [input() for _ in range(n)]
    ways = count_ways(G, n)

    if ways:
        return print(ways)
    elif reachable(G, n):
        return print("THE GAME IS A LIE")

    print("INCONCEIVABLE")


if __name__ == "__main__":
    main()
