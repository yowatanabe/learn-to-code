def second_largest(nums):
    if len(nums) < 2:
        return None
    first = second = float("-inf")
    for num in nums:
        if num > first:
            second = first
            first = num
        elif num > second:
            second = num
    return second


# テスト
print(second_largest([1, 3, 2, 4]))  # 3
print(second_largest([10, 5, 8]))  # 8
print(second_largest([42]))  # None
