from typing import List


def num_subarray_product_less_than_k(nums: List[int], k: int) -> int:
    """
    すべて正の整数 → スライディングウィンドウで積が単調に扱える。
    右端を伸ばして積をかけ、積が k 以上になったら左端を縮めて割る。
    各ステップで「右端固定のまま作れる部分配列数」を加算。
    時間 O(n), 追加メモリ O(1)。
    """
    if k <= 1:  # 正の整数の積は最低1なので、この場合は0
        return 0

    prod = 1
    left = 0
    count = 0

    for right, x in enumerate(nums):
        prod *= x
        # 条件を満たすまで左端を縮める
        while prod >= k and left <= right:
            prod //= nums[left]
            left += 1
        # 右端を固定したときに、新たに有効となる部分配列の数は (right-left+1)
        count += right - left + 1

    return count


# テスト
print(num_subarray_product_less_than_k([10, 5, 2, 6], 100))  # 8
print(num_subarray_product_less_than_k([1, 2, 3], 0))  # 0
print(num_subarray_product_less_than_k([1, 1, 1], 2))  # 6
