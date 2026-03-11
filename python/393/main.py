from typing import List

def min_jumps(nums: List[int]) -> int:
    """
    Greedy で解く典型問題。

    current_end:
        今のジャンプ回数で到達できる範囲の右端
    farthest:
        次のジャンプで到達できる最遠位置

    配列を左から見ていき、
    current_end に到達したらジャンプ回数を1増やし、
    次の範囲を farthest に更新する。

    計算量: O(n)
    """
    n = len(nums)
    if n <= 1:
        return 0

    jumps = 0
    current_end = 0
    farthest = 0

    # 最後の位置ではジャンプ不要なので n-1 まで見る
    for i in range(n - 1):
        farthest = max(farthest, i + nums[i])

        # 今のジャンプで行ける範囲を使い切ったら次のジャンプ
        if i == current_end:
            jumps += 1
            current_end = farthest

    return jumps


if __name__ == "__main__":
    print(min_jumps([2, 3, 1, 1, 4]))  # 2
    print(min_jumps([2, 3, 0, 1, 4]))  # 2
    print(min_jumps([1, 2, 1, 1, 1]))  # 3
