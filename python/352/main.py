from typing import List


def minimize_max_after_splitting(nums: List[int], k: int) -> int:
    if not nums:
        return 0

    left, right = 1, max(
        nums
    )  # 最大値の最小は1（0だけの配列なら0もあり得るが今回は max で吸収）

    # nums が全部 0 の場合
    if right == 0:
        return 0

    def needed_ops(x: int) -> int:
        ops = 0
        for v in nums:
            if v > x:
                # ceil(v/x)-1 = (v-1)//x
                ops += (v - 1) // x
                if ops > k:  # 早期終了
                    return ops
        return ops

    while left < right:
        mid = (left + right) // 2
        if needed_ops(mid) <= k:
            right = mid
        else:
            left = mid + 1

    return left


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([9], 2, 3),
        ([7, 2, 5], 1, 5),
        ([1, 1, 1], 10, 1),
    ]

    for i, (nums, k, expected) in enumerate(cases, start=1):
        got = minimize_max_after_splitting(nums, k)
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
