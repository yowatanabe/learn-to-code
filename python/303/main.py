from typing import List


def spiral_order(matrix: List[List[int]]) -> List[int]:
    """
    m x n 行列を螺旋状に走査した順番の一次元配列を返す。
    """
    if not matrix or not matrix[0]:
        return []

    res = []
    top, bottom = 0, len(matrix) - 1
    left, right = 0, len(matrix[0]) - 1

    while top <= bottom and left <= right:
        # 1. 上端の行（左→右）
        for col in range(left, right + 1):
            res.append(matrix[top][col])
        top += 1

        # 2. 右端の列（上→下）
        for row in range(top, bottom + 1):
            res.append(matrix[row][right])
        right -= 1

        # 3. 下端の行（右→左）※ まだ行が残っている場合のみ
        if top <= bottom:
            for col in range(right, left - 1, -1):
                res.append(matrix[bottom][col])
            bottom -= 1

        # 4. 左端の列（下→上）※ まだ列が残っている場合のみ
        if left <= right:
            for row in range(bottom, top - 1, -1):
                res.append(matrix[row][left])
            left += 1

    return res


if __name__ == "__main__":
    # 実行例1
    matrix1 = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
    ]
    print("例1の入力:", matrix1)
    print("例1の結果:", spiral_order(matrix1))  # [1,2,3,6,9,8,7,4,5]

    # 実行例2
    matrix2 = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
    ]
    print("例2の入力:", matrix2)
    print("例2の結果:", spiral_order(matrix2))  # [1,2,3,4,8,12,11,10,9,5,6,7]

    # 実行例3
    matrix3 = [
        [1],
        [2],
        [3],
    ]
    print("例3の入力:", matrix3)
    print("例3の結果:", spiral_order(matrix3))  # [1,2,3]
