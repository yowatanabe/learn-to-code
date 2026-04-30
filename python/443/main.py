def earliest_full_recovery(n, events):
    events.sort(key=lambda x: x[0])

    recovered = set()

    for time, service in events:
        recovered.add(service)

        if len(recovered) == n:
            return time

    return -1


# 実行例
n1 = 3
events1 = [[5, 0], [2, 1], [8, 2], [3, 0]]

n2 = 4
events2 = [[1, 0], [2, 1], [3, 2]]

n3 = 2
events3 = [[10, 1], [5, 1], [7, 0]]

print(earliest_full_recovery(n1, events1))  # 8
print(earliest_full_recovery(n2, events2))  # -1
print(earliest_full_recovery(n3, events3))  # 7
