def longest_unique_server_window(servers):
    last_seen = {}
    left = 0
    answer = 0

    for right, zone in enumerate(servers):
        if zone in last_seen and last_seen[zone] >= left:
            left = last_seen[zone] + 1

        last_seen[zone] = right
        answer = max(answer, right - left + 1)

    return answer


# 実行例
servers1 = [1, 2, 3, 1, 2, 3, 4]
servers2 = [5, 5, 5]
servers3 = [1, 2, 1, 3, 4]

print(longest_unique_server_window(servers1))  # 4
print(longest_unique_server_window(servers2))  # 1
print(longest_unique_server_window(servers3))  # 4
