r, g, b, k = map(int, input().split())

if b or g:
    print(r + k)
else:
    print(max(r, r + k - 2))
