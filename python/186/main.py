from typing import List


def three_sum(nums: List[int]) -> List[List[int]]:
    nums.sort()
    n = len(nums)
    res = []

    for i in range(n):
        # 先頭要素の重複スキップ
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        # 残り2つを二-pointerで探索
        left, right = i + 1, n - 1
        target = -nums[i]

        while left < right:
            s = nums[left] + nums[right]
            if s == target:
                res.append([nums[i], nums[left], nums[right]])
                # 次の候補へ。重複をスキップ
                left_val, right_val = nums[left], nums[right]
                while left < right and nums[left] == left_val:
                    left += 1
                while left < right and nums[right] == right_val:
                    right -= 1
            elif s < target:
                left += 1
            else:
                right -= 1

    return res


# テスト
print(three_sum([-1, 0, 1, 2, -1, -4]))  # [[-1, -1, 2], [-1, 0, 1]] など順不同
print(three_sum([0, 0, 0, 0]))  # [[0, 0, 0]]
print(three_sum([1, 2, -2, -1]))  # []
