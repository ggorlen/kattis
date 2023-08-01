def minimize_trips(target, best, seen=None, a_taken=0, b_taken=0):
    if seen is None:
        seen = set()

    if (target, a_taken, b_taken) in seen:
        return

    seen.add((target, a_taken, b_taken))

    if target <= 0:
        candidate = a_taken * a_cost + b_taken * b_cost

        if candidate < best["val"]:
            best["val"] = candidate
            best["a_taken"] = a_taken
            best["b_taken"] = b_taken
    else:
        minimize_trips(target - a_cap, best, seen, a_taken + 1, b_taken)
        minimize_trips(target - b_cap, best, seen, a_taken, b_taken + 1)

(a_cost, a_cap, b_cost, b_cap, target) = map(int, input().split())
best = dict(val=float("inf"), a_taken=None, b_taken=None)
minimize_trips(target, best)
print(best["a_taken"], best["b_taken"], best["val"])
