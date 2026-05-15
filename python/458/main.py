def contains_nearby_duplicate(requests, k):
    last_seen = {}

    for i, user_id in enumerate(requests):
        if user_id in last_seen:
            if i - last_seen[user_id] <= k:
                return True

        last_seen[user_id] = i

    return False


# 実行例
requests1 = ["alice", "bob", "alice"]
k1 = 2

requests2 = ["api1", "api2", "api3", "api1"]
k2 = 2

requests3 = ["u1", "u1"]
k3 = 1

print(contains_nearby_duplicate(requests1, k1))  # True
print(contains_nearby_duplicate(requests2, k2))  # False
print(contains_nearby_duplicate(requests3, k3))  # True
