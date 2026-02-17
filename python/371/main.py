from typing import List

def find_min(nums: List[int]) -> int:
    left, right = 0, len(nums) - 1

    while left < right:
        mid = (left + right) // 2

        if nums[mid] < nums[right]:
            right = mid
        elif nums[mid] > nums[right]:
            left = mid + 1
        else:
            right -= 1  # 重複で判定できない分を削る

    return nums[left]


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([2, 2, 2, 0, 1], 0),
        ([1, 3, 5], 1),
        ([10, 1, 10, 10, 10], 1),
    ]

    for i, (nums, expected) in enumerate(cases, start=1):
        got = find_min(nums)
        print(f"例{i} 入力: nums={nums}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 60)
