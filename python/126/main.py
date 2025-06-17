def sum_positive(nums):
    return sum(n for n in nums if n > 0)


# テスト
print(sum_positive([1, -2, 3, 0, -5]))  # 出力: 4
print(sum_positive([0, 0, 0]))  # 出力: 0
print(sum_positive([10, 20, -10]))  # 出力: 30
