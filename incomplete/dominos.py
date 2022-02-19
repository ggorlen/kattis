'''
https://stackoverflow.com/questions/70574105/seeking-feedback-to-improve-time-complexity-of-my-code-for-dominos-kattis-questi

1
3 2
1 2
2 3

1
4 2
1 2
2 3

1
7 4
1 2
2 3
4 5
5 6

1
7 3
2 3
4 5
6 7
'''

for _ in range(int(input())):
    n, lines = map(int, input().split())
    topples = {}
    
    for _ in range(lines):
        x, y = map(int, input().split())
        topples[x] = y

    toppled = 0
    not_toppled = n

    for k in list(topples):
        run = 0
        if k in topples:
            toppled += 1
            not_toppled -= 1

            while k in topples:
                k = topples.pop(k)
                not_toppled -= 1
        
    print(not_toppled + toppled)

