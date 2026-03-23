from typing import List

def search_rotated_array(nums: List[int], target: int) -> int:
    """
    ローテーションされた昇順配列に対する二分探索。

    ポイント:
    - mid を基準に、左半分か右半分のどちらかは必ずソートされている
    - ソートされている側に target が入るかを判定して探索範囲を絞る

    計算量: O(log n)
    """
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = (left + right) // 2

        if nums[mid] == target:
            return mid

        # 左側がソートされている場合
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        # 右側がソートされている場合
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1

    return -1


if __name__ == "__main__":
    print(search_rotated_array([4, 5, 6, 7, 0, 1, 2], 0))  # 4
    print(search_rotated_array([4, 5, 6, 7, 0, 1, 2], 3))  # -1
    print(search_rotated_array([1], 0))                    # -1
