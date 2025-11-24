def find_max_length(nums):
    """
    0 と 1 の数が等しい最長の連続部分配列の長さを返す。
    0 -> -1, 1 -> +1 とみなして累積和を取り、
    同じ累積和が再び現れた区間の長さを最大化する。
    """
    prefix_sum = 0
    first_seen = {
        0: -1
    }  # 累積和が初めて出現したインデックスを記録（0 は -1 として扱う）
    max_len = 0

    for i, num in enumerate(nums):
        # 0 を -1 とみなす
        if num == 0:
            prefix_sum -= 1
        else:
            prefix_sum += 1

        # 過去に同じ prefix_sum を見ていれば、その間の部分配列で 0 と 1 の数が等しい
        if prefix_sum in first_seen:
            length = i - first_seen[prefix_sum]
            if length > max_len:
                max_len = length
        else:
            # 初めての累積和は記録しておく
            first_seen[prefix_sum] = i

    return max_len


if __name__ == "__main__":
    # 実行例1
    nums1 = [0, 1]
    print("例1の入力:", nums1)
    print("例1の結果:", find_max_length(nums1))  # 2

    # 実行例2
    nums2 = [0, 1, 0]
    print("例2の入力:", nums2)
    print("例2の結果:", find_max_length(nums2))  # 2

    # 実行例3
    nums3 = [0, 0, 1, 0, 0, 0, 1, 1]
    print("例3の入力:", nums3)
    print("例3の結果:", find_max_length(nums3))  # 6

    # 実行例4
    nums4 = [0, 0, 0]
    print("例4の入力:", nums4)
    print("例4の結果:", find_max_length(nums4))  # 0
