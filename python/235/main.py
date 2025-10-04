from typing import List


def search_matrix(matrix: List[List[int]], target: int) -> bool:
    """
    右上からの2方向探索（O(m + n)）:
      - 現在値 cur と target を比較
        - cur < target なら「もっと大きい値」がある下方向へ r += 1
        - cur > target なら「もっと小さい値」がある左方向へ c -= 1
      - 一致したら True、範囲外になれば False
    """
    if not matrix or not matrix[0]:
        return False

    m, n = len(matrix), len(matrix[0])
    r, c = 0, n - 1  # 右上から開始

    while r < m and c >= 0:
        cur = matrix[r][c]
        if cur == target:
            return True
        elif cur < target:
            r += 1
        else:
            c -= 1
    return False


# テスト
print(
    search_matrix(
        [
            [1, 4, 7, 11, 15],
            [2, 5, 8, 12, 19],
            [3, 6, 9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30],
        ],
        5,
    )
)  # True

print(
    search_matrix(
        [
            [1, 4, 7, 11, 15],
            [2, 5, 8, 12, 19],
            [3, 6, 9, 16, 22],
            [10, 13, 14, 17, 24],
            [18, 21, 23, 26, 30],
        ],
        20,
    )
)  # False

print(search_matrix([[-5, -3, 0, 2]], -3))  # True
