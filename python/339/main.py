from typing import List


def maximum_sum_one_deletion(nums: List[int]) -> int:
    # 初期化：最初の要素で始める（空はNG）
    keep = nums[0]  # 削除なし
    drop = float("-inf")  # 削除1回（まだ削除してないので -inf）
    ans = nums[0]

    for i in range(1, len(nums)):
        x = nums[i]
        prev_keep = keep

        keep = max(keep + x, x)
        drop = max(drop + x, prev_keep)  # x を削除する or 既に削除して継続

        ans = max(ans, keep, drop)

    return ans


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([1, -2, 0, 3], 4),
        ([1, -2, -2, 3], 2),
        ([-1, -1, -1, -1], -1),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = maximum_sum_one_deletion(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
