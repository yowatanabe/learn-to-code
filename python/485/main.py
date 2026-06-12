def length_of_longest_unique_events(events):
    last_seen = {}
    left = 0
    answer = 0

    for right, ch in enumerate(events):
        if ch in last_seen and last_seen[ch] >= left:
            left = last_seen[ch] + 1

        last_seen[ch] = right
        answer = max(answer, right - left + 1)

    return answer


# 実行例
events1 = "abcabcbb"
events2 = "bbbbb"
events3 = "pwwkew"

print(length_of_longest_unique_events(events1))  # 3
print(length_of_longest_unique_events(events2))  # 1
print(length_of_longest_unique_events(events3))  # 3
