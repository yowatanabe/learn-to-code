from typing import List

def product_except_self(nums: List[int]) -> List[int]:
    """
    割り算を使わずに各要素以外の積を求める。

    方針:
    1. answer[i] に「i より左側の積」を入れる
    2. 右側から走査しながら「i より右側の積」を掛ける

    例:
      nums = [1, 2, 3, 4]

      左積を入れた後:
      answer = [1, 1, 2, 6]

      右から掛けると:
      answer = [24, 12, 8, 6]

    計算量: O(n)
    追加メモリ: O(1)（出力配列を除く）
    """
    n = len(nums)
    answer = [1] * n

    # 左側の積
    left_product = 1
    for i in range(n):
        answer[i] = left_product
        left_product *= nums[i]

    # 右側の積を掛ける
    right_product = 1
    for i in range(n - 1, -1, -1):
        answer[i] *= right_product
        right_product *= nums[i]

    return answer


if __name__ == "__main__":
    print(product_except_self([1, 2, 3, 4]))         # [24, 12, 8, 6]
    print(product_except_self([-1, 1, 0, -3, 3]))    # [0, 0, 9, 0, 0]
    print(product_except_self([5, 2]))               # [2, 5]
