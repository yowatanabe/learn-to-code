def remaining_alerts(alerts, k):
    stack = []  # [alert_name, count]

    for alert in alerts:
        if stack and stack[-1][0] == alert:
            stack[-1][1] += 1
        else:
            stack.append([alert, 1])

        # ちょうど k 個そろったら削除
        if stack[-1][1] == k:
            stack.pop()

    remaining = 0
    for _, count in stack:
        remaining += count

    return remaining


# 実行例
alerts1 = ["db", "db", "api", "api", "api", "db", "db"]
k1 = 2

alerts2 = ["a", "a", "b", "b", "b", "a"]
k2 = 3

alerts3 = ["web", "web", "cache", "db"]
k3 = 2

print(remaining_alerts(alerts1, k1))  # 1
print(remaining_alerts(alerts2, k2))  # 0
print(remaining_alerts(alerts3, k3))  # 2
