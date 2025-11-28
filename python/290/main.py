from typing import List


def three_sum(nums: List[int]) -> List[List[int]]:
    """
    和が0になる3つ組をすべて返す。
    配列をソートして、1つ固定 + 2-pointer で O(n^2) で解く。
    """
    nums.sort()
    n = len(nums)
    result = []

    for i in range(n):
        # 1つ目の要素が前と同じならスキップ（重複3つ組を避ける）
        if i > 0 and nums[i] == nums[i - 1]:
            continue

        target = -nums[i]
        left = i + 1
        right = n - 1

        # 2-pointer で nums[left] + nums[right] == target を探す
        while left < right:
            s = nums[left] + nums[right]
            if s == target:
                result.append([nums[i], nums[left], nums[right]])

                # 同じ値をスキップして重複を防ぐ
                left_val = nums[left]
                right_val = nums[right]
                while left < right and nums[left] == left_val:
                    left += 1
                while left < right and nums[right] == right_val:
                    right -= 1

            elif s < target:
                left += 1
            else:
                right -= 1

    return result


if __name__ == "__main__":
    # 実行例1
    nums1 = [-1, 0, 1, 2, -1, -4]
    print("例1の入力:", nums1)
    print("例1の結果:", three_sum(nums1))  # [[-1, -1, 2], [-1, 0, 1]] など

    # 実行例2
    nums2 = [0, 1, 1]
    print("例2の入力:", nums2)
    print("例2の結果:", three_sum(nums2))  # []

    # 実行例3
    nums3 = [0, 0, 0, 0]
    print("例3の入力:", nums3)
    print("例3の結果:", three_sum(nums3))  # [[0, 0, 0]]
