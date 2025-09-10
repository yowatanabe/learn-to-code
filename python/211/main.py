from typing import List


def spiral_order(matrix: List[List[int]]) -> List[int]:
    if not matrix or not matrix[0]:
        return []

    top, bottom = 0, len(matrix) - 1
    left, right = 0, len(matrix[0]) - 1
    res = []

    while top <= bottom and left <= right:
        # 上端: 左→右
        for c in range(left, right + 1):
            res.append(matrix[top][c])
        top += 1

        # 右端: 上→下
        for r in range(top, bottom + 1):
            res.append(matrix[r][right])
        right -= 1

        # まだ行・列が残っているか確認してから下端・左端を処理
        if top <= bottom:
            # 下端: 右→左
            for c in range(right, left - 1, -1):
                res.append(matrix[bottom][c])
            bottom -= 1

        if left <= right:
            # 左端: 下→上
            for r in range(bottom, top - 1, -1):
                res.append(matrix[r][left])
            left += 1

    return res


# テスト
print(spiral_order([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))  # [1,2,3,6,9,8,7,4,5]

print(
    spiral_order([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
)  # [1,2,3,4,8,12,11,10,9,5,6,7]

print(spiral_order([[7]]))  # [7]
