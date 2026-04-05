def longest_error_streak(statuses):
    left = 0
    ok_count = 0
    max_length = 0

    for right in range(len(statuses)):
        if statuses[right] == "ok":
            ok_count += 1

        # "ok" を2個以上含む場合は、条件を満たすまで左を縮める
        while ok_count > 1:
            if statuses[left] == "ok":
                ok_count -= 1
            left += 1

        # 現在の区間は「最大1個の ok を含む区間」
        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
statuses1 = ["error", "ok", "error", "error"]
statuses2 = ["ok", "ok", "error", "ok"]
statuses3 = ["error", "error", "error"]

print(longest_error_streak(statuses1))  # 4
print(longest_error_streak(statuses2))  # 2
print(longest_error_streak(statuses3))  # 3
