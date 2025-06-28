def single_number(nums):
    result = 0
    for num in nums:
        result ^= num  # XOR演算でペアを打ち消す
    return result


# テスト
print(single_number([2, 2, 1]))  # 出力: 1
print(single_number([4, 1, 2, 1, 2]))  # 出力: 4
print(single_number([1]))  # 出力: 1
