from typing import List


def product_except_self(nums: List[int]) -> List[int]:
    """
    除算なしで answer[i] = nums[i] 以外の積を返す。
    O(n) 時間、出力以外 O(1) 追加メモリ。
    """
    n = len(nums)
    answer = [1] * n

    # 1) 左側の積を answer に入れる
    prefix = 1
    for i in range(n):
        answer[i] = prefix
        prefix *= nums[i]

    # 2) 右側の積を掛け合わせる
    suffix = 1
    for i in range(n - 1, -1, -1):
        answer[i] *= suffix
        suffix *= nums[i]

    return answer


if __name__ == "__main__":
    # 実行例1
    nums1 = [1, 2, 3, 4]
    print("例1の入力:", nums1)
    print("例1の結果:", product_except_self(nums1))  # [24, 12, 8, 6]

    # 実行例2
    nums2 = [-1, 1, 0, -3, 3]
    print("例2の入力:", nums2)
    print("例2の結果:", product_except_self(nums2))  # [0, 0, 9, 0, 0]
