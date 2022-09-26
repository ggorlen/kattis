import re

def main():
    _, target = map(int, input().split())
    lookup = set()

    for num in input().split():
        n = int(num)

        if target - n in lookup:
            print("YES")
            return
        elif not re.search(r"[347]", num):
            rev = int(num[::-1])

            if target - rev in lookup:
                print("YES")
                return

            lookup.add(rev)

        lookup.add(n)

    print("NO")


if __name__ == "__main__":
    main()
