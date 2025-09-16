def find_duplicate(nums: list[int]) -> int:
    """
    Floyd の循環検出（トータス＆ヘア）を利用。
    インデックスをノード、nums[i] を次ノードへの「ポインタ」とみなすと、
    値域が 1..n、要素数が n+1 のため必ずサイクルができ、重複値がサイクル入口。
    """

    # 1) サイクル内での衝突点を見つける
    slow = nums[0]
    fast = nums[nums[0]]
    while slow != fast:
        slow = nums[slow]
        fast = nums[nums[fast]]

    # 2) 入口（= 重複値）を特定
    slow = 0
    while slow != fast:
        slow = nums[slow]
        fast = nums[fast]

    return slow


# テスト
print(find_duplicate([1, 3, 4, 2, 2]))  # 2
print(find_duplicate([3, 1, 3, 4, 2]))  # 3
print(find_duplicate([2, 5, 9, 6, 9, 3, 8, 9, 7, 1]))  # 9
