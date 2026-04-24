def max_concurrent_tickets(tickets):
    events = []

    for start, end in tickets:
        events.append((start, 1))   # 開始
        events.append((end, -1))    # 終了

    # 同じ時刻では、終了を開始より先に処理する
    # [start, end) なので end 時刻にはもう対応中ではないため
    events.sort(key=lambda x: (x[0], x[1]))

    current = 0
    answer = 0

    for _, change in events:
        current += change
        answer = max(answer, current)

    return answer


# 実行例
tickets1 = [[1, 5], [2, 6], [4, 8]]
tickets2 = [[1, 3], [3, 5], [5, 7]]
tickets3 = [[10, 20], [15, 25], [20, 30]]

print(max_concurrent_tickets(tickets1))  # 3
print(max_concurrent_tickets(tickets2))  # 1
print(max_concurrent_tickets(tickets3))  # 2
