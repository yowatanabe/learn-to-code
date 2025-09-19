from typing import List


def next_permutation(nums: List[int]) -> List[int]:
    """
    手順:
    1) 右から見て最初に nums[i] < nums[i+1] を満たす i を探す（「下降の崩れ目」）
       見つからなければ配列を昇順にして終了
    2) ふたたび右から、nums[i] より大きい最小の要素 nums[j] を探して交換
    3) 末尾の区間 [i+1 ..] を昇順にする（= 反転）
    すべて in-place、追加メモリ O(1)
    """
    n = len(nums)
    if n <= 1:
        return nums

    # 1) ピボット i を探す
    i = n - 2
    while i >= 0 and nums[i] >= nums[i + 1]:
        i -= 1

    if i >= 0:
        # 2) 右端から nums[i] より大きい最小の要素を探す
        j = n - 1
        while nums[j] <= nums[i]:
            j -= 1
        nums[i], nums[j] = nums[j], nums[i]

    # 3) 末尾を反転（最小化）
    l, r = i + 1, n - 1
    while l < r:
        nums[l], nums[r] = nums[r], nums[l]
        l += 1
        r -= 1
    return nums


# テスト
print(next_permutation([1, 2, 3]))  # [1,3,2]
print(next_permutation([3, 2, 1]))  # [1,2,3]
print(next_permutation([1, 1, 5]))  # [1,5,1]
print(next_permutation([1, 3, 2]))  # [2,1,3]
