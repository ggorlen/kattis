n, distance = [int(x) for x in input().split()]
pitches = set()

for _ in range(n):
    pitches.add(int(input()))

pitches = sorted(list(pitches))
buckets = [[pitches[0]]]

for pitch in pitches:
    if pitch - buckets[-1][0] <= distance:
        buckets[-1].append(pitch)
    else:
        buckets.append([pitch])

print(len(buckets))
