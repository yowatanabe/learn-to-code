from typing import List


def shortest_subarray_sum_at_least(errors: List[int], S: int) -> int:
    """
    非負整数配列 errors に対し、連続部分配列の合計が S 以上となる最短長を返す。
    不存在なら 0。時間 O(n)、追加メモリ O(1)。

    アルゴリズム（スライディングウィンドウ）:
      - r を右に伸ばしながら現在和 curr を加算
      - curr >= S になったら、左端 l を可能な限り前進させて最短を更新
      - 要素が非負なので l を進めると curr は必ず減少し、解を見逃さない
    """
    n = len(errors)
    l = 0
    curr = 0
    ans = n + 1  # 不可能値で初期化

    for r, x in enumerate(errors):
        curr += x
        # 目標到達したら、左端をできるだけ縮める
        while curr >= S and l <= r:
            ans = min(ans, r - l + 1)
            curr -= errors[l]
            l += 1

    return 0 if ans == n + 1 else ans


print(shortest_subarray_sum_at_least([1, 2, 3, 4], 6))
print(shortest_subarray_sum_at_least([2, 0, 2, 1, 1], 3))
print(shortest_subarray_sum_at_least([1, 1, 1, 1], 10))
print(shortest_subarray_sum_at_least([], 1))
print(shortest_subarray_sum_at_least([5], 5))
