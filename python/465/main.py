def max_non_adjacent_savings(savings):
    # prev2: 2つ前まで見たときの最大値
    # prev1: 1つ前まで見たときの最大値
    prev2 = 0
    prev1 = 0

    for value in savings:
        current = max(prev1, prev2 + value)
        prev2 = prev1
        prev1 = current

    return prev1


# 実行例
savings1 = [2, 7, 9, 3, 1]
savings2 = [5, 1, 1, 5]
savings3 = [4]

print(max_non_adjacent_savings(savings1))  # 12
print(max_non_adjacent_savings(savings2))  # 10
print(max_non_adjacent_savings(savings3))  # 4
