from collections import Counter


def top_k_events(events, k):
    count = Counter(events)

    sorted_events = sorted(
        count.keys(),
        key=lambda event: (-count[event], event)
    )

    return sorted_events[:k]


# 実行例
events1 = ["error", "warn", "error", "info", "warn", "error"]
k1 = 2

events2 = ["db", "api", "cache", "api", "db"]
k2 = 2

events3 = ["a", "b", "c"]
k3 = 3

print(top_k_events(events1, k1))  # ['error', 'warn']
print(top_k_events(events2, k2))  # ['api', 'db']
print(top_k_events(events3, k3))  # ['a', 'b', 'c']
