def min_log_window(logs):
    # 配列全体に含まれる異なるサービス数
    target_count = len(set(logs))

    # 現在のウィンドウ内の各サービス出現回数
    count = {}

    left = 0
    formed = 0  # 現在のウィンドウで含められている異なるサービス数
    answer = float("inf")

    for right in range(len(logs)):
        service = logs[right]
        count[service] = count.get(service, 0) + 1

        # そのサービスが初めてウィンドウに入ったとき
        if count[service] == 1:
            formed += 1

        # 全種類そろっている間、左を縮めて最短化する
        while formed == target_count:
            current_length = right - left + 1
            answer = min(answer, current_length)

            left_service = logs[left]
            count[left_service] -= 1

            # あるサービスがウィンドウから完全に消えた
            if count[left_service] == 0:
                formed -= 1

            left += 1

    return answer


# 実行例
logs1 = ["auth", "db", "cache", "auth", "queue", "db"]
logs2 = ["api", "api", "api"]
logs3 = ["web", "db", "web", "cache", "db", "queue", "cache"]

print(min_log_window(logs1))  # 4
print(min_log_window(logs2))  # 1
print(min_log_window(logs3))  # 4
