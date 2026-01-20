from typing import List


def find_min_arrow_shots(points: List[List[int]]) -> int:
    if not points:
        return 0

    points.sort(key=lambda x: x[1])  # end でソート
    arrows = 1
    cur_end = points[0][1]

    for start, end in points[1:]:
        if start > cur_end:
            arrows += 1
            cur_end = end  # 新しい矢を end に撃つ
        # start <= cur_end なら同じ矢で割れるので何もしない

    return arrows


# =========================
# 実行例をそのまま動かすコード
# =========================
if __name__ == "__main__":
    cases = [
        ([[10, 16], [2, 8], [1, 6], [7, 12]], 2),
        ([[1, 2], [3, 4], [5, 6], [7, 8]], 4),
        ([[1, 2], [2, 3], [3, 4], [4, 5]], 2),
    ]

    for i, (points, expected) in enumerate(cases, start=1):
        got = find_min_arrow_shots(points)
        print(f"例{i} 入力: points={points}")
        print(f"例{i} 出力: {got} (期待値: {expected})")
        print("-" * 50)
