# Kandane's algorithm, from Wikipedia
def max_subarray(numbers):
    best_sum = - float("inf")
    current_sum = 0
    for x in numbers:
        current_sum = max(x, current_sum + x)
        best_sum = max(best_sum, current_sum)
    return best_sum


_, p = list(map(int, input().split()))
print(max_subarray([int(x) - p for x in input().split()]))
