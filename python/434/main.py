def longest_uptime(status, k):
    left = 0
    down_count = 0
    max_length = 0

    for right in range(len(status)):
        if status[right] == "down":
            down_count += 1

        # "down" が k 個を超えたら左端を縮める
        while down_count > k:
            if status[left] == "down":
                down_count -= 1
            left += 1

        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
status1 = ["up", "down", "up", "up", "down", "up"]
k1 = 1

status2 = ["down", "down", "up", "down", "up", "up"]
k2 = 2

status3 = ["down", "down", "down"]
k3 = 3

print(longest_uptime(status1, k1))  # 4
print(longest_uptime(status2, k2))  # 5
print(longest_uptime(status3, k3))  # 3
