def min_required_event_window(events, required):
    required_set = set(required)
    need_count = len(required_set)

    window_count = {}
    formed = 0
    left = 0
    answer = float("inf")

    for right, event in enumerate(events):
        if event in required_set:
            window_count[event] = window_count.get(event, 0) + 1

            if window_count[event] == 1:
                formed += 1

        while formed == need_count:
            answer = min(answer, right - left + 1)

            left_event = events[left]

            if left_event in required_set:
                window_count[left_event] -= 1

                if window_count[left_event] == 0:
                    formed -= 1

            left += 1

    return 0 if answer == float("inf") else answer


# 実行例
events1 = ["login", "db", "error", "cache", "db", "timeout"]
required1 = ["error", "timeout"]

events2 = ["api", "db", "cache"]
required2 = ["api", "cache"]

events3 = ["api", "db"]
required3 = ["api", "error"]

print(min_required_event_window(events1, required1))  # 4
print(min_required_event_window(events2, required2))  # 3
print(min_required_event_window(events3, required3))  # 0
