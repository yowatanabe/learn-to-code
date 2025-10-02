from typing import List


def three_sum(nums: List[int]) -> List[List[int]]:
    """
    方針:
      1) ソートして基準 i を左から走査
      2) 残りを two-pointer（l, r）で 0 - nums[i] を探す
      3) i, l, r は同じ値をスキップして重複排除
    計算量: O(n^2), 追加メモリ: O(1)（出力を除く）
    """
    nums.sort()
    n = len(nums)
    res = []

    for i in range(n):
        # 基準の重複スキップ
        if i > 0 and nums[i] == nums[i - 1]:
            continue
        # 以降が正に偏っていたら早期終了（nums[i] > 0 なら以降の和は必ず正）
        if nums[i] > 0:
            break

        target = -nums[i]
        l, r = i + 1, n - 1
        while l < r:
            s = nums[l] + nums[r]
            if s == target:
                res.append([nums[i], nums[l], nums[r]])
                # l, r の重複スキップ
                v_l, v_r = nums[l], nums[r]
                while l < r and nums[l] == v_l:
                    l += 1
                while l < r and nums[r] == v_r:
                    r -= 1
            elif s < target:
                l += 1
            else:
                r -= 1

    return res


# テスト
print(three_sum([-1, 0, 1, 2, -1, -4]))  # [[-1,-1,2], [-1,0,1]]
print(three_sum([0, 1, 1]))  # []
print(three_sum([0, 0, 0, 0]))  # [[0,0,0]]
