def min_jumps(jumps):
    # 要素数が1なら、すでに最後のサーバーにいる
    if len(jumps) == 1:
        return 0

    step_count = 0
    current_end = 0
    farthest = 0

    for i in range(len(jumps) - 1):
        farthest = max(farthest, i + jumps[i])

        # 現在のジャンプで到達できる範囲を使い切ったら、
        # 次のジャンプを確定する
        if i == current_end:
            step_count += 1
            current_end = farthest

    return step_count


# 実行例
jumps1 = [2, 3, 1, 1, 4]
jumps2 = [2, 3, 0, 1, 4]
jumps3 = [1, 2, 1, 1, 1]

print(min_jumps(jumps1))  # 2
print(min_jumps(jumps2))  # 2
print(min_jumps(jumps3))  # 3
