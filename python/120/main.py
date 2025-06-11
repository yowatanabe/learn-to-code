def find_max(nums):
    max_val = nums[0]
    for num in nums:
        if num > max_val:
            max_val = num
    return max_val


# テスト
print(find_max([1, 5, 3, 9, 2]))  # 出力: 9
print(find_max([-10, -3, -100]))  # 出力: -3
