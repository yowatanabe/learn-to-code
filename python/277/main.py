def max_sub_array_sum(nums):
    """
    連続部分列の和の最大値を求める。
    動的計画法（Kadaneのアルゴリズム）を使って解く。
    """
    if not nums:
        return 0

    # 初期状態の最大和を最初の要素に設定
    current_max = nums[0]
    global_max = nums[0]

    # 配列を1から走査していく
    for num in nums[1:]:
        # 現在の部分列の和を決める（前の部分列の最大和 + 現在の要素と、現在の要素単独）
        current_max = max(num, current_max + num)

        # 最大和を更新
        global_max = max(global_max, current_max)

    return global_max


# 要求どおり、print で結果を出力
if __name__ == "__main__":
    # 例1
    nums1 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    print(max_sub_array_sum(nums1))  # 6

    # 例2
    nums2 = [1]
    print(max_sub_array_sum(nums2))  # 1

    # 例3
    nums3 = [5, 4, -1, 7, 8]
    print(max_sub_array_sum(nums3))  # 23

    # 例4
    nums4 = [-1, -2, -3, -4]
    print(max_sub_array_sum(nums4))  # -1
