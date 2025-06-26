def single_number(nums):
    result = 0
    for num in nums:
        result ^= num  # XOR演算を使ってペアを打ち消す
    return result


# テスト
print(single_number([2, 3, 5, 4, 5, 3, 4]))  # 出力: 2
print(single_number([10, 1, 1, 2, 2]))  # 出力: 10
