def longest_zero_sum_subarray(changes):
    prefix_sum = 0
    first_seen = {0: -1}  # 累積和 0 は index -1 の時点で出現したとみなす
    max_length = 0

    for i, value in enumerate(changes):
        prefix_sum += value

        # 同じ累積和が以前に出ていれば、その間の合計は 0
        if prefix_sum in first_seen:
            max_length = max(max_length, i - first_seen[prefix_sum])
        else:
            # 最初に出た位置だけ記録する
            first_seen[prefix_sum] = i

    return max_length


# 実行例
changes1 = [1, -1, 3, 2, -2, -3, 4]
changes2 = [2, -2, 1, -1, 3]
changes3 = [1, 2, 3]

print(longest_zero_sum_subarray(changes1))  # 4
print(longest_zero_sum_subarray(changes2))  # 4
print(longest_zero_sum_subarray(changes3))  # 0
