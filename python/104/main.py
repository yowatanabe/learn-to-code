def max_min_difference(nums):
    if not nums:
        return 0  # 空リストの場合は0を返す（面接で仕様確認すると良いポイント）
    return max(nums) - min(nums)


# テスト
print(max_min_difference([1, 2, 3, 4, 5]))  # 4
print(max_min_difference([10, -2, 7, 4]))  # 12
print(max_min_difference([42]))  # 0
