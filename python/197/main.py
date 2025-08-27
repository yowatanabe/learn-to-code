from typing import List


def min_jumps(nums: List[int]) -> int:
    n = len(nums)
    if n <= 1:
        return 0
    if nums[0] == 0:
        return -1 if n > 1 else 0

    jumps = 0
    cur_end = 0       # 現在のジャンプ回数で到達可能な右端
    farthest = 0     # 次のジャンプ回数で到達可能な最遠位置

    for i in range(n - 1):  # 最後のマスは踏むだけなので n-1 まででOK
        farthest = max(farthest, i + nums[i])

        # 現在のジャンプの到達範囲を使い切ったら、ジャンプを増やす
        if i == cur_end:
            jumps += 1
            cur_end = farthest
            if cur_end >= n - 1:
                return jumps

        # 次に進む範囲が広がらない＝以降も到達不可
        if i == cur_end and farthest <= i:
            return -1

    # ループを抜けても到達できなかった場合の保険
    return jumps if cur_end >= n - 1 else -1


# テスト
print(min_jumps([2,3,1,1,4]))   # 2
print(min_jumps([2,3,0,1,4]))   # 2
print(min_jumps([0]))           # 0
print(min_jumps([1,0,1,0]))     # -1
