w, h, n = map(int, input().split())
board = [["_" for _ in range(w)] for _ in range(h)]
stickers = []

for _ in range(n):
    w, h, c, r = map(int, input().split())
    stickers.append((w, h, c, r))

for y in range(len(board)):
    for x in range(len(board[y])):
        for i, (w, h, c, r) in enumerate(stickers):
            if x >= c and x < (w + c) and y >= r and y < (h + r):
                board[y][x] = chr(i + 97)

for row in board:
    print("".join(row))
