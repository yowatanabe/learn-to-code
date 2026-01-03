def min_sum_subarray(nums: list[int], k: int) -> int:
    # 初めに最初のk個の合計を求める
    current_sum = sum(nums[:k])
    min_sum = current_sum

    # スライディングウィンドウ
    for i in range(k, len(nums)):
        current_sum += nums[i] - nums[i - k]
        min_sum = min(min_sum, current_sum)

    return min_sum


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([2, 1, 3, 4, 1, 2], 3),  # 例1
        ([5, -2, 3, 4, -1], 2),   # 例2
        ([1, 2, 3], 3),           # 例3
        ([-1, -2, -3, -4], 2),    # 例4
    ]

    for i, (nums, k) in enumerate(cases, start=1):
        print(f"例{i} 入力: nums={nums}, k={k}")
        print(f"例{i} 出力: {min_sum_subarray(nums, k)}")
        print("-" * 40)
