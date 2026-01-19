def recurrence_index(x):
    if x == "1":
        return 1

    iterations = 1

    while True:
        x1 = len(str(x))

        if x1 == x:
            return iterations

        iterations += 1
        x = x1


while True:
    x = input()

    if x == "END":
        break

    print(recurrence_index(x))
