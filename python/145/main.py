def maxProduct(nums: list[int]) -> int:
    if not nums:
        return 0

    max_prod = min_prod = result = nums[0]

    for num in nums[1:]:
        if num < 0:
            max_prod, min_prod = min_prod, max_prod

        max_prod = max(num, max_prod * num)
        min_prod = min(num, min_prod * num)

        result = max(result, max_prod)

    return result


# テスト
print(maxProduct([2, 3, -2, 4]))  # 出力: 6
print(maxProduct([-2, 0, -1]))  # 出力: 0
