people = {}
baseline = 0
n, q = map(int, input().split())

for _ in range(q):
    command, *args = input().split()

    if command == "SET":
        people[int(args[0])] = int(args[1])
    elif command == "RESTART":
        people.clear()
        baseline = int(args[0])
    elif command == "PRINT":
        print(people.get(int(args[0]), baseline))
