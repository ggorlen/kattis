from sys import stdin

def main():
    for _ in range(int(next(stdin))):
        forward = True
        trim_from_front = 0
        trim_from_rear = 0

        for op in next(stdin):
            if op == "R":
                forward = not forward
            elif op == "\n":
                break
            elif forward:
                trim_from_front += 1
            else:
                trim_from_rear += 1

        n = int(next(stdin))

        if trim_from_front + trim_from_rear > n:
            print("error")
            next(stdin)
            continue
        elif trim_from_front + trim_from_rear == n:
            print("[]")
            next(stdin)
            continue

        x = next(stdin)[1:-2].split(",")

        if trim_from_rear > 0:
            x = x[trim_from_front:-trim_from_rear]
        elif trim_from_front > 0:
            x = x[trim_from_front:]

        print("[", end="")
        if not forward:
            x = reversed(x)
        print(",".join(x), end="")
        print("]")


if __name__ == "__main__":
    main()
