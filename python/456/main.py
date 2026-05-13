def longest_balanced_logs(logs):
    score = 0
    first_seen = {0: -1}
    max_length = 0

    for i, log in enumerate(logs):
        if log == "error":
            score += 1
        else:
            score -= 1

        if score in first_seen:
            max_length = max(max_length, i - first_seen[score])
        else:
            first_seen[score] = i

    return max_length


# 実行例
logs1 = ["error", "ok", "ok", "error", "error", "ok"]
logs2 = ["error", "error", "ok"]
logs3 = ["ok", "ok", "ok"]

print(longest_balanced_logs(logs1))  # 6
print(longest_balanced_logs(logs2))  # 2
print(longest_balanced_logs(logs3))  # 0
