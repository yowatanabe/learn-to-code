from collections import defaultdict


def longest_subarray_at_most_k_distinct(nums, k):
    # スライディングウィンドウ + ハッシュマップで解く
    left = 0
    freq = defaultdict(int)  # 各値の出現回数
    distinct_count = 0  # 異なる値の種類数
    ans = 0

    for right, value in enumerate(nums):
        # 右端に value を追加
        if freq[value] == 0:
            distinct_count += 1
        freq[value] += 1

        # 異なる値が k を超えたら、左端を縮める
        while distinct_count > k:
            left_value = nums[left]
            freq[left_value] -= 1
            if freq[left_value] == 0:
                distinct_count -= 1
            left += 1  # ウィンドウの左端を右に動かす

        # 現在のウィンドウ長を更新
        current_length = right - left + 1
        if current_length > ans:
            ans = current_length

    return ans


if __name__ == "__main__":
    # 実行例1
    nums1 = [1, 2, 1, 2, 3]
    k1 = 2
    print(longest_subarray_at_most_k_distinct(nums1, k1))  # 4

    # 実行例2
    nums2 = [4, 4, 4, 4]
    k2 = 1
    print(longest_subarray_at_most_k_distinct(nums2, k2))  # 4

    # 実行例3
    nums3 = [1, 2, 3, 4, 5]
    k3 = 3
    print(longest_subarray_at_most_k_distinct(nums3, k3))  # 3
