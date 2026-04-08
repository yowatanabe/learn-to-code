def longest_unique_events(events):
    last_index = {}   # 各イベントが最後に出現した位置
    left = 0
    max_length = 0

    for right in range(len(events)):
        event = events[right]

        # 現在のウィンドウ内に同じイベントがあれば、
        # left をその次の位置まで進める
        if event in last_index and last_index[event] >= left:
            left = last_index[event] + 1

        last_index[event] = right
        max_length = max(max_length, right - left + 1)

    return max_length


# 実行例
events1 = ["login", "deploy", "scale", "deploy", "alert"]
events2 = ["a", "b", "c", "d"]
events3 = ["db", "db", "db"]

print(longest_unique_events(events1))  # 3
print(longest_unique_events(events2))  # 4
print(longest_unique_events(events3))  # 1
