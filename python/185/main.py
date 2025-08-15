def max_product(nums: list[int]) -> int:
    max_prod = nums[0]
    cur_max, cur_min = nums[0], nums[0]

    for num in nums[1:]:
        if num < 0:
            cur_max, cur_min = cur_min, cur_max  # 負の数で最大・最小を入れ替え
        cur_max = max(num, cur_max * num)
        cur_min = min(num, cur_min * num)
        max_prod = max(max_prod, cur_max)

    return max_prod


# テスト
print(max_product([2, 3, -2, 4]))  # 6
print(max_product([-2, 0, -1]))  # 0
print(max_product([-2, 3, -4]))  # 24
