def average(nums):
    if not nums:
        return 0.0
    return sum(nums) / len(nums)


# テスト
print(average([1, 2, 3, 4, 5]))  # 3.0
print(average([10, 20, 30]))  # 20.0
print(average([]))  # 0.0
