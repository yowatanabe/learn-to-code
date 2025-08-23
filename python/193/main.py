from typing import List


def search_range(nums: List[int], target: int) -> List[int]:
    def lower_bound(a: List[int], x: int) -> int:
        # x 以上が初めて現れる位置
        lo, hi = 0, len(a)
        while lo < hi:
            mid = (lo + hi) // 2
            if a[mid] < x:
                lo = mid + 1
            else:
                hi = mid
        return lo

    def upper_bound(a: List[int], x: int) -> int:
        # x より大きい値が初めて現れる位置
        lo, hi = 0, len(a)
        while lo < hi:
            mid = (lo + hi) // 2
            if a[mid] <= x:
                lo = mid + 1
            else:
                hi = mid
        return lo

    left = lower_bound(nums, target)
    right = upper_bound(nums, target) - 1
    if left <= right and 0 <= left < len(nums) and nums[left] == target:
        return [left, right]
    return [-1, -1]


# テスト
print(search_range([5, 7, 7, 8, 8, 10], 8))  # [3,4]
print(search_range([5, 7, 7, 8, 8, 10], 6))  # [-1,-1]
print(search_range([2, 2, 2, 2], 2))  # [0,3]
print(search_range([1], 1))  # [0,0]
