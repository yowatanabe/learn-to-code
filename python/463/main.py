def min_ticket_jumps(tickets):
    n = len(tickets)

    if n == 1:
        return 0

    jumps = 0
    current_end = 0
    farthest = 0

    for i in range(n - 1):
        farthest = max(farthest, i + tickets[i])

        # 現在到達できる範囲の終端まで来たら、ジャンプを1回確定する
        if i == current_end:
            jumps += 1
            current_end = farthest

            if current_end >= n - 1:
                return jumps

            # これ以上先に進めない
            if current_end == i:
                return -1

    return -1


# 実行例
tickets1 = [2, 3, 1, 1, 4]
tickets2 = [3, 2, 1, 0, 4]
tickets3 = [1, 1, 1, 1]

print(min_ticket_jumps(tickets1))  # 2
print(min_ticket_jumps(tickets2))  # -1
print(min_ticket_jumps(tickets3))  # 3
