def has_pair_with_sum(nums, target):
    seen = set()
    for num in nums:
        if target - num in seen:
            return True
        seen.add(num)
    return False


# テスト
print(has_pair_with_sum([2, 7, 11, 15], 9))  # True
print(has_pair_with_sum([1, 2, 3, 4], 8))  # False
print(has_pair_with_sum([3, 3], 6))  # True
